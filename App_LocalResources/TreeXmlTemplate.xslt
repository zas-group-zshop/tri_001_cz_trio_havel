<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" version="1.0" encoding="windows-1250"/>

  <xsl:template match="root" >
    <xsl:element name="root">
      <xsl:element name="skupiny_items">
        <xsl:element name="skupiny_item">
          <xsl:element name="id">ROOT</xsl:element>
          <xsl:element name="nazev">ROOT</xsl:element>
          <xsl:apply-templates select="nomskup_items" mode="skupiny" />
          <xsl:apply-templates select="dalsi_skupiny_items" mode="skupiny" />
          <xsl:apply-templates select="vyrobci_items" mode="skupiny" />
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dalsi_skupiny_items" mode="skupiny" >
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="dalsi_skupiny_item" mode="skupina" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="dalsi_skupiny_item" mode="skupina" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev"/>
      </xsl:element>
      <xsl:element name="nazev_html">
        <xsl:value-of select="nazev_html"/>
      </xsl:element>
      <xsl:element name="skupina">
        <xsl:value-of select="skupina"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
      <xsl:apply-templates select="dalsi_skupiny_items" mode="polozky" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="dalsi_skupiny_items" mode="polozky" >
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="dalsi_skupiny_item[string-length(zatrideni)=10]" mode="polozka" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="dalsi_skupiny_item" mode="polozka" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="skupina">
        <xsl:value-of select="skupina"/>
      </xsl:element>
      <xsl:element name="skupina_nomenklatur">
        <xsl:value-of select="skupina_nomenklatur"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev_skupiny"/>
      </xsl:element>
      <xsl:element name="nazev_html">
        <xsl:value-of select="nazev_html"/>
      </xsl:element>
      <xsl:element name="zatrideni">
        <xsl:value-of select="zatrideni"/>
      </xsl:element>
      <xsl:element name="url">
        <xsl:value-of select="www_odkaz"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
      <xsl:variable name="id" select="./zatrideni"/>
      <xsl:element name="skupiny_items">
        <xsl:apply-templates select="../dalsi_skupiny_item[starts-with(zatrideni,$id) and (string-length(zatrideni)=string-length($id)+10)]" mode="polozka" />
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="vyrobci_items" mode="skupiny" >
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="vyrobci_item" mode="skupina" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="vyrobci_item" mode="skupina" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
      <xsl:apply-templates select="vyrobci_items" mode="polozky" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="vyrobci_items" mode="polozky" >
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="vyrobci_item" mode="polozka" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="vyrobci_item" mode="polozka" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="kod_vyrobce">
        <xsl:value-of select="kod_vyrobce"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev"/>
      </xsl:element>
      <xsl:element name="nazev_html">
        <xsl:value-of select="nazev_html"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="nomskup_items" mode="skupiny" >
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="nomskup_item" mode="skupina" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="nomskup_item" mode="skupina" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
      <xsl:apply-templates select="nomskup_items" mode="polozky" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="nomskup_items" mode="polozky" >
    <xsl:variable name="zatrideni_len" select="../zatrideni_len"/>
    <xsl:element name="skupiny_items">
      <xsl:apply-templates select="nomskup_item[string-length(zatrideni)=$zatrideni_len+10]" mode="polozka" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="nomskup_item" mode="polozka" >
    <xsl:element name="skupiny_item">
      <xsl:element name="id">
        <xsl:value-of select="id"/>
      </xsl:element>
      <xsl:element name="int_id">
        <xsl:value-of select="int_id"/>
      </xsl:element>
      <xsl:element name="url_prefix">
        <xsl:value-of select="url_prefix"/>
      </xsl:element>
      <xsl:element name="skupina_nomenklatur">
        <xsl:value-of select="skupina_nomenklatur"/>
      </xsl:element>
      <xsl:element name="nazev">
        <xsl:value-of select="nazev_skupiny"/>
      </xsl:element>
      <xsl:element name="nazev_html">
        <xsl:value-of select="nazev_html"/>
      </xsl:element>
      <xsl:element name="zatrideni">
        <xsl:value-of select="zatrideni"/>
      </xsl:element>
      <xsl:element name="nice_url">
        <xsl:value-of select="nice_url"/>
      </xsl:element>
      <xsl:element name="url_gen">
        <xsl:value-of select="gen_url"/>
      </xsl:element>
      <xsl:variable name="id" select="./zatrideni"/>
      <xsl:element name="skupiny_items">
        <xsl:apply-templates select="../nomskup_item[starts-with(zatrideni,$id) and (string-length(zatrideni)=string-length($id)+10)]" mode="polozka" />
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>