<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
	<xsl:include href="SharedTemplates.xslt"/>
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<!--Author: Meena Pillai -->
	<!--Version: 3.1 -->
	<!--Date Created: 24th October 2007-->
	<!--Date Modified: 18th May 2009-->
	<!--Modified By: Meena Pillai -->
	<!--Purpose: To cover all the PDS constraints relating to name, address and telecom based on the MIM and compliance document constraints.-->
	<xsl:template match="/">
		<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//*[hl7:name]"/>

	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//*[hl7:name]">
		<xsl:for-each select=".">
			<xsl:call-template name="CheckName_NullFamily_DoesNotExist"/>
			<xsl:call-template name="CheckPatientName_subElementsExceed35Char_DoesNotExist"/>
			<xsl:call-template name="CheckName_2ndGivenMoreThan100Char_DoesNotExist"/>
			
			<!--<xsl:call-template name="CheckAddedAltered_Name_PrefixContainingFullStop_DoesNotExist"/>-->
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="CheckName_NullFamily_DoesNotExist">
		<xsl:for-each select="self::node()[name()='patientPerson' or name()='player' or name()='scopedRelatedPersonRole'][string-length(hl7:name/hl7:family)=0]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckName_NullFamily_DoesNotExist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the name child element family contains a value.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Name child element Family must contain a value.</xsl:text>
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
	<xsl:template name="CheckPatientName_subElementsExceed35Char_DoesNotExist">
		<xsl:for-each select="self::node()[name()='patientPerson' or name()='player' or name()='scopedRelatedPersonRole']/hl7:name[string-length(hl7:family)>35 or string-length(hl7:prefix)>35 or string-length(hl7:suffix)>35 or string-length(hl7:given[1])>35]">
			<xsl:for-each select="self::node()/child::*">
				<xsl:if test="self::node()[string-length(self::node())>35]">
					<table border="1" width="800">
						<tr>
							<th>Name: </th>
							<td>
								<font color="#0000CC">
									<b>CheckPatientName_subElementsExceed35Char_DoesNotExist</b>
								</font>
							</td>
						</tr>
						<tr>
							<th>Description: </th>
							<td>
								<font color="#000000">
							This checks that the name child element family contains a value.
						</font>
							</td>
						</tr>
						<tr>
							<th>Result:</th>
							<td>
								<xsl:element name="font">
									<xsl:attribute name="color">xFF0000</xsl:attribute>
									<b>
										<xsl:text>Failure error: The Name child elements must not contain a value which exceeds the character length of 35.</xsl:text>
									</b>
									<xsl:text>&lt;br/></xsl:text>
									<xsl:call-template name="plotPath">
										<xsl:with-param name="forNode" select="."/>
									</xsl:call-template>
								</xsl:element>
								<xsl:value-of select="."/>
							</td>
						</tr>
					</table>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CheckName_2ndGivenMoreThan100Char_DoesNotExist">
		<xsl:for-each select="self::node()[name()='patientPerson' or name()='player' or name()='scopedRelatedPersonRole'][string-length(hl7:name/hl7:given[2])>100]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_Name_2ndGivenMoreThan100Char_DoesNotExist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the value of the 2nd occurance of given name does not exceed 100 characters in length.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The second given name must not exceed 100 characters in length.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
						<xsl:value-of select="."/>
					</td>
				</tr>
			</table>
		</xsl:for-each>
	</xsl:template>
	<!--
	<xsl:template name="CheckAddedAltered_Name_PrefixContainingFullStop_DoesNotExist">
		<xsl:for-each select="self::node()[name()='patientPerson' or name()='player' or name()='scopedRelatedPersonRole'][contains(hl7:name/hl7:prefix[1],'.')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_Name_PrefixContainingFullStop_DoesNotExist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the value of the prefix name does not contain a fullstop.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The prefix name must not contain a fullstop.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
						<xsl:value-of select="."/>
					</td>
				</tr>
			</table>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CheckName_ContainsMultiSpace_DoesNotExist">
		<xsl:for-each select="self::node()[name()='patientPerson' or name()='player' or name()='scopedRelatedPersonRole'][count(child::hl7:name)>0]">
			<xsl:for-each select="self::node()/child::hl7:name/*">
				<xsl:if test="self::node()[contains(.,'  ')]">
					<table border="1" width="800">
						<tr>
							<th>Name: </th>
							<td>
								<font color="#0000CC">
									<b>CheckAddedAltered_Name_ContainsMultiSpace_DoesNotExist</b>
								</font>
							</td>
						</tr>
						<tr>
							<th>Description: </th>
							<td>
								<font color="#000000">
							This checks that the value of the prefix name does not contain a multiple spaces
						</font>
							</td>
						</tr>
						<tr>
							<th>Result:</th>
							<td>
								<xsl:element name="font">
									<xsl:attribute name="color">xFF0000</xsl:attribute>
									<b>
										<xsl:text>Failure error: The prefix name must not contain multiple spaces.</xsl:text>
									</b>
									<xsl:text>&lt;br/></xsl:text>
									<xsl:call-template name="plotPath">
										<xsl:with-param name="forNode" select="."/>
									</xsl:call-template>
								</xsl:element>
								<xsl:value-of select="."/>
							</td>
						</tr>
					</table>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>-->
</xsl:stylesheet>
