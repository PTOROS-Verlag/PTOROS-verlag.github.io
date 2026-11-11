"""typeset the poems in the StG-Schrift as an epubli Taschenbuch:
XSLT 3 to Typst, then typst"""

import os
import re
import subprocess
import sys

from . import config

FONT = config.path("cache", "fonts", "StefanGeorge.otf")
# epubli softcover, the binding with the lower limit
MAX_PAGES = 784


def run(name):
    """name: a volume id, or "werke" for tei/werke.xml with all volumes"""
    if not FONT.exists():
        print(f"{FONT.relative_to(config.ROOT)} missing (the font is not redistributable; see README)", file=sys.stderr)
        return False
    src = config.path("tei", f"{name}.xml")
    typ = config.path("cache", "typst", f"{name}.typ")
    pdf = config.path("pdf", f"{name}.pdf")
    typ.parent.mkdir(parents=True, exist_ok=True)
    pdf.parent.mkdir(parents=True, exist_ok=True)
    xslt = ["saxon-he", f"-s:{src}", f"-xsl:{config.path('typst', 'tei.xsl')}", f"-o:{typ}", "-xi:on"]
    if subprocess.run(xslt).returncode:
        return False
    env = dict(os.environ)
    env["TYPST_FONT_PATHS"] = os.pathsep.join(p for p in (str(FONT.parent), env.get("TYPST_FONT_PATHS")) if p)
    if subprocess.run(["typst", "compile", "--root", str(config.ROOT), str(typ), str(pdf)], env=env).returncode:
        return False
    info = subprocess.run(["pdfinfo", str(pdf)], capture_output=True, text=True).stdout
    pages = int(re.search(r"^Pages:\s+(\d+)", info, re.M).group(1))
    print(f"{name}: {pdf.relative_to(config.ROOT)}, {pages} pages")
    if pages > MAX_PAGES:
        print(f"{name}: more than the {MAX_PAGES} pages epubli binds", file=sys.stderr)
        return False
    return True
