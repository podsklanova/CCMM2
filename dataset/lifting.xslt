<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/1.1" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://model.ccmm.cz/vocabulary/ccmm#" xmlns:ns1="http://www.w3.org/ns/dcat#" xmlns:ns2="http://purl.org/dc/terms/" xmlns:ns3="https://model.ccmm.cz/vocabulary/datacite#">
  <xsl:import href="../metadata-record/lifting.xslt"/>
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../alternate-title/lifting.xslt"/>
  <xsl:import href="../resource-to-agent-relationship/lifting.xslt"/>
  <xsl:import href="../time-reference/lifting.xslt"/>
  <xsl:import href="../resource-type/lifting.xslt"/>
  <xsl:import href="../language-system/lifting.xslt"/>
  <xsl:import href="../terms-of-use/lifting.xslt"/>
  <xsl:import href="../subject/lifting.xslt"/>
  <xsl:import href="../description/lifting.xslt"/>
  <xsl:import href="../location/lifting.xslt"/>
  <xsl:import href="../funding-reference/lifting.xslt"/>
  <xsl:import href="../related-resource/lifting.xslt"/>
  <xsl:import href="../distribution-data-service/lifting.xslt"/>
  <xsl:import href="../distribution-downloadable-file/lifting.xslt"/>
  <xsl:import href="../validation-result/lifting.xslt"/>
  <xsl:import href="../provenance-statement/lifting.xslt"/>
  <xsl:import href="../file/lifting.xslt"/>
  <xsl:import href="../application-profile/lifting.xslt"/>
  <xsl:import href="../format/lifting.xslt"/>
  <xsl:import href="../media-type/lifting.xslt"/>
  <xsl:import href="../checksum/lifting.xslt"/>
  <xsl:import href="../checksum-algorithm/lifting.xslt"/>
  <xsl:import href="../data-service/lifting.xslt"/>
  <xsl:import href="../documentation/lifting.xslt"/>
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
  <xsl:import href="../geometry/lifting.xslt"/>
  <xsl:import href="../location-relation-type/lifting.xslt"/>
  <xsl:import href="../description-type/lifting.xslt"/>
  <xsl:import href="../subject-scheme/lifting.xslt"/>
  <xsl:import href="../access-rights/lifting.xslt"/>
  <xsl:import href="../license-document/lifting.xslt"/>
  <xsl:import href="../repository/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:dataset">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339877323-9dcc-6a36-988a"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339877323-9dcc-6a36-988a">
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
      <rdf:type rdf:resource="http://www.w3.org/ns/dcat#Dataset"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:metadata_identification">
        <ns0:isDescribedBy>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339770114-2bc2-3bdc-a309"/>
        </ns0:isDescribedBy>
      </xsl:for-each>
      <xsl:for-each select="ccmm:identifier">
        <ns0:hasIdentifier>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340169817-84a9-ded1-a656"/>
        </ns0:hasIdentifier>
      </xsl:for-each>
      <xsl:for-each select="ccmm:version">
        <ns1:version rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:version>
      </xsl:for-each>
      <xsl:for-each select="ccmm:title">
        <ns2:title rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:title>
      </xsl:for-each>
      <xsl:for-each select="ccmm:alternate_title">
        <ns0:hasAlternateTitle>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340187136-c36a-9f4c-b745"/>
        </ns0:hasAlternateTitle>
      </xsl:for-each>
      <xsl:for-each select="ccmm:qualified_relation">
        <ns0:qualifiedRelation>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235557653-64a2-513a-97fe"/>
        </ns0:qualifiedRelation>
      </xsl:for-each>
      <xsl:for-each select="ccmm:publication_year">
        <ns3:relatedItemPublicationYear rdf:datatype="http://www.w3.org/2001/XMLSchema#gYear">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns3:relatedItemPublicationYear>
      </xsl:for-each>
      <xsl:for-each select="ccmm:time_reference">
        <ns0:hasTimeReference>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762083331490-ea8b-4a3a-bd65"/>
        </ns0:hasTimeReference>
      </xsl:for-each>
      <xsl:for-each select="ccmm:resource_type">
        <ns2:type>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685065285-430a-9d52-9477"/>
        </ns2:type>
      </xsl:for-each>
      <xsl:for-each select="ccmm:primary_language">
        <ns2:language>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685830295-de50-b2ac-bb47"/>
        </ns2:language>
      </xsl:for-each>
      <xsl:for-each select="ccmm:other_language">
        <ns2:language>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685830295-de50-b2ac-bb47"/>
        </ns2:language>
      </xsl:for-each>
      <xsl:for-each select="ccmm:terms_of_use">
        <ns3:hasRights>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235510107-a209-3731-aa0c"/>
        </ns3:hasRights>
      </xsl:for-each>
      <xsl:for-each select="ccmm:subject">
        <ns3:hasSubject>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742338662847-61c1-8d4b-b552"/>
        </ns3:hasSubject>
      </xsl:for-each>
      <xsl:for-each select="ccmm:description">
        <ns3:hasDescription>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1751275345825-1b14-9c39-8e40"/>
        </ns3:hasDescription>
      </xsl:for-each>
      <xsl:for-each select="ccmm:location">
        <ns2:spatial>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a"/>
        </ns2:spatial>
      </xsl:for-each>
      <xsl:for-each select="ccmm:funding_reference">
        <ns3:hasFundingReference>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235374506-6369-b2fd-b1bf"/>
        </ns3:hasFundingReference>
      </xsl:for-each>
      <xsl:for-each select="ccmm:related_resource">
        <ns0:hasRelatedResource>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1765909420903-5abd-5a0e-810e"/>
        </ns0:hasRelatedResource>
      </xsl:for-each>
      <xsl:for-each select="ccmm:distribution">
        <ns1:distribution>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types" as="element()*">
            <ccmm:distribution_data_service/>
            <ccmm:distribution_downloadable_file/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762011714325-a238-e785-9c3d"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[1])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[1])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762011714325-a238-e785-9c3d"/>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="$type=node-name($types[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[2])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[2])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd"/>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>
        </ns1:distribution>
      </xsl:for-each>
      <xsl:for-each select="ccmm:validation_result">
        <ns0:hasValidationResult>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288707998-704b-3f0e-8e1a"/>
        </ns0:hasValidationResult>
      </xsl:for-each>
      <xsl:for-each select="ccmm:provenance">
        <ns2:provenance>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288763165-c843-1e73-9f91"/>
        </ns2:provenance>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
