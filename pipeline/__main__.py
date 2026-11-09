import argparse
import sys

from . import config


def main():
    ap = argparse.ArgumentParser(prog="python3 -m pipeline")
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ["fetch-zeno", "fetch-scans", "ocr", "build", "collate", "apply", "validate", "status"]:
        p = sub.add_parser(name)
        p.add_argument("ids", nargs="*")
        if name == "build":
            p.add_argument("--force", action="store_true")
        if name == "collate":
            p.add_argument("--tei", help="collate this file instead of tei/<id>.xml")
    a = ap.parse_args()
    ids = a.ids or config.IDS
    for v in ids:
        if v not in config.VOLUMES:
            ap.error(f"unknown volume {v}")

    ok = True
    if a.cmd == "fetch-zeno":
        from . import zeno
        for v in ids:
            zeno.fetch(v)
    elif a.cmd == "fetch-scans":
        from . import scans
        for v in ids:
            scans.fetch(v)
    elif a.cmd == "ocr":
        from . import ocr
        for v in ids:
            ocr.run(v)
    elif a.cmd == "build":
        from . import tei
        for v in ids:
            ok &= tei.build(v, a.force)
        tei.write_corpus()
    elif a.cmd == "collate":
        from . import collate
        if a.tei and len(ids) != 1:
            ap.error("--tei needs exactly one volume")
        for v in ids:
            collate.run(v, a.tei)
    elif a.cmd == "apply":
        from . import apply
        for v in ids:
            ok &= apply.run(v)
    elif a.cmd == "validate":
        from . import validate
        for v in ids:
            ok &= validate.run(v)
    elif a.cmd == "status":
        from . import validate
        validate.status(ids)
    sys.exit(0 if ok else 1)


main()
