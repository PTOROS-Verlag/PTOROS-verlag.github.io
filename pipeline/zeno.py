"""crawl a zeno volume into a frozen json snapshot"""

import datetime
import html
import json
import re
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor

from . import config

MAIN_OPEN = '<div class="zenoCOMain">'
FOOTER_OPEN = '<div class="zenoCOFooter">'
HREF = re.compile(r'<a\s+href="([^"]+)"[^>]*>(.*?)</a>', re.S)


def get(url, tries=5):
    for i in range(tries):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": config.UA})
            with urllib.request.urlopen(req, timeout=60) as r:
                return r.read()
        except Exception:
            if i == tries - 1:
                raise
            time.sleep(10 * (i + 1))


def get_page(path, tries=5):
    """zeno now and then serves another node's main content under the right
    url, so a page counts only once two fetches agree"""
    url = config.ZENO_BASE + path
    prev = None
    for i in range(tries):
        page = get(url).decode("iso-8859-1")
        main = page[page.find(MAIN_OPEN) : page.find("<!-- end content -->")]
        if main == prev:
            return page
        prev = main
        time.sleep(i)
    raise RuntimeError(f"zeno answers inconsistently for {url}")


def strip_div(s, cls):
    """remove every <div class="cls">…</div>, honouring nested divs"""
    opener = f'<div class="{cls}">'
    while (a := s.find(opener)) >= 0:
        depth, i = 0, a
        for m in re.finditer(r"<div\b|</div>", s[a:]):
            depth += 1 if m.group(0) == "<div" else -1
            if depth == 0:
                i = a + m.end()
                break
        else:
            raise ValueError(f"unclosed {cls}")
        s = s[:a] + s[i:]
    return s


def text(fragment):
    return html.unescape(re.sub(r"<[^>]+>", "", fragment)).strip()


def parse(page, path):
    a = page.index(MAIN_OPEN) + len(MAIN_OPEN)
    b = page.index(FOOTER_OPEN)
    main = page[a:b].rstrip()
    assert main.endswith("</div>"), path
    main = main[: -len("</div>")]
    children, seen = [], set()
    for m in HREF.finditer(main):
        href = m.group(1)
        if href.startswith(path + "/") and "/" not in href[len(path) + 1 :]:
            if href not in seen:
                seen.add(href)
                children.append((href, text(m.group(2))))
    footer = page[b:]
    cats = []
    m = re.search(r"Kategorien:</div>\s*<div[^>]*>(.*?)</div>", footer, re.S)
    if m:
        cats = [text(x) for _, x in HREF.findall(m.group(1))]
    return {
        "categories": cats,
        "html": strip_div(main, "zenoTRNavBottom").strip(),
    }, children


def fetch(vid):
    vol = config.VOLUMES[vid]
    root = config.ZENO_GA + vol["zeno"]
    pages, children = {}, {}
    level = [root]
    with ThreadPoolExecutor(4) as pool:
        while level:
            bodies = pool.map(get_page, level)
            nxt = []
            for p, body in zip(level, bodies):
                pages[p], children[p] = parse(body, p)
                nxt += [c for c, _ in children[p]]
            print(f"{vid}: {len(pages)} pages", flush=True)
            level = nxt

    nodes = []

    def walk(p, depth, title):
        nodes.append({"path": p, "depth": depth, "title": title, **pages[p]})
        for c, t in children[p]:
            walk(c, depth + 1, t)

    walk(root, 0, vol["title"])
    seen = {}
    for n in nodes:
        if "zenoTXKonk" in n["html"]:
            if n["html"] in seen:
                raise RuntimeError(f"{n['path']} has the content of {seen[n['html']]}")
            seen[n["html"]] = n["path"]
    snap = {
        "fetched": datetime.date.today().isoformat(),
        "root": config.ZENO_BASE + root,
        "nodes": nodes,
    }
    out = config.snapshot(vid)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(snap, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(f"{vid}: {len(nodes)} nodes → {out.relative_to(config.ROOT)}")


def load(vid):
    return json.loads(config.snapshot(vid).read_text(encoding="utf-8"))
