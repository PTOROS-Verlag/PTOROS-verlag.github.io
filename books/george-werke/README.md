# Stefan George, Gesamt-Ausgabe der Werke, Bd. 1–9: TEI

DTA-Basisformat TEI of George's own poetry in the *Gesamt-Ausgabe der Werke.
Endgültige Fassung* (Berlin: Bondi 1927–34), one file per volume in `tei/`,
with `tei/werke.xml` including them all. Base text is the zeno.org
transcription; every page is checked against the scans with tesseract and,
for the SBB copies, the library's ALTO as independent witnesses.

Everything runs inside `nix develop` as `python3 -m pipeline <command> [ids…]`
(`--help` lists the commands); without ids a command covers all volumes in
`config/volumes.toml`.

## Pipeline

1. `fetch-zeno` freezes zeno into `sources/zeno/<id>.json`. Nothing downstream
   touches the network. zeno now and then serves another node's text under the
   right URL, so every page is fetched until two answers agree.
2. `build` turns a snapshot into `tei/<id>.xml`. It refuses to overwrite a file
   that already has decisions: from the first review on, the TEI file is the
   master and is edited in place.
3. `fetch-scans` downloads images and ALTO into `cache/` and writes the page
   map `sources/pages/<id>.tsv`. SBB leaves front matter unlabelled; those
   `label`s are filled in by hand after looking at the images. `ga01` has no
   SBB copy: save the Google Books PDF (id in `config/volumes.toml`) as
   `cache/scans/ga01/source.pdf` first.
4. `ocr` runs tesseract and reads the printed page numbers into `ocr_label`.
5. `collate` lists every place no OCR witness confirms, in `review/<id>.tsv`
   with image crops in `review/<id>/sheet-*.png`. Misplaced page breaks show
   up as long runs; `align-pages` proposes where they belong (`--write` sets
   them) for checking against the images.
6. Decisions go to `decisions/<id>.tsv`; `apply` carries out the `fix` rows;
   `collate` again until nothing is open. `validate` and `status` check the
   result; `status` also writes `review/unsure.md`.

## PDF

`pdf` typesets the poems in the StG-Schrift as one book, `pdf/werke.pdf`, for
epubli's Taschenbuch (125 × 190 mm, 3 mm bleed; softcover binds at most 784
pages, and `pdf` fails beyond that). With ids it typesets those volumes alone.
`typst/tei.xsl` (XSLT 3, Saxon) turns the TEI into calls of `typst/ga.typ`.
The font (StefanGeorge.otf, Institut für Textkritik) may not be
redistributed, so it is not in the repository: put it in `cache/fonts/`.

Only the body goes in: no prefaces, no Anhang, no figures. The contents after
the title page list volumes and cycles; an index of titles and first lines
closes the book (umlauts sorted as their base letter, numbers as titles left
out). Leading, small capitals and initials keep the
proportions of the print; the pagination is typst's own, with the pages of the
print in the outer margin. A printing error appears as printed, the `sic` of
its `choice`.

## Decisions

One row per review item, keyed by the item key `collate` prints. A key names
a page and the TEI tokens around the spot, so it survives unrelated edits.

- `keep`: zeno is right, the OCR is wrong.
- `fix`: replace the TEI tokens of the key with `text`. For a `missing` item
  (`∅` in the key) `text` replaces everything between the two neighbour
  tokens, spaces included.
- `edited`: the TEI was changed by hand (structure, page breaks, anything
  across element boundaries).
- `unsure`: left for a human; listed in `review/unsure.md`.

zeno's page markers `[N]` close page N, but not reliably at the start of a
section, and section-title pages carry none. Page breaks were therefore
re-placed by aligning the TEI with the OCR of the whole volume and checked
against the images; those changes are logged as `edited`.

Neither OCR tells the St.-G. k from K or f from F, so a zeno capital there
passes unnoticed: mid-line capital K/F in verse are checked against the
images separately.

## Conventions

- Inside `<hi rendition="#k">` lower-case letters stand for small capitals;
  zeno writes them in capitals.
- Hochpunkt (U+00B7) and dash (U+2013) are kept as zeno has them; the
  typographic apostrophe is the print's, and so are the single guillemets
  ›‹ that zeno often doubles.
- zeno's headings "Widmung" and "Vorrede" are its own labels, not printed.
- A verse set on two lines only because it is too long for the measure is
  one `<l>`; lines George breaks on purpose stay separate.
- A printing error stays as printed in `<choice><sic>…</sic><corr>…</corr></choice>`;
  `collate` reads only the `sic` side, which is what the scans show.
- A motto set before a poem or a cycle (smaller, often a quotation) is an
  `<epigraph>` after the heading, its source a `<bibl>`; zeno runs it into the
  poem as a first stanza.
- A dedication under a title is a `<p>` wholly in `#smaller` capitals,
  aligned as printed: `#c` centred, no rendition flush left (DTABf has no
  `#left`); zeno sets them all flush right. Bd. V prints its titles and
  dedications flush left, the other volumes centre them.
- DTABf has no `figDesc` and allows `milestone/@rendition` only for rules, so
  images are `<figure><note type="editorial">` with zeno's description, and
  zeno's lines of asterisks stay text.
- DTABf allows `<head>` only at the top of a div: a heading inside a poem
  opens a nested div. A dialogue poem is a series of `<sp>`, each with its
  `<speaker>`.
