.PHONY: all
all: epistulae.pdf cover.pdf

epistulae.pdf: epistulae.typ
	typst compile $<

.PHONY: clean
clean:
	rm epistulae.pdf
	rm cover.pdf

cover.pdf: cover.tex
	latexmk -pdf $<
