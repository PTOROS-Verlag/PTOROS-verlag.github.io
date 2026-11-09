"""apply `fix` decisions to the TEI master"""

import sys

from . import config, tei
from .collate import tei_tokens, tokenize


def locate(page, left, want, right, nth, tokens, starts):
    """→ index range of the TEI tokens a collation key names"""
    hits = []
    for i in range(len(tokens) + 1):
        j = i + len(want)
        if j > len(tokens) or [t["t"] for t in tokens[i:j]] != want:
            continue
        near = tokens[i:j] or tokens[max(0, i - 1) : i + 1]
        if not any(t["page"] == page for t in near):
            continue
        if left == "^":
            if i not in starts:
                continue
        elif i in starts or i == 0 or tokens[i - 1]["t"] != left:
            continue
        if right == "$":
            if j not in starts and j != len(tokens):
                continue
        elif j in starts or j == len(tokens) or tokens[j]["t"] != right:
            continue
        hits.append((i, j))
    return hits[nth - 1] if len(hits) >= nth else None


def run(vid):
    fixes = [r for r in config.read_tsv(config.decisions_tsv(vid)) if r["decision"] == "fix"]
    path = config.tei_file(vid)
    tokens, _, pbs, tree = tei_tokens(path)
    starts = {i for _, i in pbs}
    edits, bad, done = [], [], 0
    for r in fixes:
        base, _, nth = r["key"].partition("#")
        page, left, span, right = base.split("|")
        page, nth = int(page), int(nth or 1)
        want = [] if span == "∅" else span.split(" ")
        hit = locate(page, left, want, right, nth, tokens, starts)
        if hit is None:
            if locate(page, left, tokenize(r["text"]), right, nth, tokens, starts):
                done += 1
            else:
                bad.append(r["key"])
            continue
        i, j = hit
        if i == j:
            # insertion: `text` replaces what lies between the neighbours
            a, b = tokens[i - 1], tokens[i]
            node, lo, hi = a["node"], a["b"], b["a"]
            same = a["node"] == b["node"]
        else:
            first, last = tokens[i], tokens[j - 1]
            node, lo, hi = first["node"], first["a"], last["b"]
            same = first["node"] == last["node"]
        if not same:
            bad.append(r["key"])
            continue
        edits.append((i, node, lo, hi, r["text"]))
    if bad:
        for k in bad:
            print(f"{vid}: not found in one text node: {k}", file=sys.stderr)
        return False
    # reverse document order keeps earlier offsets valid
    for _, (el, attr), lo, hi, text in sorted(edits, key=lambda e: (e[0], e[2]), reverse=True):
        s = getattr(el, attr)
        setattr(el, attr, s[:lo] + text + s[hi:])
    if edits:
        path.write_bytes(tei.dump(tree.getroot()))
    print(f"{vid}: {len(edits)} fixes applied, {done} already in place")
    return True
