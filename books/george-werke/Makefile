include ../../shared/book.mk

generated = werke.typ ga*.typ

all: werke.pdf cover.pdf

# werke.xml includes every volume; a volume alone, as a proof: make ga04.pdf
werke.typ: $(wildcard tei/ga*.xml)

%.typ: tei/%.xml typst/tei.xsl
	saxon-he -s:$< -xsl:typst/tei.xsl -o:$@ -xi:on

%.pdf: %.typ typst/ga.typ $(kartei)
	$(typst) $<
