# PTOROS Verlag

- `website/` – ptoros.de, deployed to GitHub Pages by `.github/workflows/website.yml` on every push to `main` that touches it.
- `books/<slug>/` – sources and rendering for one book each; `make` in the directory builds it. Generated files, PDFs included, are not committed.
