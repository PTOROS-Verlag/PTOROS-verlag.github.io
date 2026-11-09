"""zeno snapshot → DTABf TEI"""

import html as htmlmod
import re
import subprocess
import sys
import unicodedata
from lxml import etree, html as lhtml

from . import config, zeno

TEI_NS = "http://www.tei-c.org/ns/1.0"
XI_NS = "http://www.w3.org/2001/XInclude"
CONTAINERS = {"TEI", "text", "front", "body", "back", "div", "lg", "figure", "teiCorpus"}
ROMAN = re.compile(r"M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})")
WORD = re.compile(r"[^\W\d_]+(?:-[^\W\d_]+)*")
SPAN_STYLE = {
    "zenoTXSpaced": "#g",
    "zenoTXFontsize80": "#smaller",
    "zenoTXFontsize60": "#smaller",
}
PARA_CLASS = re.compile(r"zenoPLm(\d+)n(\d+)")
ET_LEVEL = {4: "#et", 8: "#et2", 12: "#et3"}


class BuildError(Exception):
    pass


def E(tag, attrib=None, text=None):
    el = etree.Element(tag, attrib or {})
    if text:
        el.text = text
    return el


def nfc(s):
    return unicodedata.normalize("NFC", s)


# --- page breaks ----------------------------------------------------------


class Pages:
    """the page-break state machine. zeno's [N] closes page N."""

    def __init__(self):
        self.current = 0
        self.anomalies = []

    def marker(self, n, leaf, first):
        """→ page number to emit a <pb> for, or None"""
        page = n + 1
        if page > self.current:
            self.current = page
            return page
        if page == self.current and first:
            return None
        if page == self.current:
            self.current += 1
            self.anomalies.append((self.current - 1, leaf, n, f"pb {self.current}"))
            return self.current
        self.anomalies.append((self.current, leaf, n, "dropped"))
        return None


# --- inline content -------------------------------------------------------


def runs_of(el, path, styles=()):
    """flatten an html inline element into ('t', text, styles) / ('m', n) items"""
    out = []
    if el.text:
        out.append(("t", el.text, styles))
    for c in el:
        cls = c.get("class", "")
        if c.tag == "a" and cls == "zenoTXKonk":
            out.append(("m", int(c.get("name"))))
        elif c.tag == "span" and cls in SPAN_STYLE:
            out += runs_of(c, path, styles + (SPAN_STYLE[cls],))
        elif c.tag == "i" and not cls:
            out += runs_of(c, path, styles + ("#i",))
        else:
            raise BuildError(f"{path}: unknown inline <{c.tag} class={cls!r}>")
        if c.tail:
            out.append(("t", c.tail, styles))
    return out


def normalize(runs):
    """collapse whitespace, trim the ends, merge equal neighbours"""
    out = []
    for r in runs:
        if r[0] == "t":
            t = re.sub(r"\s+", " ", nfc(r[1]))
            if out and out[-1][0] == "t" and out[-1][2] == r[2]:
                out[-1] = ("t", out[-1][1] + t, r[2])
            elif t:
                out.append(("t", t, r[2]))
        else:
            out.append(r)
    texts = [i for i, r in enumerate(out) if r[0] == "t"]
    if texts:
        i, j = texts[0], texts[-1]
        out[i] = ("t", out[i][1].lstrip(), out[i][2])
        out[j] = ("t", out[j][1].rstrip(), out[j][2])
    # whitespace between two styled runs may sit in an unstyled run
    return [r for r in out if r[0] == "m" or r[1]]


