<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:include href="SharedTemplates.xslt"/>
	<!--Author: Meena Pillai -->
	<!--Version: 1.1 -->
	<!--Date Created: 30th August 2007-->
	<!--Date Modified: 11th June 2009-->
	<!--Purpose: To check that the address is not more than 25 characters long for the following messages only:
			•	PDS NHS Number Allocation Request - PRPA_IN000200UK03 [PRPA_MT000203UK03 (PatientRole.addr)]
			•	PDS General Update Request - PRPA_IN000203UK03 [PRPA_MT000206UK04 (PatientRole.addr/ RelatedPersonRole.addr)]
			•	PDS NHAIS Update Request - PRPA_IN000204UK03 [PRPA_RM000208UK03 (PatientRole.addr)]
			•	PDS Create Initial Record Request - PRPA_IN000205UK03 [PRPA_MT000211UK03 (Patient.addr)]
			•	PDS Birth Notification - PRPA_IN000208UK03 [PRPA_MT000212UK03 (Patient.addr/]
-->
	<xsl:template match="/">
		<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//*[name()='addr'][ancestor::hl7:patientRole or ancestor::hl7:patient or ancestor::hl7:COCT_MT000201UK02.PartOfWhole]/hl7:streetAddressLine"/>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//*[name()='addr'][ancestor::hl7:patientRole or ancestor::hl7:patient or ancestor::hl7:COCT_MT000201UK02.PartOfWhole]/hl7:streetAddressLine">
		<xsl:for-each select=".">
			<xsl:call-template name="CheckAD_Addresslines_NotMore35characters"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CheckAD_Addresslines_NotMore35characters">
		<xsl:for-each select="self::node()[string-length(.)>35]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddressMoreThan35Lines_DoesNotExist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that all the addresses streetAddressLine has a length that does not exceed 35.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The address sub element streetAddressLine must not exceed 35 characters</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
