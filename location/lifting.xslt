<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/1.1" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://www.w3.org/ns/dcat#" xmlns:ns1="http://purl.org/dc/terms/" xmlns:ns2="http://www.w3.org/ns/locn#" xmlns:ns3="https://model.ccmm.cz/vocabulary/ccmm#">
  <xsl:import href="../geometry/lifting.xslt"/>
  <xsl:import href="../related-resource/lifting.xslt"/>
  <xsl:import href="../location-relation-type/lifting.xslt"/>
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../alternate-title/lifting.xslt"/>
  <xsl:import href="../resource-to-agent-relationship/lifting.xslt"/>
  <xsl:import href="../time-reference/lifting.xslt"/>
  <xsl:import href="../resource-type/lifting.xslt"/>
  <xsl:import href="../resource-relation-type/lifting.xslt"/>
  <xsl:import href="../time-interval/lifting.xslt"/>
  <xsl:import href="../time-instant/lifting.xslt"/>
  <xsl:import href="../date-type/lifting.xslt"/>
  <xsl:import href="../organization/lifting.xslt"/>
  <xsl:import href="../person/lifting.xslt"/>
  <xsl:import href="../resource-agent-role-type/lifting.xslt"/>
  <xsl:import href="../contact-details/lifting.xslt"/>
  <xsl:import href="../address/lifting.xslt"/>
  <xsl:import href="../identifier-scheme/lifting.xslt"/>
  <xsl:import href="../alternate-title-type/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:location">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a"/>
      </xsl:variable>
      <xsl:for-each select="$result">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
      <xsl:for-each select="$result//top-level/node()">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
    </rdf:RDF>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template name="remove-top">
    <xsl:for-each select="@*">
      <xsl:copy/>
    </xsl:for-each>
    <xsl:for-each select="node()[not(. instance of element(top-level))]">
      <xsl:copy>
        <xsl:call-template name="remove-top"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="ccmm:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="ccmm:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://model.ccmm.cz/vocabulary/datacite#Geolocation"/>
      <rdf:type rdf:resource="http://purl.org/dc/terms/Location"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:bounding_box">
        <ns0:bbox rdf:datatype="http://www.w3.org/2000/01/rdf-schema#Literal">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:bbox>
      </xsl:for-each>
      <xsl:for-each select="ccmm:name">
        <ns1:title rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:title>
      </xsl:for-each>
      <xsl:for-each select="ccmm:geometry">
        <ns2:geometry>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7"/>
        </ns2:geometry>
      </xsl:for-each>
      <xsl:for-each select="ccmm:related_object">
        <ns3:hasRelatedResource>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1765909420903-5abd-5a0e-810e"/>
        </ns3:hasRelatedResource>
      </xsl:for-each>
      <xsl:for-each select="ccmm:relation_type">
        <ns3:hasType>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685228117-d1d5-c203-b159"/>
        </ns3:hasType>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