def small_caps(runs):
    """zeno ALL CAPS inside mixed-case text = small caps in print"""
    text = "".join(r[1] for r in runs if r[0] == "t")
    if not any(ch.islower() for ch in text):
        return runs
    out, before = [], ""
    for r in runs:
        if r[0] == "m":
            out.append(r)
            continue
        t, styles = r[1], r[2]
        pos = 0
        for a, b in caps_spans(t):
            if a > pos:
                out.append(("t", t[pos:a], styles))
            ctx = (before + t[:a]).rstrip()
            run = t[a:b].lower()
            if not ctx or ctx[-1] in ".!?":
                run = run[0].upper() + run[1:]
            out.append(("t", run, styles + ("#k",)))
            pos = b
        if pos < len(t):
            out.append(("t", t[pos:], styles))
        before += t
    return out


def caps_spans(t):
    """maximal runs of all-uppercase words (≥2 letters), joined by spaces or ·"""
    spans = []
    for m in WORD.finditer(t):
        w = m.group(0)
        letters = w.replace("-", "")
        if len(letters) < 2 or not w.isupper() or ROMAN.fullmatch(letters):
            continue
        if spans and re.fullmatch(r"[ ·]*", t[spans[-1][1] : m.start()]):
            spans[-1][1] = m.end()
        else:
            spans.append([m.start(), m.end()])
    return spans


def fill(el, runs):
    """append text runs to el; styled runs become <hi>"""
    last = None
    for r in runs:
        if r[0] == "pb":
            last = E("pb", r[1])
            el.append(last)
            continue
        _, t, styles = r
        if styles:
            last = E("hi", {"rendition": " ".join(styles)}, t)
            el.append(last)
        elif last is None:
            el.text = (el.text or "") + t
        else:
            last.tail = (last.tail or "") + t


# --- structure ------------------------------------------------------------


