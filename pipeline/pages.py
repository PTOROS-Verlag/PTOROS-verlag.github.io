"""review aid: place the page breaks of a TEI master where the OCR has them.

zeno's markers mislead at section starts (section-title pages carry none),
so the whole volume is aligned once against the tesseract text of all pages
and every element gets the page its words are found on. Page breaks between
elements are then set anew; those inside an element are left alone. The
result is a proposal to check against the images, not a verdict."""

import collections
from difflib import SequenceMatcher

from lxml import etree

from . import collate, config, ocr, scans, tei

T = "{http://www.tei-c.org/ns/1.0}"
TEXTUAL = (f"{T}head", f"{T}l", f"{T}p")


def ocr_pages(vid):
    """printed page → casefolded tesseract tokens"""
    pages = {}
    for r in scans.pages(vid):
        if r["label"].isdigit() and int(r["label"]) not in pages:
            try:
                pg = ocr.read(vid, r["order"], "tesseract")
            except FileNotFoundError:
                continue
            pages[int(r["label"])] = [
                t.casefold() for ln in pg["lines"] for w, _ in ln["words"] for t in collate.tokenize(w)
            ]
    return pages


def elements(root):
    """head/l/p/figure outside each other, with the page the TEI gives them"""
    els, page = [], None
    for el in root.iter(f"{T}pb", *TEXTUAL, f"{T}figure"):
        if el.tag == f"{T}pb":
            page = int(el.get("n"))
            continue
        if any(a.tag in (f"{T}figure", f"{T}teiHeader", *TEXTUAL) for a in el.iterancestors()):
            continue
        inner = [int(p.get("n")) for p in el.iter(f"{T}pb")]
        toks = [] if el.tag == f"{T}figure" else [t.casefold() for t in collate.tokenize("".join(el.itertext()))]
        els.append({"el": el, "tei": page, "toks": toks, "inner": inner, "ocr": None})
        if inner:
            page = inner[-1]
    return els


def assign(els, pages):
    """set e["ocr"]: the page each element starts on, monotone"""
    A, owner = [], []
    for k, e in enumerate(els):
        if e["tei"] is not None:
            A += e["toks"]
            owner += [k] * len(e["toks"])
    B, bpage = [], []
    for p in sorted(pages):
        B += pages[p]
        bpage += [p] * len(pages[p])
    hits = collections.defaultdict(list)
    for blk in SequenceMatcher(None, A, B, autojunk=False).get_matching_blocks():
        for d in range(blk.size):
            if A[blk.a + d][0].isalnum():
                hits[owner[blk.a + d]].append((bpage[blk.b + d], len(A[blk.a + d])))
    own = {}
    for k, e in enumerate(els):
        ps = collections.Counter(p for p, _ in hits[k])
        # sigla like "II" or "W. L." match anywhere
        weak = e["el"].tag == f"{T}head" and sum(n for _, n in hits[k]) < 4
        if not ps or weak:
            continue
        if e["inner"]:
            # a paragraph across pages starts on the first page it really uses
            own[k] = min(q for q, n in ps.items() if n >= 2 or len(ps) == 1)
        else:
            own[k] = ps.most_common(1)[0][0]
    prev = 0
    for k, e in enumerate(els):
        if e["tei"] is None:
            continue
        if k in own:
            p = own[k]
        elif e["el"].tag == f"{T}head":
            # an unrecognised heading sits on the page of what it heads
            p = next((own[j] for j in range(k + 1, len(els)) if j in own), prev or e["tei"])
        else:
            p = prev or e["tei"]
        e["ocr"] = max(p, prev)
        prev = e["inner"][-1] if e["inner"] else e["ocr"]


def align(vid, write=False):
    path = config.tei_file(vid)
    root = etree.parse(str(path)).getroot()
    els = elements(root)
    assign(els, ocr_pages(vid))
    for e in els:
        if e["ocr"] != e["tei"]:
            print(f"{vid}: {e['tei']} → {e['ocr']}: {e['el'].tag[len(T):]} {' '.join(e['toks'])[:60]}")
    if not write:
        return True
    facs = tei.page_map(vid)
    for pb in list(root.iter(f"{T}pb")):
        if not any(a.tag in (*TEXTUAL, f"{T}teiHeader") for a in pb.iterancestors()):
            pb.getparent().remove(pb)
    last = 0
    for e in els:
        p = e["ocr"]
        if p is not None and p > last:
            e["el"].addprevious(etree.Element(f"{T}pb", {"n": str(p), "facs": f"#f{facs[p]:04d}"}))
            last = p
        if e["inner"]:
            last = max(last, e["inner"][-1])
    path.write_bytes(tei.dump(root))
    return True
