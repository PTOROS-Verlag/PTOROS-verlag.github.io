"""tesseract witness, and line/token parsing for both OCR witnesses"""

import csv
import io
import os
import re
import subprocess
from concurrent.futures import ThreadPoolExecutor

from lxml import etree

from . import config, scans


def ocr_dir(vid):
    return config.path("cache", "ocr", vid)


def tesseract(img, out):
    if out.exists():
        return
    r = subprocess.run(
        ["tesseract", str(img), "stdout", "-l", "deu", "--psm", "4", "tsv"],
        capture_output=True,
        text=True,
        check=True,
        # one process per core; tesseract's own threads would oversubscribe
        env={**os.environ, "OMP_THREAD_LIMIT": "1"},
    )
    tmp = out.with_suffix(".part")
    tmp.write_text(r.stdout, encoding="utf-8")
    tmp.rename(out)


def run(vid):
    rows = scans.pages(vid)
    if not rows:
        print(f"{vid}: no page map; run fetch-scans first")
        return
    d = ocr_dir(vid)
    d.mkdir(parents=True, exist_ok=True)
    jobs = [(scans.image(vid, r["order"]), d / f"f{r['order']:04d}.tsv") for r in rows]
    with ThreadPoolExecutor(os.cpu_count()) as pool:
        list(pool.map(lambda j: tesseract(*j), jobs))
    labels = {}
    for r in rows:
        page = read(vid, r["order"], "tesseract")
        if page["number"] is None and has_alto(vid):
            page = read(vid, r["order"], "alto")
        if page["number"] is not None:
            labels[r["order"]] = page["number"]
    scans.set_ocr_labels(vid, labels)
    print(f"{vid}: {len(rows)} pages, {len(labels)} page numbers detected")


def has_alto(vid):
    return config.VOLUMES[vid]["source"] == "sbb"


# --- parsing ------------------------------------------------------------


def lines_tesseract(path):
    """→ lines; a line is {"bbox", "words": [(text, bbox)]}"""
    text = path.read_text(encoding="utf-8")
    groups = {}
    for row in csv.DictReader(io.StringIO(text), delimiter="\t", quoting=csv.QUOTE_NONE):
        if int(row["level"]) != 5 or float(row["conf"]) < 0 or not (row["text"] or "").strip():
            continue
        box = (int(row["left"]), int(row["top"]), int(row["left"]) + int(row["width"]), int(row["top"]) + int(row["height"]))
        key = (int(row["block_num"]), int(row["par_num"]), int(row["line_num"]))
        groups.setdefault(key, []).append((row["text"].strip(), box))
    return [{"bbox": union(b for _, b in ws), "words": ws} for ws in groups.values()]


def lines_alto(path):
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        data = data[3:]
    root = etree.fromstring(data)
    lines = []
    for tl in root.iter("{*}TextLine"):
        ws = []
        for s in tl.iter("{*}String"):
            sub = s.get("SUBS_TYPE")
            if sub == "HypPart2":
                continue
            t = s.get("SUBS_CONTENT") if sub == "HypPart1" and s.get("SUBS_CONTENT") else s.get("CONTENT")
            if not t or not t.strip():
                continue
            x, y = int(float(s.get("HPOS", 0))), int(float(s.get("VPOS", 0)))
            box = (x, y, x + int(float(s.get("WIDTH", 0))), y + int(float(s.get("HEIGHT", 0))))
            ws.append((t.strip(), box))
        if ws:
            lines.append({"bbox": union(b for _, b in ws), "words": ws})
    return lines


def union(boxes):
    boxes = list(boxes)
    return (min(b[0] for b in boxes), min(b[1] for b in boxes), max(b[2] for b in boxes), max(b[3] for b in boxes))


def read(vid, order, engine):
    """→ {"number", "lines"}: lines without page number and signatures,
    end-of-line hyphenation joined"""
    if engine == "tesseract":
        lines = lines_tesseract(ocr_dir(vid) / f"f{order:04d}.tsv")
    else:
        lines = lines_alto(scans.alto_dir(vid) / f"f{order:04d}.xml")
    digits = [ln for ln in lines if all(t.isdigit() for t, _ in ln["words"])]
    kept = [ln for ln in lines if ln not in digits]
    # the GA sets page numbers below (or above) the type area, well inside
    # the page, so "outermost line" is the test rather than a page margin
    number = None
    singles = [ln for ln in digits if len(ln["words"]) == 1]
    if singles:
        top = min(singles, key=lambda ln: ln["bbox"][1])
        bottom = max(singles, key=lambda ln: ln["bbox"][3])
        if not kept or bottom["bbox"][1] > max(ln["bbox"][3] for ln in kept):
            number = bottom["words"][0][0]
        elif top["bbox"][3] < min(ln["bbox"][1] for ln in kept):
            number = top["words"][0][0]
    for a, b in zip(kept, kept[1:]):
        if not a["words"] or not b["words"]:
            continue
        last, first = a["words"][-1], b["words"][0]
        if re.search(r"[^\W\d_]-$", last[0]) and first[0][:1].islower():
            a["words"][-1] = (last[0][:-1] + first[0], last[1])
            b["words"] = b["words"][1:]
    kept = [ln for ln in kept if ln["words"]]
    return {"number": number, "lines": kept}
