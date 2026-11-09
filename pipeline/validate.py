"""schema and consistency checks; review status"""

import collections
import subprocess
import unicodedata

from lxml import etree

from . import config, scans

T = "{http://www.tei-c.org/ns/1.0}"


def bad_char(ch):
    o = ord(ch)
    if o < 0x20 and ch not in "\t\n\r":
        return True
    return ch == "\ufffd" or unicodedata.category(ch) == "Co"


def run(vid):
    path = config.tei_file(vid)
    if not path.exists():
        print(f"{vid}: no {path.relative_to(config.ROOT)}")
        return False
    ok = True
    r = subprocess.run(["jing", str(config.path("schema", "basisformat.rng")), str(path)], capture_output=True, text=True)
    if r.returncode:
        print(r.stdout + r.stderr, end="")
        ok = False
    tree = etree.parse(str(path))
    orders = {f"#f{p['order']:04d}" for p in scans.pages(vid)}
    last = None
    for pb in tree.iter(f"{T}pb"):
        n = pb.get("n", "")
        if not n.isdigit() or (last is not None and int(n) <= last):
            print(f"{vid}: pb n={n!r} after {last} (line {pb.sourceline})")
            ok = False
        else:
            last = int(n)
        if pb.get("facs") not in orders:
            print(f"{vid}: pb n={n} facs={pb.get('facs')!r} not in page map (line {pb.sourceline})")
            ok = False
    text = path.read_text(encoding="utf-8")
    for i, line in enumerate(text.splitlines(), 1):
        for ch in line:
            if bad_char(ch):
                print(f"{vid}: line {i}: bad character U+{ord(ch):04X}")
                ok = False
    inv = collections.Counter(ch for ch in text if ord(ch) > 127)
    print(f"{vid}: " + " ".join(f"{ch}({unicodedata.name(ch, '?')}):{n}" for ch, n in sorted(inv.items())))
    print(f"{vid}: {'ok' if ok else 'FAILED'}")
    return ok


def status(ids):
    from . import collate

    unsure = []
    for vid in ids:
        if not config.tei_file(vid).exists() or not scans.pages(vid):
            print(f"{vid}: not built or no scans")
            continue
        tokens, items, open_items = collate.run(vid)
        dec = config.read_tsv(config.decisions_tsv(vid))
        n_unsure = sum(1 for d in dec if d["decision"] == "unsure")
        mism = [r for r in scans.pages(vid) if r["label"] and r["ocr_label"] and r["label"] != r["ocr_label"]]
        print(f"{vid}: {len(tokens)} tokens, {len(open_items)} open, {n_unsure} unsure, {len(mism)} page-label mismatches")
        crops = {it["key"]: it for it in items}
        for d in dec:
            if d["decision"] == "unsure":
                it = crops.get(d["key"], {})
                unsure.append((vid, d, it))
    out = ["# Unsichere Stellen", ""]
    if not unsure:
        out.append("Keine.")
    for vid, d, it in unsure:
        out.append(f"- **{vid}** `{d['key']}`: {d.get('note', '')}")
        out.append(f"  - TEI: {it.get('tei', '')} · tesseract: {it.get('tesseract', '')} · alto: {it.get('alto', '')}")
        out.append(f"  - Ausschnitt: review/{vid}/{it.get('crop', '')}")
    p = config.path("review", "unsure.md")
    p.parent.mkdir(exist_ok=True)
    p.write_text("\n".join(out) + "\n", encoding="utf-8")
