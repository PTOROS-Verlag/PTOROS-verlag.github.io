.PHONY: all
all: koptisch.pdf cover.pdf

koptisch.pdf: koptisch.typ
	typst compile $<.typ

.PHONY: clean
clean:
	rm koptisch.pdf
	rm cover.pdf

cover.pdf: cover.tex
	latexmk -pdf $<
