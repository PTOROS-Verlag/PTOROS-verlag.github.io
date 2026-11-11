all: siber.pdf cover.pdf

cover.pdf: cover.tex
	latexmk -pdf $<

siber.pdf: siber.typ
	typst compile $<
