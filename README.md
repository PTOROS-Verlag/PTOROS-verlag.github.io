# PTOROS Verlag

- `website/` – ptoros.de, deployed to GitHub Pages by `.github/workflows/website.yml` on every push to `main` that touches it.
- `books/<slug>/` – sources and rendering for one book each.

Import an existing book repository with its history:

    git subtree add --prefix=books/<slug> <url> <branch>
