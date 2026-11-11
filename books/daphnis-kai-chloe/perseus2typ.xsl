<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="text"/>


  <!-- <xsl:template match="@*|node()"> <xsl:copy> <xsl:apply-templates select="@*|node()"/> </xsl:copy> </xsl:template> -->

  <xsl:template match="TEI.2|text|body"> <xsl:apply-templates/> </xsl:template> <xsl:template match="div1">
= #greekNumbers(<xsl:value-of select="@n"/>)
    <xsl:apply-templates/></xsl:template>

  <xsl:template match="div2">

    #place(left, dx: -2em, text(0.8em, greekNumbers(<xsl:value-of select="./@n" />))) <xsl:apply-templates/>

  </xsl:template>

  <xsl:template match="p">

    <xsl:apply-templates/>

  </xsl:template>

  <xsl:template match="head">
    #align(center, block([<xsl:apply-templates/>]))
  </xsl:template>

  <!-- Normalize text: collapse newlines & extra spaces -->
  <xsl:template match="text()">
    <xsl:value-of select="normalize-space()"/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="milestone[@unit='section']"/>
  <xsl:template match="pb"/>
  <xsl:template match="q">#quote[<xsl:apply-templates/>]</xsl:template>

  <xsl:template match="del"><xsl:apply-templates/></xsl:template>
</xsl:stylesheet>
