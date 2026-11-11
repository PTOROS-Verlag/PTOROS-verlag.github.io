<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:tei="http://www.tei-c.org/ns/1.0"
version="2.0">

<xsl:strip-space elements="*"/>

<xsl:output method="text"/>

<xsl:template match="text()"><xsl:value-of select="replace(replace(translate(., '''', '’'), '\*', '#sym.ast.basic '), '(\d+)\.', '$1\\.')"/></xsl:template>

<xsl:template match=
    "*[not(@*|*|comment()|processing-instruction()) 
     and normalize-space()=''
      ]"/>

<xsl:template match="tei:div[@n=2]/tei:head">

  #heading([<xsl:apply-templates/>], level: 3)
</xsl:template>
<xsl:template match="tei:div[@n=1]/tei:head">

  #heading([<xsl:apply-templates/>], level: 2)
</xsl:template>

<xsl:template match="tei:l"><xsl:apply-templates /> \ </xsl:template>
<xsl:template match="tei:hi">#text(font: "Alegreya Sans")[<xsl:apply-templates />]</xsl:template>
<xsl:template match="tei:dateline | tei:p">#par([<xsl:apply-templates />])</xsl:template>
<xsl:template match="tei:lb"></xsl:template>

<xsl:template match="tei:pb[@n]">
  <xsl:if test="matches(@n, '^\d+$')">
  #place(right, text(8pt, font: "Alegreya Sans", luma(50%), [<xsl:value-of select="./@n" />]))
  </xsl:if>
</xsl:template>

<xsl:template match="tei:fw"></xsl:template>

<xsl:template match="/">
  <xsl:apply-templates select=".//tei:body" />
</xsl:template>

</xsl:stylesheet>
