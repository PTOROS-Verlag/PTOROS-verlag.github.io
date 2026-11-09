import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ZENO_BASE = "http://www.zeno.org"
ZENO_GA = "/Literatur/M/George,+Stefan/Gesamtausgabe+der+Werke/"
SBB = "https://content.staatsbibliothek-berlin.de/dc/"
UA = "george-tei/1.0"

with open(ROOT / "config" / "volumes.toml", "rb") as f:
    VOLUMES = tomllib.load(f)

IDS = list(VOLUMES)


def path(*parts):
    return ROOT.joinpath(*parts)


def snapshot(vid):
    return path("sources", "zeno", f"{vid}.json")


def pages_tsv(vid):
    return path("sources", "pages", f"{vid}.tsv")


def anomalies_tsv(vid):
    return path("sources", "anomalies", f"{vid}.tsv")


def tei_file(vid):
    return path("tei", f"{vid}.xml")


def decisions_tsv(vid):
    return path("decisions", f"{vid}.tsv")


def read_tsv(p):
    """rows as dicts; header row gives the keys. missing file → []"""
    if not p.exists():
        return []
    lines = p.read_text(encoding="utf-8").splitlines()
    head = lines[0].split("\t")
    return [dict(zip(head, l.split("\t"))) for l in lines[1:] if l]


def write_tsv(p, head, rows):
    p.parent.mkdir(parents=True, exist_ok=True)
    out = ["\t".join(head)]
    out += ["\t".join(str(r.get(h, "")) for h in head) for r in rows]
    p.write_text("\n".join(out) + "\n", encoding="utf-8")
