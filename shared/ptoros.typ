// frontmatter of the book given by `--input slug=…`, from its card in the kartei

#let kartei = toml("/books.toml")
#let book = kartei.book.find(b => b.slug == sys.inputs.slug)
#let words = kartei.imprint.at(book.language)
#let markup(s) = eval(s, mode: "markup")
#let spaced(body) = text(tracking: 0.07em, body)

// half-title, title page and imprint: pages 1 to 4
#let frontmatter() = {
  align(right, text[
    #markup(book.author) · #markup(book.at("short-title", default: book.title))
  ])
  pagebreak(to: "odd")

  align(center, text(13pt)[
    #v(1cm)
    #text(20pt, markup(book.title))

    #if "subtitle" in book {
      v(1.5cm)
      markup(book.subtitle)
    }

    #v(2cm)
    #markup(if "by" in book { book.by } else { words.by })

    #text(16pt, tracking: 1mm, markup(book.at("by-author", default: book.author)))

    #if "edition" in book {
      v(2cm)
      text(12pt, markup(book.edition))
    }
  ])
  v(1fr)
  align(center, text(11pt, table(
    columns: 6,
    align: center,
    stroke: none,
    ..("PTOROS" + "VERLAG" + "BERLIN").clusters().map(c => [#c]),
  )))
  pagebreak()

  if "source" in book {
    markup(book.source)
  }
  align(bottom, text[
    #spaced[PTOROS] Verlag, Berlin, #book.year \
    #link("https://ptoros.de")

    #words.design \
    #markup(book.typeface)

    #words.printing \
    #words.printed
    #if "isbn" in book [\ #spaced[ISBN] #book.isbn]
  ])
}
