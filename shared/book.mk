# included by each book's Makefile, run from books/<slug>/

root := ../..
slug := $(notdir $(CURDIR))
# the frontmatter reads the kartei and needs the slug to find the card
typst := typst compile --root $(root) --input slug=$(slug)
kartei := $(root)/books.toml $(root)/shared/ptoros.typ

.DEFAULT_GOAL := all
.PHONY: all clean

cover.tex: $(root)/books.toml $(root)/shared/cover.tex $(root)/shared/kartei.py
	python3 $(root)/shared/kartei.py cover $(slug) > $@

cover.pdf: cover.tex
	latexmk -xelatex $<

# $(generated): intermediate files of the book
clean:
	latexmk -C cover.tex
	rm -f *.pdf cover.tex $(generated)
