<?xml version="1.0" encoding="UTF-8"?>
<!-- TEI (one volume, or teiCorpus with XInclude resolved) → Typst source for typst/ga.typ.
     Only the body goes in: no front matter, no Anhang, no figures.
     Text goes out as Typst string literals, never as markup, so no character of the
     print needs escaping beyond \ and ". -->
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="urn:local"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">

  <xsl:output method="text" encoding="UTF-8"/>
  <!-- relative to the generated file, which make writes next to typst/ -->
  <xsl:param name="lib" select="'typst/ga.typ'"/>

  <!-- a pb between blocks marks the next block that carries text -->
  <xsl:key name="pb-before"
      match="pb[not(ancestor::l or ancestor::p or ancestor::head or ancestor::speaker)]"
      use="generate-id(following::*[self::l or self::p or self::head or self::speaker][1])"/>

  <xsl:function name="t:str" as="xs:string">
    <xsl:param name="s" as="xs:string"/>
    <xsl:sequence select="concat('&quot;', replace(replace($s, '\\', '\\\\'), '&quot;', '\\&quot;'), '&quot;')"/>
  </xsl:function>

  <xsl:function name="t:args" as="xs:string">
    <xsl:param name="named" as="xs:string*"/>
    <xsl:param name="parts" as="xs:string*"/>
    <xsl:sequence select="string-join(($named, $parts), ', ')"/>
  </xsl:function>

  <!-- the GA pages that begin at a block -->
  <xsl:function name="t:pb" as="xs:string?">
    <xsl:param name="e" as="element()"/>
    <xsl:variable name="pbs" select="key('pb-before', generate-id($e), root($e))"/>
    <xsl:sequence select="if ($pbs) then concat('pb: (', string-join($pbs/t:str(@n), ', '), ',)') else ()"/>
  </xsl:function>

  <xsl:function name="t:roman" as="xs:string">
    <xsl:param name="n" as="xs:string"/>
    <xsl:number value="xs:integer($n)" format="I"/>
  </xsl:function>

  <xsl:template match="/">
    <xsl:text>#import "</xsl:text>
    <xsl:value-of select="$lib"/>
    <xsl:text>": *&#10;</xsl:text>
    <xsl:text>#set document(title: </xsl:text>
    <xsl:value-of select="t:str(string((//titleStmt/title[@type = 'main'])[1]))"/>
    <xsl:text>, author: "Stefan George")&#10;#show: edition&#10;</xsl:text>
    <xsl:if test="teiCorpus">
      <xsl:text>#book()&#10;#contents()&#10;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="//TEI"/>
    <xsl:text>#index()&#10;</xsl:text>
  </xsl:template>

  <!-- Bd. V sets its titles flush left, the other volumes centre them -->
  <xsl:variable name="flush-left" select="'ga05.xml'"/>
  <xsl:function name="t:title-align" as="xs:string">
    <xsl:param name="e" as="node()"/>
    <xsl:sequence select="if (tokenize(base-uri($e), '/')[last()] = $flush-left) then 'left' else 'center'"/>
  </xsl:function>

  <xsl:template match="TEI">
    <xsl:variable name="file" select="tokenize(base-uri(.), '/')[last()]"/>
    <xsl:variable name="band" select="string-join(tokenize(replace($file, '^ga([0-9-]+)\.xml$', '$1'), '-') ! t:roman(.), '/')"/>
    <xsl:text>#volume(title: </xsl:text>
    <xsl:value-of select="t:str(normalize-space(teiHeader/fileDesc/titleStmt/title[@type = 'main']))"/>
    <xsl:text>, band: </xsl:text>
    <xsl:value-of select="t:str($band)"/>
    <xsl:text>)&#10;</xsl:text>
    <xsl:apply-templates select="text/body"/>
  </xsl:template>

  <xsl:template match="body | div">
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <!-- covered by key('pb-before') or by the inline mode -->
  <xsl:template match="pb | figure"/>

  <!-- the plain text of an element as printed, small capitals as written -->
  <xsl:function name="t:plain" as="xs:string">
    <xsl:param name="e" as="element()"/>
    <xsl:sequence select="normalize-space(string-join($e//text()[not(ancestor::corr)]))"/>
  </xsl:function>

  <!-- a div's title starts a page of its own if the div holds further divs, or if the print
       sets it alone on its page: the verse begins on a later one -->
  <xsl:function name="t:own-page" as="xs:boolean">
    <xsl:param name="div" as="element(div)"/>
    <xsl:variable name="head" select="$div/head[last()]"/>
    <xsl:sequence select="exists($div/div) or exists($head/following::pb[. &lt;&lt; ($head/following::l)[1]])"/>
  </xsl:function>

  <!-- a dedication: a line wholly in smaller capitals, like "AN ERNST"; without a rendition
       it stands flush left (DTABf has no #left) -->
  <xsl:function name="t:dedication" as="xs:boolean">
    <xsl:param name="p" as="element(p)"/>
    <xsl:sequence select="(empty($p/@rendition) or $p/@rendition = ('#c', '#right')) and exists($p/hi[contains(@rendition, '#smaller')])
        and not($p/text()[normalize-space()]) and t:plain($p) = upper-case(t:plain($p))"/>
  </xsl:function>

  <!-- the poem a div's title and dedications belong to: the first thing after them, if it is
       a poem and the title has no page of its own -->
  <xsl:function name="t:headed-poem" as="element(lg)?">
    <xsl:param name="div" as="element(div)"/>
    <xsl:variable name="next" select="$div/*[not(self::head or self::pb or self::p[t:dedication(.)])][1]"/>
    <xsl:sequence select="$next[self::lg[@type = 'poem']][not($div/head and t:own-page($div))]"/>
  </xsl:function>

  <xsl:function name="t:align" as="xs:string?">
    <xsl:param name="e" as="element()"/>
    <xsl:sequence select="map {'#c': 'center', '#right': 'right'}(string($e/@rendition))"/>
  </xsl:function>

  <!-- a title set on several lines is one title; numbers are no titles for the index -->
  <xsl:function name="t:title-args" as="xs:string*">
    <xsl:param name="div" as="element(div)"/>
    <xsl:variable name="heads" select="$div/head"/>
    <xsl:variable name="text" select="string-join($heads ! t:plain(.), ' ')"/>
    <xsl:variable name="pbs" select="$heads ! key('pb-before', generate-id(.))"/>
    <xsl:sequence select="
        if ($pbs) then concat('pb: (', string-join($pbs/t:str(@n), ', '), ',)') else (),
        if (matches($text, '^[IVXLC0-9]+\.?$')) then () else concat('entry: ', t:str($text)),
        if (t:own-page($div)) then (concat('toc: ', t:str($text)), concat('level: ', count($div/ancestor-or-self::div)))
        else concat('align: ', t:str(t:title-align($div))),
        string-join($heads ! string-join(t:inline(.), ', '), ', linebreak(), ')"/>
  </xsl:function>

  <xsl:template match="div/head[1]" priority="1">
    <xsl:if test="not(t:headed-poem(..))">
      <xsl:value-of select="if (t:own-page(..)) then '#section(' else '#title('"/>
      <xsl:value-of select="string-join(t:title-args(..), ', ')"/>
      <xsl:text>)&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="div/head"/>

  <xsl:function name="t:dedication-call" as="xs:string">
    <xsl:param name="p" as="element(p)"/>
    <xsl:param name="name" as="xs:string"/>
    <xsl:sequence select="concat($name, '(', t:args((t:pb($p), concat('align: ', t:str((t:align($p), 'left')[1]))), t:inline($p)), ')')"/>
  </xsl:function>

  <xsl:template match="p">
    <xsl:choose>
      <xsl:when test="t:dedication(.) and parent::div and t:headed-poem(..)"/>
      <xsl:when test="t:dedication(.)">
        <xsl:value-of select="concat('#', t:dedication-call(., 'dedication'), '&#10;')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>#p(</xsl:text>
        <xsl:value-of select="t:args((t:pb(.), t:align(.) ! concat('align: ', .)), t:inline(.))"/>
        <xsl:text>)&#10;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- a speech in a dialogue: the speaker's name, then the verse -->
  <xsl:template match="sp">
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="speaker">
    <xsl:text>#speaker(</xsl:text>
    <xsl:value-of select="t:args(t:pb(.), t:inline(.))"/>
    <xsl:text>)&#10;</xsl:text>
  </xsl:template>

  <!-- a motto at the head of a poem or cycle -->
  <xsl:template match="epigraph">
    <xsl:text>#epigraph(</xsl:text>
    <xsl:value-of select="string-join(*/(
        if (self::lg) then concat('(', string-join(l ! t:line(., false()), ', '), ',)')
        else if (self::bibl) then concat('source(', string-join(t:inline(.), ', '), ')')
        else if (self::p) then concat('p(', t:args((t:pb(.), if (@rendition = '#c') then 'align: center' else ()), t:inline(.)), ')')
        else error((), concat('unexpected ', name(), ' in epigraph'))), ', ')"/>
    <xsl:text>)&#10;</xsl:text>
  </xsl:template>

  <!-- a poem under a title (and maybe a dedication) has none; untitled ones, and those after a
       section's own title page, open with a large initial. A speech is found by its dialogue's
       title, not by its first line -->
  <xsl:template match="lg[@type = 'poem']">
    <xsl:variable name="speech" select="exists(parent::sp)"/>
    <xsl:variable name="titled" select="if ($speech) then true() else exists(preceding-sibling::head) and not(t:own-page(..))"/>
    <xsl:variable name="first" select="(.//l)[1]"/>
    <xsl:variable name="stanzas" select="if (lg) then lg else ."/>
    <!-- title and dedications go into the poem's block, so they stay with it and align with it -->
    <xsl:variable name="heading" select="if (parent::div and . is t:headed-poem(..)) then (
        ../head[1] ! concat('title-part(', string-join(t:title-args(..), ', '), ')'),
        ../p[t:dedication(.)][. &lt;&lt; current()] ! t:dedication-call(., 'dedication-part')) else ()"/>
    <xsl:text>#poem(</xsl:text>
    <xsl:value-of select="t:args((if ($speech) then () else concat('first: ', t:str(t:plain($first))),
                                  if (exists($heading)) then concat('heading: (', string-join($heading, ', '), ',)') else ()),
                                 $stanzas ! concat('(', string-join(l ! t:line(., not($titled) and . is $first), ', '), ',)'))"/>
    <xsl:text>)&#10;</xsl:text>
  </xsl:template>

  <xsl:function name="t:line" as="xs:string">
    <xsl:param name="l" as="element(l)"/>
    <xsl:param name="initial" as="xs:boolean"/>
    <!-- the initial is the first letter, wherever it sits: taken out of its text node -->
    <xsl:variable name="text" select="if ($initial) then ($l//text()[not(ancestor::corr)][matches(., '\p{L}')])[1] else ()"/>
    <xsl:variable name="lead" select="$text ! replace(replace(., '\s+', ' '), '^ ', '')"/>
    <xsl:variable name="pre" select="string($lead ! replace(., '^(\P{L}*)\p{L}.*$', '$1', 's'))"/>
    <xsl:variable name="parts" as="xs:string*">
      <xsl:apply-templates select="$l/node()" mode="inline">
        <xsl:with-param name="skip" select="$text" tunnel="yes"/>
        <xsl:with-param name="skip-chars" select="string-length($pre) + 1" tunnel="yes"/>
      </xsl:apply-templates>
    </xsl:variable>
    <xsl:variable name="initial-parts" select="if ($text) then ($pre[.] ! t:str(.), concat('initial(', t:str(substring($lead, string-length($pre) + 1, 1)), ')')) else ()"/>
    <xsl:sequence select="concat('l(', t:args((
        t:pb($l),
        if (starts-with($l/@rendition, '#et')) then concat('indent: ', max((1, xs:integer(substring-after($l/@rendition, '#et')[. != '']))))  else ()),
      ($initial-parts, $parts)), ')')"/>
  </xsl:function>

  <!-- inline content: a list of Typst expressions -->
  <xsl:function name="t:inline" as="xs:string*">
    <xsl:param name="e" as="element()"/>
    <xsl:apply-templates select="$e/node()" mode="inline"/>
  </xsl:function>

  <xsl:template match="text()" mode="inline">
    <xsl:param name="skip" as="text()?" tunnel="yes"/>
    <xsl:param name="skip-chars" as="xs:integer?" tunnel="yes"/>
    <xsl:variable name="texts" select="ancestor::*[self::l or self::p or self::head or self::bibl][1]//text()[not(ancestor::corr)]"/>
    <xsl:variable name="s" select="replace(., '\s+', ' ')"/>
    <xsl:variable name="s" select="if (. is $texts[1]) then replace($s, '^ ', '') else $s"/>
    <xsl:variable name="s" select="if (exists($skip) and . is $skip) then substring($s, $skip-chars + 1) else $s"/>
    <xsl:variable name="s" select="if (. is $texts[last()]) then replace($s, ' $', '') else $s"/>
    <xsl:sequence select="if ($s) then t:str($s) else ()"/>
  </xsl:template>

  <xsl:template match="hi" mode="inline">
    <xsl:variable name="parts" as="xs:string*">
      <xsl:apply-templates select="node()" mode="inline"/>
    </xsl:variable>
    <xsl:variable name="inner" select="string-join($parts, ', ')"/>
    <xsl:variable name="wrap" select="for $r in tokenize(@rendition) return
        map {'#k': 'sc', '#g': 'spaced', '#smaller': 'smaller', '#i': 'emph'}($r)"/>
    <xsl:sequence select="fold-right($wrap, $inner, function($f, $acc) { concat($f, '(', $acc, ')') })"/>
  </xsl:template>

  <!-- printing errors stay as printed -->
  <xsl:template match="choice" mode="inline">
    <xsl:apply-templates select="sic/node()" mode="inline"/>
  </xsl:template>

  <xsl:template match="pb" mode="inline">
    <xsl:sequence select="concat('pb(', t:str(@n), ')')"/>
  </xsl:template>

  <xsl:template match="*" mode="inline">
    <xsl:message terminate="yes">unexpected inline element <xsl:value-of select="name()"/></xsl:message>
  </xsl:template>

  <xsl:template match="*">
    <xsl:message terminate="yes">unexpected element <xsl:value-of select="name()"/> in <xsl:value-of select="name(..)"/></xsl:message>
  </xsl:template>

</xsl:stylesheet>
