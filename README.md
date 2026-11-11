# PTOROS Verlag

- `website/` – ptoros.de, deployed to GitHub Pages by `.github/workflows/website.yml` on every push to `main` that touches it.
- `books/<slug>/` – sources and rendering for one book each. Generated files, PDFs included, are not committed.

## Building books

`nix build .#<slug>` puts a book's PDFs in `result/`; `nix build` builds all of them. For `make` by hand, `nix develop .#<slug>` gives the toolchain that book is built with.

Every directory under `books/` becomes a package: its `Makefile` needs an `all` target that leaves the PDFs in the directory. Typst packages, TeX packages and fonts come from `flake.nix`; add new ones there.

Line and page breaks depend on the typst version and on the exact font files. A different page count no longer fits the spine width set in `cover.tex`. Hence:

- Fonts come only from `flake.nix`, never from the host, and a build fails if typst cannot find one.
- Once a book is printed, add it to `printedWith` in `flake.nix`, pointing at a nixpkgs input with a fixed release URL that has the typst and font versions it was printed with (`pdfinfo` shows the typst version; the font versions are in the embedded fonts' name tables). Then `nix flake update` cannot reflow it.
