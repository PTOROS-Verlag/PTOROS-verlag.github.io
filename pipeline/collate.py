"""align the TEI against the OCR witnesses and list what nobody confirms"""

import itertools
import re
import shutil
import statistics
import tomllib
import unicodedata
from difflib import SequenceMatcher
from functools import lru_cache

from lxml import etree

from . import config, ocr, scans

T = "{http://www.tei-c.org/ns/1.0}"
TOKEN = re.compile(r"\w+|[^\w\s]")
HEAD = ["key", "kind", "page", "tei", "tesseract", "alto", "crop"]
PER_SHEET = 8
CROP_WIDTH = 1200
PAGE_HEIGHT = 1000
PAD = 40


def tokenize(text):
    return TOKEN.findall(unicodedata.normalize("NFC", text))


# --- TEI side -------------------------------------------------------------


def tei_tokens(path):
    """→ (tokens, elements, pbs, tree). tokens carry page, kind, k (small
    caps), element index and their text node (element, "text"|"tail") with
    offsets; pbs are (page, token index) in document order"""
    tree = etree.parse(str(path))
    tokens, elems, pbs = [], [], []
    state = {"page": None}

    def emit(node, attr, kind, k, ei):
        for m in TOKEN.finditer(getattr(node, attr) or ""):
            tokens.append({"t": m.group(0), "page": state["page"], "kind": kind, "k": k, "el": ei,
                           "node": (node, attr), "a": m.start(), "b": m.end()})

    def walk(el, kind, k, ei):
        tag = el.tag
        if not isinstance(tag, str):
            return
        name = tag[len(T) :] if tag.startswith(T) else tag
        if name == "pb":
            state["page"] = int(el.get("n"))
            pbs.append((state["page"], len(tokens)))
            return
        if name in ("figure", "teiHeader"):
            return
        if name in ("head", "l", "p") and kind is None:
            kind = name
            # lines of one lg share a group; anything else stands alone
            elems.append({"kind": name, "page": state["page"], "group": el.getparent() if name == "l" else el})
            ei = len(elems) - 1
        if name == "hi" and "#k" in (el.get("rendition") or "").split():
            k = True
        if kind:
            emit(el, "text", kind, k, ei)
        for c in el:
            walk(c, kind, k, ei)
            if kind:
                emit(c, "tail", kind, k, ei)

    walk(tree.getroot(), None, False, None)
    return tokens, elems, pbs, tree


def tei_norm(tok):
    return tok["t"].casefold() if tok["kind"] == "head" or tok["k"] else tok["t"]


# --- OCR side -------------------------------------------------------------


class Witness:
    def __init__(self, vid, engine, rules):
        self.vid = vid
        self.engine = engine
        self.rules = [(re.compile(rx), rep) for rx, rep in rules]
        self.cache = {}

    def page(self, order):
        """→ (tokens, lines) of one image"""
        if order not in self.cache:
            try:
                pg = ocr.read(self.vid, order, self.engine)
            except FileNotFoundError:
                pg = {"lines": []}
            toks = []
            for li, ln in enumerate(pg["lines"]):
                for w, box in ln["words"]:
                    for t in tokenize(w):
                        toks.append({"t": t, "order": order, "line": li, "bbox": box})
            self.cache[order] = (toks, pg["lines"])
        return self.cache[order]

    @lru_cache(maxsize=None)
    def variants(self, tok):
        out = [tok]
        for rx, rep in self.rules:
            for v in list(out):
                w = rx.sub(rep, v)
                if w not in out and len(out) < 16:
                    out.append(w)
        return tuple(out)


def match(tei_toks, ocr_toks, w):
    """does the TEI span equal a candidate reading of the OCR span?"""
    fold = any(t["kind"] == "head" or t["k"] for t in tei_toks)
    target = "".join(tei_norm(t) for t in tei_toks)
    if fold:
        target = target.casefold()
    if len(tei_toks) == len(ocr_toks):
        if all(single(t, o, w) for t, o in zip(tei_toks, ocr_toks)):
            return True
    vs = [w.variants(o["t"]) for o in ocr_toks]
    n = 1
    for v in vs:
        n *= len(v)
    if n > 256:
        return False
    for combo in itertools.product(*vs):
        s = "".join(combo)
        if (s.casefold() if fold else s) == target:
            return True
    return False


def single(t, o, w):
    a = tei_norm(t)
    fold = t["kind"] == "head" or t["k"]
    for v in w.variants(o["t"]):
        if (v.casefold() if fold else v) == a:
            return True
    return False


