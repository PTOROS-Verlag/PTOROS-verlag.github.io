# PTOROS Verlag

- `books.toml` – the Kartei: one card per book. The books' frontmatter, their covers and the website's book list are generated from it; the comments at its top describe the fields.
- `books/<slug>/` – sources and rendering for one book each. Generated files, PDFs and `cover.tex` included, are not committed.
- `shared/` – what every book uses: the frontmatter (`ptoros.typ`), the cover template (`cover.tex`), the generator for covers and website (`kartei.py`), the common make rules (`book.mk`).
- `website/` – ptoros.de. `index.html` is the page minus the book list; `nix build .#website` builds the site, with cover images cut from the books' covers. `.github/workflows/website.yml` deploys it on every push to `main` that touches it.

## Building books

`nix build .#<slug>` puts a book's PDFs in `result/`; `nix build` builds all of them. For `make` by hand, `nix develop .#<slug>` gives the toolchain that book is built with.

Every directory under `books/` becomes a package: its `Makefile` includes `shared/book.mk` and needs an `all` target that leaves the PDFs in the directory; its typst source calls `frontmatter()` from `/shared/ptoros.typ`. Typst packages, TeX packages and fonts come from `flake.nix`; add new ones there.

Line and page breaks depend on the typst version and on the exact font files. A different page count no longer fits the book's `spine` in the Kartei. Hence:

- Fonts come only from `flake.nix`, never from the host, and a build fails if typst cannot find one.
- Once a book is printed, add it to `printedWith` in `flake.nix`, pointing at a nixpkgs input with a fixed release URL that has the typst and font versions it was printed with (`pdfinfo` shows the typst version; the font versions are in the embedded fonts' name tables). Then `nix flake update` cannot reflow it.
- `shared/ptoros.typ` is compiled by every pinned typst version, the oldest included, so it can only use what that version knows. Changes to it (and to `cover.tex`) change the frontmatter and covers of every book, printed ones too; the frontmatter is four pages, and must stay four so the text does not move.