class Builder:
    def __init__(self, vid, facs, kinds):
        self.vid = vid
        self.facs = facs
        self.kinds = kinds
        self.pages = Pages()
        self.pending_heads = []  # heads emitted since the last text content

    def pb(self, n):
        a = {"n": str(n)}
        if n in self.facs:
            a["facs"] = f"#f{self.facs[n]:04d}"
        elif self.facs:
            raise BuildError(f"{self.vid}: page {n} not in page map")
        return a

    def resolve(self, runs, leaf, state):
        """turn markers into pb items; split into (before, inline, after)"""
        items = []
        for r in runs:
            if r[0] == "m":
                n = self.pages.marker(r[1], leaf, not state["content"])
                if n is not None:
                    items.append(("pb", self.pb(n)))
            else:
                items.append(r)
        i = 0
        while i < len(items) and items[i][0] == "pb":
            i += 1
        j = len(items)
        while j > i and items[j - 1][0] == "pb":
            j -= 1
        return items[:i], items[i:j], items[j:]

    def place_before(self, pbs, container):
        """pbs ahead of content go before any heads that announced it"""
        if self.pending_heads:
            h = self.pending_heads[0]
            parent = h.getparent()
            idx = parent.index(h)
            for k, p in enumerate(pbs):
                parent.insert(idx + k, E("pb", p[1]))
        else:
            for p in pbs:
                container.append(E("pb", p[1]))

    def node(self, nodes, i, parent, typ=None):
        """emit nodes[i] (and its subtree) as a div in parent; → next index"""
        n = nodes[i]
        div = E("div", {"n": str(n["depth"])})
        if typ:
            div.set("type", typ)
        parent.append(div)
        kind = self.kinds.get(n["path"]) or ("verse" if "Gedicht" in n["categories"] else "prose")
        self.content(n, div, kind)
        j = i + 1
        while j < len(nodes) and nodes[j]["depth"] > n["depth"]:
            j = self.node(nodes, j, div)
        return j

    def content(self, n, div, kind):
        path = n["path"]
        frag = lhtml.fragment_fromstring(n["html"], create_parent="div")
        if frag.text and frag.text.strip():
            raise BuildError(f"{path}: loose text {frag.text.strip()[:40]!r}")
        # div: where content goes; a heading after content opens a sub-div
        state = {"content": False, "div": div, "depth": n["depth"]}
        verse = Verse(div) if kind == "verse" else None
        for c in frag:
            if c.tail and c.tail.strip():
                raise BuildError(f"{path}: loose text {c.tail.strip()[:40]!r}")
            cls = c.get("class", "")
            if c.tag in ("h2", "h3", "h4", "h5", "h6"):
                # zeno labels "Widmung" and "Vorrede"; the print has no such heading
                if c.get("pp") == "no" or c.text_content().strip() in ("Widmung", "Vorrede"):
                    continue
                if set(c.attrib) - {"pp"}:
                    raise BuildError(f"{path}: unknown heading attributes {dict(c.attrib)}")
                self.head(c, path, state, verse)
            elif c.tag == "br" and not c.attrib:
                if verse:
                    verse.stanza_break()
            elif c.tag == "p":
                self.para(c, path, state, verse, cls)
            elif c.tag == "div" and cls == "zenoIMBreak":
                cap = c.find('.//div[@class="zenoIMBreakText"]')
                if cap is None:
                    raise BuildError(f"{path}: image without caption")
                if verse:
                    verse.close()
                fig = E("figure")
                # zeno describes the image; DTABf has no figDesc
                fig.append(E("note", {"type": "editorial"}, nfc(" ".join(cap.text_content().split()))))
                state["div"].append(fig)
                state["content"] = True
                self.pending_heads = []
            else:
                raise BuildError(f"{path}: unknown element <{c.tag} class={cls!r}>")
        if verse:
            verse.close()

    def head(self, c, path, state, verse):
        runs = normalize(runs_of(c, path))
        text = "".join(r[1] for r in runs if r[0] == "t")
        if text.endswith("]") and "[" in text:
            keep = text[: text.rindex("[")].rstrip()
            out, pos = [], 0
            for r in runs:
                if r[0] == "t":
                    t = r[1][: max(0, len(keep) - pos)]
                    pos += len(r[1])
                    if t:
                        out.append(("t", t, r[2]))
                else:
                    out.append(r)
            runs = normalize(out)
        if not any(r[0] == "t" for r in runs):
            if any(r[0] == "m" for r in runs):
                raise BuildError(f"{path}: page marker in a dropped heading")
            return
        if verse:
            verse.close()
        if any(ch.tag not in ("head", "pb") for ch in state["div"]):
            # DTABf allows <head> only at the top of a div
            sub = E("div", {"n": str(state["depth"] + 1)})
            state["div"].append(sub)
            state["div"] = sub
            if verse:
                verse.div = sub
        div = state["div"]
        h = E("head")
        before, inline, after = self.resolve(runs, path, state)
        self.place_before(before, div)
        fill(h, inline)
        div.append(h)
        for p in after:
            div.append(E("pb", p[1]))
        self.pending_heads.append(h)

    def para(self, c, path, state, verse, cls):
        div = state["div"]
        rend = None
        if cls == "zenoPC":
            rend = "#c"
        elif cls == "zenoPR":
            rend = "#right"
        elif m := PARA_CLASS.fullmatch(cls):
            mm, nn = int(m.group(1)), int(m.group(2))
            if verse:
                if mm not in ET_LEVEL:
                    raise BuildError(f"{path}: verse indent {cls}")
                rend = ET_LEVEL[mm]
            elif mm == nn and nn > 0:
                if nn not in ET_LEVEL:
                    raise BuildError(f"{path}: prose indent {cls}")
                rend = ET_LEVEL[nn]
        elif cls:
            raise BuildError(f"{path}: unknown paragraph class {cls!r}")
        if set(c.attrib) - {"class"}:
            raise BuildError(f"{path}: unknown paragraph attributes {dict(c.attrib)}")
        runs = small_caps(normalize(runs_of(c, path)))
        before, inline, after = self.resolve(runs, path, state)
        if not inline:
            # a paragraph holding nothing but page markers
            self.place_before(before + after, verse.container() if verse else div)
            return
        if verse and cls not in ("zenoPC", "zenoPR"):
            el = E("l", {"rendition": rend} if rend else None)
            container = verse.line_container()
        else:
            if verse:
                verse.close()
            el = E("p", {"rendition": rend} if rend else None)
            container = div
        self.place_before(before, container)
        fill(el, inline)
        container.append(el)
        for p in after:
            container.append(E("pb", p[1]))
        state["content"] = True
        self.pending_heads = []