def align(tei_seg, ocr_seg, w):
    """→ per TEI token: (confirmed, (j1, j2) opposing OCR range);
    inserts: TEI position → OCR range"""
    A = [tei_norm(t).casefold() for t in tei_seg]
    B = [o["t"].casefold() for o in ocr_seg]
    res = [None] * len(A)
    inserts = {}
    sm = SequenceMatcher(None, A, B, autojunk=False)
    for op, i1, i2, j1, j2 in sm.get_opcodes():
        if op == "equal":
            for k in range(i2 - i1):
                ok = single(tei_seg[i1 + k], ocr_seg[j1 + k], w)
                res[i1 + k] = (ok, (j1 + k, j1 + k + 1))
        elif op == "replace":
            if len(range(i1, i2)) == len(range(j1, j2)):
                for k in range(i2 - i1):
                    ok = single(tei_seg[i1 + k], ocr_seg[j1 + k], w)
                    res[i1 + k] = (ok, (j1 + k, j1 + k + 1))
                if not all(res[i][0] for i in range(i1, i2)) and match(tei_seg[i1:i2], ocr_seg[j1:j2], w):
                    for i in range(i1, i2):
                        res[i] = (True, res[i][1])
            else:
                ok = match(tei_seg[i1:i2], ocr_seg[j1:j2], w)
                for i in range(i1, i2):
                    res[i] = (ok, (j1, j2))
        elif op == "delete":
            for i in range(i1, i2):
                res[i] = (False, (j1, j1))
        else:
            inserts[i1] = (j1, j2)
    return res, inserts


# --- segments and items ---------------------------------------------------


def segments(tokens, pbs, rows):
    """→ [(page, tei token range, image orders)]"""
    by_label = {}
    for r in rows:
        if r["label"].isdigit():
            by_label.setdefault(int(r["label"]), []).append(r["order"])
    out = []
    for k, (a, start) in enumerate(pbs):
        if k + 1 < len(pbs):
            b, end = pbs[k + 1]
        else:
            b, end = a + 1, len(tokens)
        orders = [o for p in range(a, max(b, a + 1)) for o in by_label.get(p, [])]
        out.append((a, (start, end), sorted(orders)))
    return out


def run(vid, tei_path=None):
    tei_path = tei_path or config.tei_file(vid)
    tokens, elems, pbs, _ = tei_tokens(tei_path)
    rows = scans.pages(vid)
    rules = tomllib.loads(config.path("config", "confusions.toml").read_text(encoding="utf-8"))
    engines = ["tesseract"] + (["alto"] if ocr.has_alto(vid) else [])
    wits = {e: Witness(vid, e, rules[e]["rules"]) for e in engines}
    items = []
    covered = set()
    for page, (s, e), orders in segments(tokens, pbs, rows):
        covered.update(orders)
        seg = tokens[s:e]
        per = {}
        for name, w in wits.items():
            otoks = [t for o in orders for t in w.page(o)[0]]
            res, ins = align(seg, otoks, w)
            per[name] = (otoks, res, ins)
        items += word_items(page, seg, per)
        items += missing_items(page, seg, per)
        if len(orders) == 1:
            items += line_items(page, elems, s, e, tokens, wits["tesseract"], orders[0])
    for r in rows:
        if r["label"].isdigit() and r["order"] not in covered:
            if len(wits["tesseract"].page(r["order"])[0]) >= 20:
                items.append({"key": f"{r['label']}|uncovered", "kind": "uncovered", "page": int(r["label"]), "order": r["order"]})
    for a in config.read_tsv(config.anomalies_tsv(vid)):
        items.append({"key": f"{a['page']}|pb|{a['marker']}", "kind": "pb", "page": int(a["page"]), "tei": a["action"], "leaf": a["leaf"]})

    dedupe(items)
    dec = {r["key"]: r["decision"] for r in config.read_tsv(config.decisions_tsv(vid))}
    open_items = [it for it in items if it["key"] not in dec]
    out_dir = config.path("review", vid)
    if out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True)
    write_review(vid, open_items, rows, "sheet", config.path("review", f"{vid}.tsv"))
    # unsure items keep their crops for the user
    write_review(vid, [it for it in items if dec.get(it["key"]) == "unsure"], rows, "unsure",
                 config.path("review", vid, "unsure.tsv"))
    print(f"{vid}: {len(tokens)} tokens, {len(open_items)} open, {len(items) - len(open_items)} decided")
    return tokens, items, open_items


def neighbours(seg, i, j):
    left = seg[i - 1]["t"] if i > 0 else "^"
    right = seg[j]["t"] if j < len(seg) else "$"
    return left, right


def word_items(page, seg, per):
    out = []
    conf = [any(per[n][1][i][0] for n in per) for i in range(len(seg))]
    i = 0
    while i < len(seg):
        if conf[i]:
            i += 1
            continue
        j = i
        while j < len(seg) and not conf[j]:
            j += 1
        left, right = neighbours(seg, i, j)
        span = " ".join(t["t"] for t in seg[i:j])
        it = {"key": f"{page}|{left}|{span}|{right}", "kind": "word", "page": page, "tei": span, "ocr": {}}
        for n, (otoks, res, _) in per.items():
            j1 = min(res[k][1][0] for k in range(i, j))
            j2 = max(res[k][1][1] for k in range(i, j))
            it[n] = " ".join(o["t"] for o in otoks[j1:j2])
            it["ocr"][n] = otoks[j1:j2] or nearest(otoks, res, i)
        out.append(it)
        i = j
    return out


