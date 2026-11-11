#{
  import "@preview/hydra:0.5.1": hydra

  let textSize = 10pt
  let sfFont = "Alegreya Sans"
  let ttFont = "IBM Plex Mono"

  show link: body => text(8pt, font: ttFont, body)

  set page(width: 12.5cm, height: 19cm, numbering: "1", columns: 1, header: context {
    let page-number = counter(page).get().first()
    let match-list = query(selector(<turn-on-page-numbering>).before(here()))
    if match-list == () { return none }
    if calc.odd(here().page()) {
      align(right, text(font: sfFont, hydra(2)))
    } else {
      align(left, text(font: sfFont, hydra(1)))
    }
  }, footer: context {
      let page-number = counter(page).get().first()
      let match-list = query(selector(<turn-on-page-numbering>).before(here()))
      if match-list == () { return none }
      align(center, str(page-number))
  }, margin: (
    left: auto,
    right: auto,
    top: auto,
    bottom: auto
  ))

  show heading.where(
    level: 1
  ): it => block(width: 100%,
    align(center, text(textSize + 3pt, font: "Alegreya Sans", weight: "bold", it.body))
  )

  show heading.where(
    level: 2
  ): it => block(width:100%, align(center, text(
    font: sfFont,
    size: textSize + 1pt,
    it.body,
  )))

  show heading.where(
    level: 3
  ): it => text(
    font: sfFont,
    size: textSize,
    weight: "bold",
    it.body,
  )

  set text(
    font: "EB Garamond 12",
    size: textSize,
    lang: "de"
  )

  align(right, text[Friedrich Rückert · Die Weisheit des Brahmanen])

  pagebreak()
  pagebreak()

  align(center, text(13pt)[
    #v(1cm)

    Die

    #text(20pt)[Weisheit des Brahmanen]

    ein Lehrgedicht in Bruchstücken

    #v(2cm)

    von

    #text(16pt, tracking: 1mm)[Friedrich Rückert]

    #v(2cm)

    #text(12pt)[Ungekürzte Gesamtausgabe]

    #v(2cm)

    #text(11pt, table(
      columns: 6,
      align: center,
      stroke: none,
      [P], [T], [O], [R], [O], [S],
      [V], [E], [R], [L], [A], [G],
      [B], [E], [R], [L], [I], [N],
    ))
  ])


  pagebreak()

  [Rückerts _Weisheit des Brahmanen_ erschien zuerst 1836–1839 in sechs Bänden in der Weidmannschen Buchhandlung in Leipzig.]

  align(bottom, text[
  © 2025 #text(tracking: 0.07em)[PTOROS] Verlag, Berlin \
  https://ptoros.de

  Umschlag, Satz und Layout gestaltet vom Herausgeber \
  Schriften: EB Garamond und Alegreya Sans

  Druck und Bindung: Neopubli GmbH, Berlin \
  Printed in Germany \
  #text(tracking: 0.07em)[ISBN] 978-3-81973-492-2
  ])

  pagebreak()
  outline(depth: 1)
  pagebreak()
  pagebreak()

  let volumeTitle = (
    none,
    "Erstes Bändchen (1836)",
    "Zweites Bändchen (1837)",
    "Drittes Bändchen (1837)",
    "Viertes Bändchen (1838)",
    "Fünftes Bändchen (1839)",
    "Sechstes Bändchen (1839)"
  )

  [ <turn-on-page-numbering>]
  for x in (1, 2, 3, 4, 5, 6) {
    heading(volumeTitle.at(x), level: 1)
    include ("brahmane_" + str(x) + ".typ")
  }
}