class Verse:
    """poem/stanza bookkeeping for one verse node"""

    def __init__(self, div):
        self.div = div
        self.poem = None
        self.stanza = None
        self.stanzas = []

    def container(self):
        return self.stanza if self.stanza is not None else (self.poem if self.poem is not None else self.div)

    def line_container(self):
        if self.poem is None:
            self.poem = E("lg", {"type": "poem"})
            self.div.append(self.poem)
            self.stanzas = []
        if self.stanza is None:
            self.stanza = E("lg", {"n": str(len(self.stanzas) + 1)})
            self.poem.append(self.stanza)
            self.stanzas.append(self.stanza)
        return self.stanza

    def stanza_break(self):
        self.stanza = None

    def close(self):
        if self.poem is not None and len(self.stanzas) == 1:
            s = self.stanzas[0]
            idx = self.poem.index(s)
            for k, child in enumerate(list(s)):
                self.poem.insert(idx + k, child)
            if s.text and s.text.strip():
                raise BuildError("text in stanza lg")
            self.poem.remove(s)
        self.poem = self.stanza = None
        self.stanzas = []


# --- document ------------------------------------------------------------


def placement(title):
    if title.startswith("Widmung"):
        return "front", "dedication"
    if title.startswith("Vorrede"):
        return "front", "preface"
    if title.startswith(("Bild", "Jugendbildnis", "Titelblatt")):
        # frontispieces: Bildnis, Bild: …, Titelblatt des Erstdrucks
        return "front", None
    if title == "Anhang":
        return "back", "appendix"
    return "body", None


