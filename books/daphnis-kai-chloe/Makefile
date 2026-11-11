include ../../shared/book.mk

generated = 1.typ 2.typ 3.typ 4.typ daphnis_kai_chloe.typ

all: daphnis_kai_chloe.pdf cover.pdf

daphnis_kai_chloe.pdf: daphnis_kai_chloe.typ $(kartei)
	$(typst) $<

TYPST_FILES = preamble.typ 1.typ 2.typ 3.typ 4.typ
daphnis_kai_chloe.typ: $(TYPST_FILES)
	cat $(TYPST_FILES) > $@

1.typ: xmlchunk1.xml
	saxon-he -s:$< -xsl:perseus2typ.xsl -o:$@
2.typ: xmlchunk2.xml
	saxon-he -s:$< -xsl:perseus2typ.xsl -o:$@
3.typ: xmlchunk3.xml
	saxon-he -s:$< -xsl:perseus2typ.xsl -o:$@
4.typ: xmlchunk4.xml
	saxon-he -s:$< -xsl:perseus2typ.xsl -o:$@