def nearest(otoks, res, i):
    """OCR token aligned next to TEI token i, for locating a crop"""
    for k in list(range(i, -1, -1)) + list(range(i, len(res))):
        a, b = res[k][1]
        if a < len(otoks):
            return [otoks[a]]
    return []


def missing_items(page, seg, per):
    out = []
    positions = None
    for n, (otoks, _, ins) in per.items():
        good = {
            p for p, (a, b) in ins.items()
            if any(o["t"].isalnum() and len(o["t"]) >= 2 for o in otoks[a:b])
        }
        positions = good if positions is None else positions & good
    for p in sorted(positions or ()):
        left, right = neighbours(seg, p, p)
        it = {"key": f"{page}|{left}|∅|{right}", "kind": "missing", "page": page, "tei": "", "ocr": {}}
        for n, (otoks, _, ins) in per.items():
            a, b = ins[p]
            it[n] = " ".join(o["t"] for o in otoks[a:b])
            it["ocr"][n] = otoks[a:b]
        out.append(it)
    return out


def line_items(page, elems, s, e, tokens, tess, order):
    eis = sorted({t["el"] for t in tokens[s:e]})
    els = [elems[i] for i in eis]
    if not els or any(el["kind"] == "p" for el in els):
        return []
    _, lines = tess.page(order)
    out = []
    if len(els) != len(lines):
        out.append({"key": f"{page}|lines", "kind": "lines", "page": page, "order": order,
                    "tei": str(len(els)), "tesseract": str(len(lines))})
        return out
    if len(lines) < 3:
        return out
    tops = sorted(ln["bbox"][1] for ln in lines)
    gaps = [b - a for a, b in zip(tops, tops[1:])]
    med = statistics.median(gaps)
    ocr_breaks = {i for i, g in enumerate(gaps) if g > 1.6 * med}
    tei_breaks = {i for i in range(len(els) - 1) if els[i]["group"] is not els[i + 1]["group"]}
    for i in sorted(ocr_breaks ^ tei_breaks):
        out.append({"key": f"{page}|stanza|{i}", "kind": "stanza", "page": page, "order": order,
                    "tei": "break" if i in tei_breaks else "", "tesseract": "break" if i in ocr_breaks else ""})
    return out


def dedupe(items):
    seen = {}
    for it in items:
        k = it["key"]
        seen[k] = seen.get(k, 0) + 1
        if seen[k] > 1:
            it["key"] = f"{k}#{seen[k]}"


# --- output ----------------------------------------------------------------


def write_review(vid, items, rows, prefix, tsv_path):
    from PIL import Image, ImageDraw, ImageFont

    out_dir = config.path("review", vid)
    by_label = {}
    for r in rows:
        if r["label"].isdigit():
            by_label.setdefault(int(r["label"]), r["order"])
    font = ImageFont.load_default(size=32)
    crops = []
    for n, it in enumerate(items, 1):
        sheet = (n - 1) // PER_SHEET + 1
        it["crop"] = f"{prefix}-{sheet:03d}.png#{n}"
        crops.append(crop(vid, it, by_label))
    for s in range(0, len(items), PER_SHEET):
        ims = crops[s : s + PER_SHEET]
        width = max((im.width for im in ims if im), default=CROP_WIDTH)
        height = sum((im.height if im else 0) + 44 for im in ims)
        sheet = Image.new("RGB", (width, height), "white")
        d = ImageDraw.Draw(sheet)
        y = 0
        for k, im in enumerate(ims):
            d.rectangle([0, y, width, y + 40], fill=(255, 230, 150))
            d.text((8, y + 2), str(s + k + 1), fill="black", font=font)
            y += 44
            if im:
                sheet.paste(im, (0, y))
                y += im.height
        sheet.save(out_dir / f"{prefix}-{s // PER_SHEET + 1:03d}.png")
    tsv = []
    for it in items:
        tsv.append({h: str(it.get(h, "")).replace("\t", " ") for h in HEAD})
    config.write_tsv(tsv_path, HEAD, tsv)


def crop(vid, it, by_label):
    from PIL import Image

    if it["kind"] in ("word", "missing"):
        toks = it["ocr"].get("tesseract") or []
        order = toks[0]["order"] if toks else by_label.get(it["page"])
        if order is None:
            return None
        im = Image.open(scans.image(vid, order))
        if not toks:
            im.thumbnail((CROP_WIDTH, PAGE_HEIGHT))
            return im
        boxes = [t["bbox"] for t in toks if t["order"] == order]
        y0 = max(0, min(b[1] for b in boxes) - PAD)
        y1 = min(im.height, max(b[3] for b in boxes) + PAD, y0 + 500)
        im = im.crop((0, y0, im.width, y1))
        return im.resize((CROP_WIDTH, round(im.height * CROP_WIDTH / im.width)))
    order = it.get("order") or by_label.get(it["page"])
    if order is None:
        return None
    im = Image.open(scans.image(vid, order))
    return im.resize((round(im.width * PAGE_HEIGHT / im.height), PAGE_HEIGHT))