def header(vid, snap):
    vol = config.VOLUMES[vid]
    year = vol.get("year", "")
    month = vol.get("month", "")
    if vol["source"] == "sbb":
        facs = (
            f'<idno type="URLWeb">https://digital.staatsbibliothek-berlin.de/werkansicht?PPN={vol["ppn"]}</idno>'
            f'<idno type="URLXML">{config.SBB}{vol["ppn"]}.mets.xml</idno>'
        )
        repo = "Staatsbibliothek zu Berlin – Preußischer Kulturbesitz"
    else:
        facs = f'<idno type="URLWeb">https://books.google.com/books?id={vol["google"]}</idno>'
        repo = "Google Books"
    date = f'<date type="publication">{year}</date>' if year else ""
    when = f"{month} {year}".strip()
    x = f"""<teiHeader>
  <fileDesc>
    <titleStmt>
      <title type="main">{esc(vol["title"])}</title>
      <author>
        <persName ref="http://d-nb.info/gnd/11853856X">
          <surname>George</surname>
          <forename>Stefan</forename>
        </persName>
      </author>
      <respStmt>
        <orgName>PTOROS Verlag</orgName>
        <resp>Textkonstitution und Kodierung</resp>
      </respStmt>
    </titleStmt>
    <publicationStmt>
      <publisher>
        <orgName>PTOROS Verlag</orgName>
      </publisher>
      <availability>
        <licence target="https://creativecommons.org/publicdomain/mark/1.0/">
          <p>Public Domain Mark 1.0</p>
        </licence>
      </availability>
    </publicationStmt>
    <sourceDesc>
      <bibl type="M">George, Stefan: {esc(vol["title"])}. Gesamt-Ausgabe der Werke. Endgültige Fassung. Berlin: Georg Bondi{", " + esc(when) if when else ""}.</bibl>
      <biblFull>
        <titleStmt>
          <title level="m" type="main">{esc(vol["title"])}</title>
          <author>
            <persName ref="http://d-nb.info/gnd/11853856X">
              <surname>George</surname>
              <forename>Stefan</forename>
            </persName>
          </author>
        </titleStmt>
        <publicationStmt>
          <publisher><name>Georg Bondi</name></publisher>
          <pubPlace>Berlin</pubPlace>
          {date}
        </publicationStmt>
        <seriesStmt>
          <title level="s" type="main">Gesamt-Ausgabe der Werke. Endgültige Fassung</title>
        </seriesStmt>
      </biblFull>
      <msDesc>
        <msIdentifier>
          <repository>{repo}</repository>
          <idno>{facs}</idno>
        </msIdentifier>
      </msDesc>
    </sourceDesc>
  </fileDesc>
  <encodingDesc>
    <editorialDecl>
      <p>Grundlage ist die Transkription von zeno.org (<ref target="{snap["root"]}">{snap["root"]}</ref>), abgerufen am {snap["fetched"]}.</p>
      <p>Jede Seite wurde gegen die Digitalisate geprüft; als unabhängige Zeugen dienten tesseract-OCR und, wo vorhanden, die ALTO-Volltexte der Staatsbibliothek zu Berlin. Jede Abweichung wurde am Bildausschnitt entschieden.</p>
      <p>Die von zeno.org in eckigen Klammern ergänzten Titel unbetitelter Gedichte sind entfallen.</p>
      <p>Abbildungen sind nur als figure mit der Bildbeschreibung von zeno.org (note type="editorial") verzeichnet.</p>
      <p>Kapitälchen: in hi mit rendition="#k" stehen Kleinbuchstaben für Kapitälchen.</p>
      <p>Hochpunkt (U+00B7) und Gedankenstrich (U+2013) sind wie bei zeno.org wiedergegeben.</p>
      <p>Die Orthographie ist nicht normalisiert.</p>
    </editorialDecl>
    <tagsDecl>
      <rendition scheme="css" xml:id="c">display:block; text-align:center</rendition>
      <rendition scheme="css" xml:id="et">display:block; margin-left:2em; text-indent:0</rendition>
      <rendition scheme="css" xml:id="et2">display:block; margin-left:4em; text-indent:0</rendition>
      <rendition scheme="css" xml:id="et3">display:block; margin-left:6em; text-indent:0</rendition>
      <rendition scheme="css" xml:id="g">letter-spacing:0.125em</rendition>
      <rendition scheme="css" xml:id="i">font-style:italic</rendition>
      <rendition scheme="css" xml:id="k">font-variant:small-caps</rendition>
      <rendition scheme="css" xml:id="right">display:block; text-align:right</rendition>
      <rendition scheme="css" xml:id="smaller">font-size:smaller</rendition>
    </tagsDecl>
  </encodingDesc>
  <profileDesc>
    <langUsage>
      <language ident="deu">German</language>
    </langUsage>
    <textClass>
      <classCode scheme="https://www.deutschestextarchiv.de/doku/klassifikation#dtamain">Belletristik</classCode>
      <classCode scheme="https://www.deutschestextarchiv.de/doku/klassifikation#dtasub">Lyrik</classCode>
    </textClass>
  </profileDesc>
</teiHeader>"""
    return etree.fromstring(x)


def esc(s):
    return htmlmod.escape(s, quote=False)


def page_map(vid):
    """printed page → image order, from sources/pages/<id>.tsv"""
    out = {}
    for r in config.read_tsv(config.pages_tsv(vid)):
        if r["label"].isdigit():
            out.setdefault(int(r["label"]), int(r["order"]))
    return out


def kinds():
    return {r["path"]: r["kind"] for r in config.read_tsv(config.path("config", "leaf-kind.tsv"))}


