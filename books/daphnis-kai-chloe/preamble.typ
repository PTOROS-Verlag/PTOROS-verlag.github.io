#import "@preview/hydra:0.5.1": hydra

#let textSize = 11pt
#let seriffont = "Junicode"
#let sfFont = "Alegreya Sans"
#let ttFont = "IBM Plex Mono"

#show link: body => text(8pt, font: ttFont, body)

#let praef = 0

#let greekNumbers(first, ..) = {
  let result = ""

  let hundreds = calc.quo(first, 100)
  let hundredsRest = calc.rem(first, 100)

  if hundreds == 1 {
    result += "ρ"
  } else if hundreds == 2 {
    result += "σ"
  } else if hundreds == 3{
    result += "τ"
  } else if hundreds == 4 {
    result += "υ"
  } else if hundreds == 5 {
    result += "φ"
  } else if hundreds == 6 {
    result += "χ"
  } else if hundreds == 7 {
    result += "ψ"
  } else if hundreds == 8 {
    result += "ω"
  }

  let tens = calc.quo(hundredsRest, 10)
  let tensRest = calc.rem(hundredsRest, 10)

  if tens == 1 {
    result += "ι"
  } else if tens == 2 {
    result += "κ"
  } else if tens == 3{
    result += "λ"
  } else if tens == 4 {
    result += "μ"
  } else if tens == 5 {
    result += "ν"
  } else if tens == 6 {
    result += "ξ"
  } else if tens == 7 {
    result += "ο"
  } else if tens == 8 {
    result += "π"
  } else if tens == 9 {
    result += "ϟ"
  }

  let ones = tensRest

  if ones == 1 {
    result += "α"
  } else if ones == 2 {
    result += "β"
  } else if ones == 3{
    result += "γ"
  } else if ones == 4 {
    result += "δ"
  } else if ones == 5 {
    result += "ε"
  } else if ones == 6 {
    result += "ϛ"
  } else if ones == 7 {
    result += "ζ"
  } else if ones == 8 {
    result += "η"
  } else if ones == 9 {
    result += "θ"
  }

  result
}

#set page(
  margin: (
    inside: 0.8in,
    outside: 1.4in,
    top: 0.8in,
    bottom: 1.0in
  ),
  width: 12.5cm,
  height: 19cm,
  columns: 1,
)

#show heading: set text(font: seriffont, style: "italic", weight: "regular")
#show heading: set block(above: 1.5em, below: 1em)

#set text(
  font: seriffont,
  size: 1em,
  lang: "el"
)

#align(right, text[Λόγγος · Δάφνις καὶ Χλόη])

#pagebreak(to: "odd")

#align(center, text(13pt)[
  #v(1cm)

  #text(20pt)[Δάφνις καὶ Χλόη]

  #v(2cm)

  τοῦ

  #text(16pt, tracking: 1mm)[Λόγγου]

  #v(2cm)

  #text(12pt)[ἔκδοσις πληρής]

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


#pagebreak()

Longus. _Erotici Scriptores Graeci_, Vol 1. Rudolf Hercher. in aedibus B. G. Teubneri. Leipzig. 1858.

#align(bottom, text[
#text(tracking: 0.07em)[PTOROS] Verlag, Berlin, 2025 \
https://ptoros.de

Ὁ ἐκδότης τὸ περικάλυμμα καὶ τὴν διάταξιν τῶν γραμμάτων κατεσκεύασεν. \
Γραμματοσειρά: Junicode

Ἡ τύπωσις καὶ ἡ σύνδεσις ὑπὸ τῆς Neopubli GmbH, Berlin \
Ἐν Γερμανίᾳ ἐκτυπωθέν. \
#text(tracking: 0.07em)[ISBN] 978-3-565009-71-8
])

#pagebreak()
#outline(depth: 1)
#pagebreak()
#pagebreak()

#set page(numbering: greekNumbers)
#set par(
  first-line-indent: 1.5em,
  spacing: 0.85em,
  leading: 0.85em,
  justify: true,
)
#set quote(block: true)
#show quote: set pad(x: 0.1in, top: -0.1in)
#show quote: set text(0.9em, luma(19%))
