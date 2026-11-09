"""page images, SBB ALTO and the page map"""

import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor

from lxml import etree

from . import config
from .zeno import get

METS = "{http://www.loc.gov/METS/}"
HEAD = ["order", "label", "ocr_label", "image_url"]


def scan_dir(vid):
    return config.path("cache", "scans", vid)


def alto_dir(vid):
    return config.path("cache", "alto", vid)


def image(vid, order):
    d = scan_dir(vid)
    for ext in ("jpg", "png"):
        p = d / f"f{order:04d}.{ext}"
        if p.exists():
            return p
    raise FileNotFoundError(d / f"f{order:04d}")


def download(url, dest):
    if dest.exists():
        return
    data = get(url)
    if data.lstrip()[:1] == b"<" and dest.suffix == ".jpg":
        raise RuntimeError(f"{url} returned markup, not an image")
    tmp = dest.with_suffix(dest.suffix + ".part")
    tmp.write_bytes(data)
    tmp.rename(dest)


def fetch(vid):
    vol = config.VOLUMES[vid]
    if vol["source"] == "pdf":
        return fetch_pdf(vid)
    ppn = vol["ppn"]
    mets = etree.fromstring(get(f"{config.SBB}{ppn}.mets.xml"))
    rows = []
    for div in mets.iter(f"{METS}div"):
        if div.get("TYPE") != "page":
            continue
        order = int(div.get("ORDER"))
        label = div.get("ORDERLABEL", "").strip()
        rows.append(
            {
                "order": order,
                "label": label if label.isdigit() else "",
                "ocr_label": "",
                "image_url": f"{config.SBB}{ppn}-{order:08d}/full/max/0/default.jpg",
            }
        )
    rows.sort(key=lambda r: r["order"])
    scan_dir(vid).mkdir(parents=True, exist_ok=True)
    alto_dir(vid).mkdir(parents=True, exist_ok=True)
    jobs = []
    for r in rows:
        o = r["order"]
        jobs.append((r["image_url"], scan_dir(vid) / f"f{o:04d}.jpg"))
        jobs.append((f"{config.SBB}{ppn}-{o:08d}.ocr.xml", alto_dir(vid) / f"f{o:04d}.xml"))
    with ThreadPoolExecutor(4) as pool:
        list(pool.map(lambda j: download(*j), jobs))
    write_pages(vid, rows)
    print(f"{vid}: {len(rows)} pages")


def fetch_pdf(vid):
    d = scan_dir(vid)
    pdf = d / "source.pdf"
    if not pdf.exists():
        print(
            f"{vid}: download https://books.google.com/books?id={config.VOLUMES[vid]['google']} "
            f"as PDF in a browser and save it to cache/scans/{vid}/source.pdf"
        )
        return
    if not list(d.glob("f*.png")):
        subprocess.run(["pdftoppm", "-r", "300", "-png", str(pdf), str(d / "f")], check=True)
        for p in d.glob("f-*.png"):
            p.rename(d / f"f{int(p.stem.split('-')[1]):04d}.png")
    orders = sorted(int(p.stem[1:]) for p in d.glob("f[0-9]*.png"))
    old = {int(r["order"]): r for r in config.read_tsv(config.pages_tsv(vid))}
    rows = [
        {
            "order": o,
            "label": old.get(o, {}).get("label", ""),
            "ocr_label": old.get(o, {}).get("ocr_label", ""),
            "image_url": f"source.pdf#page={o}",
        }
        for o in orders
    ]
    write_pages(vid, rows)
    print(f"{vid}: {len(rows)} pages")


def write_pages(vid, rows):
    old = {int(r["order"]): r for r in config.read_tsv(config.pages_tsv(vid))}
    for r in rows:
        # keep hand corrections and detected labels across re-fetches
        if r["order"] in old:
            r["label"] = old[r["order"]]["label"]
            r["ocr_label"] = old[r["order"]]["ocr_label"]
    config.write_tsv(config.pages_tsv(vid), HEAD, rows)


def pages(vid):
    return [
        {**r, "order": int(r["order"])} for r in config.read_tsv(config.pages_tsv(vid))
    ]


def set_ocr_labels(vid, labels):
    """labels: order → detected page number"""
    rows = pages(vid)
    for r in rows:
        r["ocr_label"] = labels.get(r["order"], "")
    if config.VOLUMES[vid]["source"] == "pdf":
        interpolate(rows)
    config.write_tsv(config.pages_tsv(vid), HEAD, rows)
    for r in rows:
        if r["label"] and r["ocr_label"] and r["label"] != r["ocr_label"]:
            print(f"{vid}: f{r['order']:04d} label {r['label']} ≠ ocr {r['ocr_label']}", file=sys.stderr)


def interpolate(rows):
    """labels for a scan without metadata: ocr numbers, gaps filled from the
    constant offset between numbered neighbours"""
    known = [(r["order"], int(r["ocr_label"])) for r in rows if r["ocr_label"]]
    for r in rows:
        o = r["order"]
        prev = [k for k in known if k[0] <= o]
        nxt = [k for k in known if k[0] >= o]
        if not prev:
            r["label"] = ""
        elif prev[-1][0] == o:
            r["label"] = str(prev[-1][1])
        elif nxt and nxt[0][1] - nxt[0][0] == prev[-1][1] - prev[-1][0]:
            r["label"] = str(o + prev[-1][1] - prev[-1][0])
        else:
            r["label"] = ""
