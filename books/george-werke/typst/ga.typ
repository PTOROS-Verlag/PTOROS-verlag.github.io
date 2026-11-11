// The poems of the Gesamt-Ausgabe as one epubli Taschenbuch (125 × 190 mm).
// Proportions follow the Bondi print, measured on the SBB scans: leading
// 1.234 × the type size, small capitals at x-height, initials 1.3 ×.

#import "/shared/ptoros.typ": frontmatter, kartei

#let serif = "StefanGeorge"
#let grotesk = "TeX Gyre Heros"

// epubli trims the bleed on every side, so the PDF carries it
#let bleed = kartei.format.bleed * 1mm
#let trim = (width: kartei.format.width * 1mm, height: kartei.format.height * 1mm)
#let inside = 20mm
#let outside = 14mm
#let measure-width = trim.width - inside - outside
// epubli's softcover, the binding with the lower limit
#let max-pages = 784

#let size = 10pt
// baseline to baseline
#let pitch = 1.234 * size
// lines are measured from the font's cap height (0.698 em) to the baseline,
// so the gap between them is the pitch less the cap height
#let lead = pitch - 0.698 * size

#let edition(doc) = {
  set page(
    width: trim.width + 2 * bleed,
    height: trim.height + 2 * bleed,
    margin: (inside: bleed + inside, outside: bleed + outside, top: bleed + 16mm, bottom: bleed + 20mm),
    footer: context {
      let p = here().page()
      if query(<ga-no-folio>).all(m => m.location().page() != p) {
        align(center, text(size: 8pt, counter(page).display()))
      }
    },
    // the pages of the Bondi print, in the outer margin
    foreground: context {
      let p = here().page()
      let x = if calc.odd(p) { page.width - bleed - outside + 4mm } else { bleed + outside - 9mm }
      for m in query(<ga-pb>).filter(m => m.location().page() == p) {
        place(top + left, dx: x, dy: m.location().position().y - 0.5pt,
          text(font: grotesk, size: 5.5pt, fill: luma(140), m.value))
      }
    },
  )
  set text(font: serif, size: size, lang: "de", hyphenate: false,
    top-edge: "cap-height", bottom-edge: "baseline")
  set par(leading: lead, spacing: lead)
  doc
  context assert(here().page() <= max-pages,
    message: "more than the " + str(max-pages) + " pages epubli binds")
}

#let marks(pb) = for n in pb [#metadata(n)<ga-pb>]
#let pb(n) = marks((n,))

// small capitals: the font has none, so capitals at x-height
#let sc(..s) = text(size: 0.69em, upper(s.pos().join(default: "")))
#let spaced(..s) = text(tracking: 0.125em, s.pos().join())
#let smaller(..s) = text(size: 0.85em, s.pos().join())

#let no-folio = [#metadata(none)<ga-no-folio>]

#let caps(s, size: 8pt, weight: "bold") = text(font: grotesk, size: size, weight: weight, tracking: 0.18em, upper(s))
#let alignment(name) = (left: left, center: center, right: right).at(name)

// a page of its own with nothing but this, a third of the way down
#let display(body) = {
  pagebreak(weak: true)
  no-folio
  v(1fr)
  align(center, body)
  v(2fr)
  pagebreak()
}

// the kartei's half-title, title page and imprint, without folios
#let book() = {
  set page(footer: none)
  frontmatter()
}

// the contents list volumes and sections, the index titles and first lines
#let toc-entry(kind, level, s) = [#metadata((kind: kind, level: level, text: s))<ga-toc>]
#let index-entry(kind, s) = if s != none [#metadata((kind: kind, text: s))<ga-index>]

// every volume opens on a right-hand page
#let volume(title: none, band: none) = {
  pagebreak(weak: true, to: "odd")
  display({
    toc-entry("volume", 0, band + " · " + title)
    text(size: 13pt, tracking: 0.08em, upper(title))
    v(5mm)
    text(size: 9pt)[#band]
  })
}

// a heading that opens a group of poems stands alone on its page
#let section(pb: (), entry: none, toc: none, level: 1, ..parts) = display({
  marks(pb)
  index-entry("title", entry)
  toc-entry("section", level, toc)
  caps(parts.pos().join())
})

// a title and the dedications under it: with their poem they go into its
// block (see poem), on their own they stand as blocks kept with what follows
#let title-part(pb: (), entry: none, align: "center", ..parts) = (align: align,
  body: { marks(pb); index-entry("title", entry); caps(parts.pos().join(), size: 7.5pt) })
#let dedication-part(pb: (), align: "center", ..parts) = (align: align,
  body: { marks(pb); caps(parts.pos().join(), size: 7pt, weight: "regular") })
#let part(x) = block(width: 100%, std.align(alignment(x.align), x.body))

#let title(..args) = block(sticky: true, width: 100%, above: 3 * pitch, below: 2 * pitch, part(title-part(..args)))
#let dedication(..args) = block(sticky: true, width: 100%, above: lead, below: lead, part(dedication-part(..args)))