def make(vid, snap, facs):
    """→ (TEI element tree, anomalies)"""
    nodes = snap["nodes"]
    root = nodes[0]
    rest = re.sub(r"<h[2-6][^>]*>.*?</h[2-6]>", "", root["html"], flags=re.S)
    if rest.strip():
        raise BuildError(f"{root['path']}: volume root has content")
    b = Builder(vid, facs, kinds())
    tei = E("TEI")
    tei.append(header(vid, snap))
    text = E("text")
    tei.append(text)
    parts = {k: E(k) for k in ("front", "body", "back")}
    i = 1
    while i < len(nodes):
        where, typ = placement(nodes[i]["title"])
        i = b.node(nodes, i, parts[where], typ)
    for k in ("front", "body", "back"):
        if len(parts[k]):
            text.append(parts[k])
    return tei, b.pages.anomalies


def indent(el, level=0):
    """pretty-print structural containers only; mixed content stays as is"""
    tag = etree.QName(el).localname
    if tag not in CONTAINERS or (el.text and el.text.strip()):
        return
    pad = "\n" + "  " * (level + 1)
    if len(el):
        el.text = pad
        for c in el:
            c.tail = pad if c.tail is None or not c.tail.strip() else c.tail
            indent(c, level + 1)
        el[-1].tail = "\n" + "  " * level


def serialize(tei):
    """add the TEI namespace and pretty-print"""
    s = etree.tostring(tei, encoding="unicode").replace("<TEI>", f'<TEI xmlns="{TEI_NS}">', 1)
    return dump(etree.fromstring(s))


def dump(root):
    """the file layout of a TEI master; also used after edits"""
    indent(root)
    return (
        b'<?xml version="1.0" encoding="UTF-8"?>\n'
        b'<?xml-model href="https://www.deutschestextarchiv.de/basisformat.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>\n'
        + etree.tostring(root, encoding="UTF-8")
        + b"\n"
    )


def build(vid, force=False):
    out = config.tei_file(vid)
    if out.exists() and not force:
        print(f"{vid}: {out.relative_to(config.ROOT)} exists; use --force", file=sys.stderr)
        return False
    if out.exists() and config.read_tsv(config.decisions_tsv(vid)):
        print(f"{vid}: decisions exist; edit {out.relative_to(config.ROOT)} in place", file=sys.stderr)
        return False
    snap = zeno.load(vid)
    try:
        tei, anomalies = make(vid, snap, page_map(vid))
    except BuildError as e:
        print(f"{vid}: {e}", file=sys.stderr)
        return False
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(serialize(tei))
    config.write_tsv(
        config.anomalies_tsv(vid),
        ["page", "leaf", "marker", "action"],
        [dict(zip(["page", "leaf", "marker", "action"], a)) for a in anomalies],
    )
    r = subprocess.run(["jing", str(config.path("schema", "basisformat.rng")), str(out)], capture_output=True, text=True)
    print(f"{vid}: {out.relative_to(config.ROOT)}, {len(anomalies)} page anomalies")
    if r.returncode:
        print(r.stdout + r.stderr, file=sys.stderr)
        return False
    return True


def write_corpus():
    out = config.tei_file("werke")
    if out.exists():
        return
    incs = "\n".join(f'  <xi:include href="{v}.xml"/>' for v in config.IDS)
    out.write_text(
        f"""<?xml version="1.0" encoding="UTF-8"?>
<teiCorpus xmlns="{TEI_NS}" xmlns:xi="{XI_NS}">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title type="main">Stefan George: Gesamt-Ausgabe der Werke. Endgültige Fassung. Band 1–9</title>
      </titleStmt>
      <publicationStmt>
        <publisher>
          <orgName>PTOROS Verlag</orgName>
        </publisher>
      </publicationStmt>
      <sourceDesc>
        <p>Die einzelnen Bände; siehe deren Kopf.</p>
      </sourceDesc>
    </fileDesc>
  </teiHeader>
{incs}
</teiCorpus>
""",
        encoding="utf-8",
    )
