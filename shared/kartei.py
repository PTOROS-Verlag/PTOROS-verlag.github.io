"""Generate covers and the website from the kartei (books.toml).

    kartei.py cover SLUG                 print the cover's LaTeX source
    kartei.py website OUT COVERS         write OUT/index.html and OUT/img/, cropping
                                         the front covers from COVERS/SLUG/cover.pdf
"""

import html
import re
import shutil
import subprocess
import sys
import tomllib
from pathlib import Path
from string import Template

root = Path(__file__).resolve().parent.parent
kartei = tomllib.loads((root / "books.toml").read_text())
fmt = kartei["format"]


def book(slug):
    return next(b for b in kartei["book"] if b["slug"] == slug)


def paragraphs(text):
    """Paragraphs of lines; a line ending in a backslash breaks."""
    for para in re.split(r"\n\s*\n", text.strip()):
        lines = [l.strip() for l in para.splitlines()]
        yield [(l.removesuffix("\\").rstrip(), l.endswith("\\")) for l in lines]


def convert(text, escape, em, strong, mark, linebreak, paragraph):
    out = []
    for para in paragraphs(text):
        s = ""
        for line, breaks in para:
            s += escape(line) + (linebreak if breaks else " ")
        s = s.strip()
        s = re.sub(r"==(.+?)==", lambda m: mark(m[1]), s)
        s = re.sub(r"\*(.+?)\*", lambda m: strong(m[1]), s)
        s = re.sub(r"(?<!\w)_(.+?)_(?!\w)", lambda m: em(m[1]), s)
        out.append(paragraph(s))
    return "\n".join(out)


def latex(text):
    def escape(s):
        return re.sub(r"([&%$#{}])", r"\\\1", s)

    return convert(
        text,
        escape,
        em=lambda s: rf"\emph{{{s}}}",
        strong=lambda s: rf"\textbf{{{s}}}",
        mark=lambda s: s,
        linebreak="\\\\\n",
        paragraph=lambda s: s + "\n",
    )


def html_inline(text):
    return convert(
        text,
        html.escape,
        em=lambda s: f"<em>{s}</em>",
        strong=lambda s: f"<strong>{s}</strong>",
        mark=lambda s: f"<mark>{s}</mark>",
        linebreak=" ",
        paragraph=lambda s: s,
    )


def html_block(text):
    return convert(
        text,
        html.escape,
        em=lambda s: f"<em>{s}</em>",
        strong=lambda s: f"<strong>{s}</strong>",
        mark=lambda s: f"<mark>{s}</mark>",
        linebreak="<br>\n",
        paragraph=lambda s: f"<p>{s}</p>",
    )


def quotes(b, where):
    return [q for q in b.get("quote", []) if q.get(where, True)]


def cover(slug):
    b = book(slug)
    back = []
    if b.get("description-on-cover", True):
        back.append(latex(b["description"]))
    for q in quotes(b, "cover"):
        source = f"\\\\\n\\mbox{{}}\\hfill({latex(q['source']).strip()})" if "source" in q else ""
        back.append(f"\\begin{{quote}}\n\\emph{{%\n{latex(q['text']).strip()}}}{source}\n\\end{{quote}}\n")
    template = Template((root / "shared" / "cover.tex").read_text())
    return template.substitute(
        spine=f"{b['spine']}mm",
        width=f"{fmt['width']}mm",
        height=f"{fmt['height']}mm",
        bleed=f"{fmt['bleed']}mm",
        author=latex(b["author"]).strip(),
        title=latex(b.get("short-title", b["title"])).strip(),
        cover_title=latex(b.get("cover-title", b["title"])).strip(),
        subtitle=latex(b.get("subtitle", "")).strip(),
        back="\n\\medskip\n\n".join(back),
    )


def article(b):
    isbn = b["isbn"].replace("-", "")
    title = html_inline(b["title"])
    if "title-translation" in b:
        title += f" ({html_inline(b['title-translation'])})"
    author = html_inline(b["author"])
    if "author-translation" in b:
        author += f" ({html_inline(b['author-translation'])})"
    subtitle = f'\n<p class="subtitle">{html_inline(b["subtitle"])}</p>' if "subtitle" in b else ""
    desc = [html_block(b["description"])]
    for q in quotes(b, "website"):
        footer = f"\n<footer>{html_inline(q['source'])}</footer>" if "source" in q else ""
        desc.append(f"<blockquote>{html_inline(q['text'])}{footer}</blockquote>")
    links = "\n".join(
        f'<a href="{html.escape(url)}" target="_blank">{html.escape(name)}</a>'
        for name, url in b["links"].items()
    )
    return f"""<article class="book">
<img src="img/{isbn}.png" alt="{html.escape(b['title'])}" class="cover">
<div class="info">
<h2>{title}</h2>{subtitle}
<p class="author">von {author}</p>
<div class="desc">
{chr(10).join(desc)}
</div>
<ul class="meta">
<li><strong>Preis:</strong> {b['price']} €</li>
<li><strong>Seiten:</strong> {b['pages']}</li>
<li><strong>ISBN:</strong> {b['isbn']}</li>
</ul>
<p class="links">
{links}
</p>
</div>
</article>"""


def crop_front(b, pdf, png):
    """Render the front panel of a cover: right of back cover and spine, inside the bleed."""
    dpi = 96
    px = lambda mm: round(mm / 25.4 * dpi)
    x = fmt["bleed"] + fmt["width"] + b["spine"]
    subprocess.run(
        ["pdftoppm", "-png", "-singlefile", "-r", str(dpi),
         "-x", str(px(x)), "-y", str(px(fmt["bleed"])),
         "-W", str(px(fmt["width"])), "-H", str(px(fmt["height"])),
         pdf, png.with_suffix("")],
        check=True,
    )


def website(out, covers):
    site = root / "website"
    shutil.copytree(site, out, dirs_exist_ok=True)
    page = (site / "index.html").read_text()
    # a card without isbn is a book not yet out
    published = [b for b in kartei["book"] if "isbn" in b]
    articles = "\n".join(article(b) for b in published)
    (out / "index.html").write_text(page.replace("<!-- books -->", articles))
    for b in published:
        isbn = b["isbn"].replace("-", "")
        crop_front(b, covers / b["slug"] / "cover.pdf", out / "img" / f"{isbn}.png")


if __name__ == "__main__":
    match sys.argv[1:]:
        case ["cover", slug]:
            print(cover(slug), end="")
        case ["website", out, covers]:
            website(Path(out), Path(covers))
        case _:
            sys.exit(__doc__)