// who speaks in a dialogue, kept with the speech
#let speaker(pb: (), ..parts) = block(sticky: true, width: 100%, above: 2 * pitch, below: pitch,
  align(center, { marks(pb); caps(parts.pos().join(), size: 6.5pt) }))

// prose is justified; a centred or flush-right line (a dedication, mostly)
// stays with what follows it
#let p(pb: (), align: none, ..parts) = {
  set par(spacing: if align == none { lead + pitch } else { lead }, justify: align == none)
  set text(hyphenate: align == none)
  let body = { marks(pb); parts.pos().join() }
  if align == none { par(body) } else { block(sticky: true, width: 100%, std.align(align, par(body))) }
}

#let l(pb: (), indent: 0, ..parts) = (pb: pb, indent: indent, parts: parts.pos())

// the first letter of an untitled poem is set larger and heavier
#let initial(s) = text(size: 1.3em, stroke: 0.035em, baseline: 0.02em, s)

// a line too long for the measure runs on with a hanging indent
#let verse(x) = pad(left: x.indent * 2em, par(hanging-indent: 2em, { marks(x.pb); x.parts.join() }))

// a motto, smaller: its lines flush left in a block against the right margin,
// kept with what follows
#let epigraph(..items) = block(width: 100%, sticky: true, above: 2 * pitch, below: 2 * pitch,
  std.align(right, block(std.align(left, {
    set text(size: 0.85em)
    set par(justify: false, leading: 0.85 * lead, spacing: 0.85 * lead)
    let render(i) = if type(i) == array { block(spacing: 0.85 * lead, i.map(verse).join()) } else { i }
    items.pos().map(render).join(v(0.6 * pitch))
  }))))
#let source(..parts) = std.align(right, par(parts.pos().join()))

// centred by its longest line, title and dedications included, so that a
// flush-left title stands at the poem's left edge
#let poem(first: none, heading: (), ..stanzas) = {
  let st = stanzas.pos()
  let n = st.map(s => s.len()).sum(default: 0)
  // short poems stay on one page and stanzas stay whole; longer ones break,
  // or a title and its poem that cannot share a page would be torn apart
  block(above: if heading == () { 2 * pitch } else { 3 * pitch }, below: 2 * pitch, width: 100%,
    breakable: n > 16, context {
    set par(justify: false)
    let rendered = st.map(s => s.map(verse))
    let widths = rendered.flatten().map(c => measure(c).width) + heading.map(h => measure(h.body).width)
    let w = calc.min(measure-width, calc.max(0pt, ..widths))
    index-entry("first", first)
    std.align(center, block(width: w, std.align(left, {
      if heading != () {
        block(sticky: true, below: 2 * pitch, heading.map(part).join(v(0.6 * pitch)))
      }
      rendered.map(s => block(breakable: s.len() > 16, spacing: lead, s.join())).join(v(pitch))
    })))
  })
}

// DIN 5007 order: umlauts as their base letter, leading punctuation ignored
#let sort-key(s) = (lower(s).replace(regex("^[^\p{L}]+"), "")
  .replace("ä", "a").replace("ö", "o").replace("ü", "u").replace("ß", "ss"))

#let list-size = 8.5pt
#let list-pitch = 1.234 * list-size

// contents and index: a heading of their own on a right-hand page, smaller type
#let list-page(heading, body) = {
  pagebreak(weak: true, to: "odd")
  no-folio
  v(2 * pitch)
  align(center, caps(heading))
  v(3 * pitch)
  set text(size: list-size)
  set par(leading: list-pitch - 0.698 * list-size, spacing: list-pitch - 0.698 * list-size,
    hanging-indent: 1.5em, justify: false)
  body
}

// an entry with dot leaders to the page, both linked to the place; the page
// number never goes to a line of its own
#let list-line(loc, label) = par(link(loc, label) + box(width: 1fr, repeat[#h(0.4em).]) + sym.wj
  + box(inset: (left: 0.4em), link(loc, str(counter(page).at(loc).first()))))

#let contents() = list-page("Inhalt", context for e in query(<ga-toc>) {
  if e.value.kind == "volume" {
    block(above: 2 * list-pitch, below: list-pitch, sticky: true,
      list-line(e.location(), caps(e.value.text, size: 7pt)))
  } else {
    pad(left: (e.value.level - 1) * 1.2em, list-line(e.location(), caps(e.value.text, size: 6.5pt)))
  }
})

#let index() = list-page("Überschriften und Anfänge", context {
  let es = query(<ga-index>).map(m => (key: sort-key(m.value.text), loc: m.location(), ..m.value))
  let last = none
  for e in es.sorted(key: e => e.key) {
    let letter = e.key.at(0, default: "")
    if last != none and letter != last { v(list-pitch) }
    last = letter
    // titles, and first lines printed in capitals, in the heading face
    list-line(e.loc, if e.kind == "title" or upper(e.text) == e.text { caps(e.text, size: 6.5pt) } else { e.text })
  }
})
