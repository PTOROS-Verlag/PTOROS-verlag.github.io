brahmane_all.pdf: brahmane_all.typ brahmane_1.typ brahmane_2.typ brahmane_3.typ brahmane_4.typ brahmane_5.typ brahmane_6.typ
	typst compile brahmane_all.typ

.PHONY: clean
clean:
	rm brahmane_{1,2,3,4,5,6}.typ
	rm cover.pdf
	rm *.pdf

cover.pdf: cover.tex
	latexmk -pdf $<

brahmane_1.typ: rueckert_brahmane01_1836.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@

brahmane_2.typ: rueckert_brahmane02_1837.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@

brahmane_3.typ: rueckert_brahmane03_1837.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@

brahmane_4.typ: rueckert_brahmane04_1838.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@

brahmane_5.typ: rueckert_brahmane05_1839.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@

brahmane_6.typ: rueckert_brahmane06_1839.TEI-P5.xml pdf.xsl
	saxon-he -s:$< -xsl:pdf.xsl -o:$@
	sed -i 's/ſ/s/g;s/uͤ/ü/g;s/aͤ/ä/g;s/oͤ/ö/g' $@
