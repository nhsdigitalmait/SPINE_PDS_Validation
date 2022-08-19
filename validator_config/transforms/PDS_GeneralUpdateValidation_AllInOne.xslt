<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xml:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:include href="SharedTemplates.xslt"/>
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<!--Author: Meena Pillai-->
	<!--Version: 6.0-->
	<!--Date Created: 30th July 2007-->
	<!--Date Modified: 8th July 2011--> 
	<!--Modified By: Meena Pillai and Richard Robinson-->
	<!--Purpose: To check that data within PDS General Update complies to MIM and compliance document constraints. -->
	<!--Modified By: Richard Robinson-->
	<!--Purpose: 10/11/11 updated name() to local-name() to cope with explicit namespace tags-->
	<xsl:template match="/">
		<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='removed']">
	</xsl:apply-templates>
		<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='added']">
	</xsl:apply-templates>
		<xsl:apply-templates select="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='altered']">
	</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='removed']">
		<xsl:for-each select=".">
			<xsl:call-template name="CheckAll_LanguageCommunication_UpdateMode"/>
			<xsl:call-template name="CheckAll_PrefWritCommRelPers_UpdateMode"/>
			<xsl:call-template name="CheckAll_RelPersId_MoreThanOne"/>
			<xsl:call-template name="CheckRemoved_ForAddrSubElements"/>
			<xsl:call-template name="CheckRemoved_ForAddrUseablePeriod"/>
			<xsl:call-template name="CheckRemoved_AssocPat_LanguageComm_Errors"/>
			<xsl:call-template name="CheckRemoved_AssocPat_PreferredContactMethErrors"/>
			<xsl:call-template name="CheckRemoved_AssocPat_PrefWritComm_Value"/>
			<xsl:call-template name="CheckRemoved_ConsentValue"/>
			<xsl:call-template name="CheckRemoved_HealthspaceRegValue"/>
			<xsl:call-template name="CheckRemoved_MultBirthOrderNo"/>
			<xsl:call-template name="CheckRemoved_NameErrors"/>
			<xsl:call-template name="CheckRemoved_ForNameSubElements"/>
			<xsl:call-template name="CheckRemoved_NhaisValue"/>
			<xsl:call-template name="CheckRemovedAltered_PatCareProvIDError"/>
			<xsl:call-template name="CheckRemovedAltered_PDSObjID"/>
			<xsl:call-template name="CheckRemovedAltered_PDSObjIDNullExtension"/>
			<xsl:call-template name="CheckRemoved_PersonBirthTimeLength_8Or12_Exist"/>
			<xsl:call-template name="CheckRemoved_RelPersSubElements_ExceptPDSUniqID"/>
			<xsl:call-template name="CheckRemoved_RelPersId"/>
			<xsl:call-template name="CheckRemoved_SharedSecretValue"/>
			<xsl:call-template name="CheckRemoved_TelAttr_Errors"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='added']">
		<xsl:for-each select=".">
			<xsl:call-template name="CheckAll_LanguageCommunication_UpdateMode"/>
			<xsl:call-template name="CheckAll_PrefWritCommRelPers_UpdateMode"/>
			<xsl:call-template name="CheckAll_RelPersId_MoreThanOne"/>
			<xsl:call-template name="CheckAddedAltered_AssocPat_PreferredContactMethValue_Exist"/>
			<!--<xsl:call-template name="CheckAddedAltered_AssocPat_LanguageComm_Errors"/>REQUIRE FURTHER WORK-->
			<xsl:call-template name="CheckAddedAltered_Addr_FirstOrSecOrFourthIsNull"/>
			<xsl:call-template name="CheckAddedAltered_Birthplace_Addr_InvalidCountryCode"/>
			<!--Needs rework<xsl:call-template name="CheckAddedAltered_BirthTimeCompleteLength8Or12"/>REQUIRE FURTHER WORK-->
			<xsl:call-template name="CheckAddedAltered_ConsentValue_Exist"/>
			<xsl:call-template name="CheckAddedAltered_HealthspaceRegValue_Exist"/>
			<xsl:call-template name="CheckAD_HomeAddress_AddedOrAltered_NoBusinessEffectiveDateHigh"/>
			<xsl:call-template name="CheckAddedAltered_Name_Family_Exist"/>
			<xsl:call-template name="CheckAddedAltered_Name_Error"/>
			<xsl:call-template name="CheckAddedAltered_NhaisValue_Exist"/>
			<xsl:call-template name="CheckAdded_PDSObjID"/>
			<xsl:call-template name="CheckAddedAltered_Name_Error"/>
			<xsl:call-template name="CheckAddedAltered_RelatedPersRol_Code_Exist"/>
			<xsl:call-template name="CheckAddedAltered_RelatedPersRol_Errors"/>
			<xsl:call-template name="CheckAddedAltered_SharedSecretValue_Exist"/>
			<xsl:call-template name="CheckAdded_TelecomAfterColonValue_Exist"/>
			<xsl:call-template name="CheckAdded_TelecomBeforeColonValue_Exist"/>
			<xsl:call-template name="CheckAdded_TelecomValueColon_Exist"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="/*[1]/hl7:ControlActEvent/hl7:subject//*[@updateMode='altered']">
		<xsl:for-each select=".">
			<xsl:call-template name="CheckAll_LanguageCommunication_UpdateMode"/>
			<xsl:call-template name="CheckAll_PrefWritCommRelPers_UpdateMode"/>
			<xsl:call-template name="CheckAll_RelPersId_MoreThanOne"/>
			<xsl:call-template name="CheckAddedAltered_AssocPat_PreferredContactMethValue_Exist"/>
			<!--<xsl:call-template name="CheckAddedAltered_AssocPat_LanguageComm_Errors"/> REQUIRE FURTHER WORK-->
			<xsl:call-template name="CheckAddedAltered_Addr_FirstOrSecOrFourthIsNull"/>
			<xsl:call-template name="CheckAddedAltered_Birthplace_Addr_InvalidCountryCode"/>
			<!--<xsl:call-template name="CheckAddedAltered_BirthTimeCompleteLength8Or12"/>REQUIRE FURTHER WORK-->
			<xsl:call-template name="CheckAddedAltered_ConsentValue_Exist"/>
			<xsl:call-template name="CheckAD_HomeAddress_AddedOrAltered_NoBusinessEffectiveDateHigh"/>
			<xsl:call-template name="CheckAddedAltered_HealthspaceRegValue_Exist"/>
			<xsl:call-template name="CheckAddedAltered_Name_Family_Exist"/>
			<xsl:call-template name="CheckAddedAltered_Name_Error"/>
			<xsl:call-template name="CheckAddedAltered_NhaisValue_Exist"/>
			<xsl:call-template name="CheckRemovedAltered_PDSObjID"/>
			<xsl:call-template name="CheckRemovedAltered_PDSObjIDNullExtension"/>
			<xsl:call-template name="CheckAddedAltered_PrefWritComm_Value_Exist"/>
			<xsl:call-template name="CheckAddedAltered_RelatedPersRol_Code_Exist"/>
			<xsl:call-template name="CheckAddedAltered_RelatedPersRol_Errors"/>
			<xsl:call-template name="CheckAddedAltered_SharedSecretValue_Exist"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CheckAll_LanguageCommunication_UpdateMode">
		<xsl:for-each select="self::node()[name()='languageCommunication' and ancestor::hl7:scopedRelatedPersonRole and @updateMode]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAll_LanguageCommunication_UpdateMode</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Scoped Related Person Role child element Language Communication does not have a updateMode attribute.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Related Person preferred Language Communication must not contain a updateMode attribute.</xsl:text>
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
	<xsl:template name="CheckAll_PrefWritCommRelPers_UpdateMode">
		<xsl:for-each select="self::node()[name()='preferredWrittenCommunicationFormat' and ancestor::hl7:scopedRelatedPersonRole and @updateMode]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAll_PrefWritCommRelPers_UpdateMode</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Scoped Related Person Role child element Preferred Written Communication Format does not have a updateMode attribute.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Related Person preferred written communication format must not contain a updateMode attribute.</xsl:text>
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
	<xsl:template name="CheckAll_RelPersId_MoreThanOne">
		<xsl:if test="self::node()[name()='scopedRelatedPersonRole']">
			<xsl:for-each select="self::node()[name()='scopedRelatedPersonRole'][count(hl7:id[@root='2.16.840.1.113883.2.1.4.1'])>1 or count(hl7:id[@root='2.16.840.1.113883.2.1.3.2.4.3'])>1 or hl7:id/@root='2.16.840.1.113883.2.1.4.1' and hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.3']">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAll_RelPersId_MoreThanOne</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that for the Related Person there is only one occurance of the element id with its attribute 
				root='2.16.840.1.113883.2.1.4.1' or '2.16.840.1.113883.2.1.3.2.4.3'.
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: There should be only one occurance of the Related Person id with the attribute root ='2.16.840.1.113883.2.1.4.1' or '2.16.840.1.113883.2.1.3.2.4.3'</xsl:text>
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
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_ForAddrSubElements">
		<xsl:for-each select="self::node()[name()='addr'][count(child::*)>0 and not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_ForAddrSubElements</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that an address element with updateMode = 'removed'  does not have any 
							child elements.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: An address element must not have any sub elements</xsl:text>
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
	<xsl:template name="CheckRemoved_ForAddrUseablePeriod">
		<xsl:if test="self::node()[name()='addr'][hl7:useablePeriod]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_ForAddrUseablePeriod</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that an address element with updateMode = 'removed'  does not have a useablePeriod 
							child element.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: An address element must not have any useablePeriod sub element</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_AssocPat_LanguageComm_Errors">
		<!-- Sub Checks: (1) CheckRemoved_LanguageCode, (2) CheckRemoved_proficiencyLevelCode, 
              (3) CheckRemoved_preferenceInd-->
		<xsl:choose>
			<xsl:when test="self::node()[name()='languageCommunication'][ancestor::hl7:patientPerson][hl7:languageCode or hl7:proficiencyLevelCode or hl7:preferenceInd]">
				<table width="800" border="1">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemoved_AssocPat_LanguageComm_Errors</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Language Communication elements associated to a patient does not have any errors by running additional sub rules. 
							child elements.
						</font>
						</td>
					</tr>
					<tr>
						<th>Sub Rules Result:</th>
						<td>
							<xsl:if test="self::node()[hl7:languageCode]">
								<table border="1" width="800">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckRemoved_LanguageCode</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the Language Communication child element languageCode does not exist.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The languageCode element should not be present</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
									<xsl:if test="self::node()[hl7:proficiencyLevelCode]">
										<tr>
											<td>
												<font color="#0000CC">
													<b>CheckRemoved_proficiencyLevelCode</b>
												</font>
											</td>
											<tr>
												<td style="width:80%">
													<font color="#000000">This checks that the Language Communication child element proficiencyLevelCode does not exist.</font>
												</td>
											</tr>
											<td>
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: The proficiencyLevelCode element should not be present</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="self::node()[hl7:preferenceInd]">
										<tr>
											<td>
												<font color="#0000CC">
													<b>CheckRemoved_preferenceInd</b>
												</font>
											</td>
											<tr>
												<td style="width:80%">
													<font color="#000000">This checks that the Language Communication child element preferenceInd does not exist.</font>
												</td>
											</tr>
											<td>
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: The preferenceInd element should not be present</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
									</xsl:if>
								</table>
							</xsl:if>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckRemoved_AssocPat_PreferredContactMethErrors">
		<!-- Sub Checks: (1) CheckRemoved_ValueElement, (2) CheckRemoved_PrefConTimesElement-->
		<xsl:choose>
			<xsl:when test="self::node()[name()='preferredContactMethod' and ancestor::hl7:patientRole] [hl7:pertinentInformation/hl7:pertinentPreferredContactTimes or hl7:value]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemoved_AssocPat_PreferredContactMethErrors</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the preferredContactMethod associated to a patient does not have any errors by running additional sub rules. 
							child elements.
						</font>
						</td>
					</tr>
					<tr>
						<th>Sub Rules Result:</th>
						<td style="width:80%">
							<xsl:if test="self::node()[hl7:value]">
								<table border="1" width="800">
									<tr>
										<td style="width:80%">
											<font color="#0000CC">
												<b>CheckRemoved_ValueElement</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the Preferred Contact Method child element 'value' does not exist.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The 'value' element should not be present</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
									<xsl:if test="self::node()[name()='preferredContactMethod'][hl7:pertinentInformation/hl7:pertinentPreferredContactTimes]">
										<tr>
											<td>
												<font color="#0000CC">
													<b>CheckRemoved_PrefConTimesElement</b>
												</font>
											</td>
											<tr>
												<td style="width:80%">
													<font color="#000000">This checks that the Preferred Contact Method does no have the associated Preferred Contact Times.</font>
												</td>
											</tr>
											<td>
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: The preferredContactTimes element should not be present</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
									</xsl:if>
								</table>
							</xsl:if>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckRemoved_AssocPat_PrefWritComm_Value">
		<xsl:choose>
			<xsl:when test="self::node()[name()='preferredWrittenCommunicationFormat' and ancestor::hl7:patientRole][hl7:value]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemoved_AssocPat_PrefWritComm_Value</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Preferred Written Communication Format element with updateMode = 'removed' does not have a child element 'value'. 
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td style="width:40%">
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The preferredWrittenCommunicationFormat child element Value must not be present</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckRemoved_ConsentValue">
		<xsl:if test="self::node()[name()='consent'][hl7:value]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_ConsentValue</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Consent element with updateMode = 'removed' does not have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Consent sub element 'value' must not be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_HealthspaceRegValue">
		<xsl:if test="self::node()[name()='healthspaceRegistration'][hl7:value]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_HealthspaceRegValue</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Healthspace Registration element with updateMode = 'removed' does not have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Healthspace Registration sub element 'value' must not be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_MultBirthOrderNo">
		<xsl:if test="self::node()[name()='multipleBirthOrderNumber'][@value]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_MultBirthOrderNoValue</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Multiple Birth Order Number value does not exist when the updateMode = 'removed'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Multiple Birth Order Number value attribute must not exist.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_NameErrors">
		<xsl:if test="self::node()[name()='name'][not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]/*">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_NameValueElement</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that a name element with updateMode = 'removed'  does not have any child element
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: Failure error: A name element must not have any sub elements</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_ForNameSubElements">
		<xsl:if test="self::node()[name()='name'][count(child::*)>0 and not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]/*">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_ForNameSubElements</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that a name element with updateMode = 'removed'  does not have any 
							child elements.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: A name element must not have any sub elements</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_NhaisValue">
		<xsl:if test="self::node()[name()='nhaisRegistration'][hl7:value]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_NhaisValue</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the nhaisRegistration element with updateMode = 'removed' does not have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The NhaisRegistration sub element 'value' must not be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_PersonBirthTimeLength_8Or12_Exist">
		<xsl:if test="self::node()[name()='birthTime' or name()='COCT_MT000210UK01.PartBirthTime']">
			<xsl:if test="self::node()[not(string-length(@value)=8) and not(string-length(@value)=12) or not(string-length(hl7:partPerson/hl7:birthTime/@value)=8) and not(string-length(hl7:partPerson/hl7:birthTime/@value)=12) ]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemoved_PersonBirthTimeLength_Not8Or12</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the birthTime element with updateMode = 'removed' has a string length of
							8 or 12.
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The birthTime must be 8 or 12 digits in length</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_RelPersSubElements_ExceptPDSUniqID">
		<xsl:for-each select="self::node()[name()='scopedRelatedPersonRole'][count(child::*)>1][not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_RelPersSubElements_ExceptPDSUniqID</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the scopedRelatedPersonRole with updateMode = 'removed' does not have any child element except id.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The scopedRelatedPersonRole with updateMode = 'removed'must only have a id child element.</xsl:text>
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
	<xsl:template name="CheckRemoved_RelPersId">
		<xsl:for-each select="self::node()[name()='scopedRelatedPersonRole'][hl7:id/@root='2.16.840.1.113883.2.1.4.1' or hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.3']">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_RelPersId</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the scopedRelatedPersonRole element with updateMode = 'removed' does not have an id with the root='2.16.840.1.113883.2.1.4.1' or '2.16.840.1.113883.2.1.3.2.4.3'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The scopedRelatedPersonRole element with updateMode = 'removed' should not have an id with root ='2.16.840.1.113883.2.1.4.1' or '2.16.840.1.113883.2.1.4.3'.</xsl:text>
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
	<xsl:template name="CheckRemoved_SharedSecretValue">
		<xsl:if test="self::node()[name()='sharedSecret'][hl7:value]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemoved_SharedSecretValue</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the SharedSecret element with updateMode = 'removed' does not have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The SharedSecret Registration sub element 'value' must not be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemoved_TelAttr_Errors">
		<!-- Sub Rule: (1) CheckRemoved_TelAttrValue. (2) CheckRemoved_TelAttrUseablePeriod-->
		<xsl:choose>
			<xsl:when test="self::node()[name()='telecom'][@value or hl7:useablePeriod]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemoved_TelAttr_Errors</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that a telecom element with updateMode = 'removed' by running sub rules which check specific values.
						</font>
						</td>
					</tr>
					<tr>
						<th>Sub Rules Result:</th>
						<td style="width:80%">
							<xsl:if test="self::node()[@value] ">
								<table border="1" width="800">
									<tr>
										<td style="width:80%">
											<font color="#0000CC">
												<b>CheckRemoved_TelAttrValue</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the telecom element does not have a attribute 'value'.</font>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: A telecom element must not have an attribute 'value'</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
									</tr>
									<xsl:if test="self::node()[hl7:useablePeriod]">
										<tr>
											<td>
												<font color="#0000CC">
													<b>CheckRemoved_TelAttrUseablePeriod</b>
												</font>
											</td>
											<tr>
												<td style="width:80%">
													<font color="#000000">This checks that the telecom element does not have a attribute useablePeriod.</font>
												</td>
											</tr>
											<td>
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: A telecom element must not have an useablePeriod child element</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
									</xsl:if>
								</table>
							</xsl:if>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_Addr_FirstOrSecOrFourthIsNull">
		<xsl:if test="self::node()[name()='addr'][string-length(hl7:streetAddressLine[1]/text())=0 and string-length(hl7:streetAddressLine[2]/text())=0 or string-length(hl7:streetAddressLine[4]/text())=0]/hl7:streetAddressLine">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_Addr_FirstOrSecOrFourthIsNull</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the addr first and second and fourth child element contains a value
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The First or Second and Fourth address sub element must be populated.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_BirthTimeCompleteLength8Or12">
		<xsl:if test="self::node()[parent::hl7:patientPerson][name()='birthTime' or name()='COCT_MT000210UK01.PartBirthTime'][not(string-length(@value)=8) and not(string-length(@value)=12) or not(string-length(hl7:partPerson/hl7:birthTime/@value)=8) or not(string-length(hl7:partPerson/hl7:birthTime/@value)=12)]/*">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_BirthTimeCompleteLength8Or12</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks where birthTime is to be added or altered, the birthTime must be the full birth date (YYYYMMDD) or (YYYYMMDDHHMM)
						</font>
						<xsl:text>&lt;br/></xsl:text>
						<b>Requirement Reference:</b>
						<ul>
							<li>REF TO NPFIT-FNT-TO-DPM-0612.02: UPDSEM-3</li>
							<li>FROM MIM 3.1.09 tabular view</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The birthTime must be the full birth date (YYYYMMDD) or  with time (YYYYMMDDHHMM)</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_Birthplace_Addr_InvalidCountryCode">
		<xsl:if test="self::node()[name()='addr' and ancestor::hl7:birthplace or ancestor::hl7:COCT_MT000208UK01.PartPersonBirthPlace][not(hl7:country) and not(hl7:city) and not(hl7:county)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_Birthplace_Addr_InvalidCountryCode</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the message contains at least one of country,county or city
						<ul>
								<li>When one of the above components shall be present where place of birth is being added or altered.</li>
							</ul>
						</font>
						<xsl:text>&lt;br/></xsl:text>
						<b>Requirement Reference:</b>
						<ul>
							<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
							<li>MIM 6.2.02, PDS Version 4.3</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: One of the following elements city, county and country must be present.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_AssocPat_LanguageComm_Errors">
		<!-- Sub Rules: (1) CheckAddedAltered_LanguageCode_Exist, (2) CheckAddedAltered_proficiencyLevelCode_Exist, (3) CheckAddedAltered_preferenceInd_Exist-->
		<xsl:if test="self::node()[name()='languageCommunication'][ancestor::patientPerson][not(hl7:languageCode) or not(hl7:proficiencyLevelCode) or not(hl7:preferenceInd)]">
			<table width="800" border="1">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_AssocPat_LanguageComm_Errors</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Language Communication element if it is associated to a Patient with updateMode = 'added' or 'altered' by running sub rules which check specific values. 
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Language Communication element is not correctly structured it must contain the sub elements languageCode,proficiencyLevelCode,preferenceInd</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_AssocPat_PreferredContactMethValue_Exist">
		<xsl:if test="self::node()[name()='preferredContactMethod'][ancestor::hl7:patientRole][not(hl7:value)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_AssocPat_PreferredContactMethErrors</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the preferredContactMethod associated to a patient has a 'value' element present. 
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The 'value' element must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_ConsentValue_Exist">
		<xsl:if test="self::node()[name()='consent'][not(hl7:value)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_ConsentValue_Exist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Consent element with updateMode = 'added' or 'altered' must have a 
							child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Consent sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAD_HomeAddress_AddedOrAltered_NoBusinessEffectiveDateHigh">
		<xsl:if test="self::node()[name()='patientPerson' or 'scopedRelatedPersonRole' or 'patientRole'][name()='addr'][@use='H']/*[name()='useablePeriod'][hl7:high]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAD_HomeAddress_AddedOrAltered_NoBusinessEffectiveDateHigh</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the home address with a use of H with updateMode = added or altered must not have the business effective to date useablePeriod.high present.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The home address element useable period.high  must not be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_HealthspaceRegValue_Exist">
		<xsl:if test="self::node()[name()='healthspaceRegistration'][not(hl7:value)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_HealthspaceRegValue_Exist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the healthspaceRegistration element with updateMode = 'added' or 'altered' must have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The healthspaceRegistration sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_Name_Family_Exist">
		<xsl:if test="self::node()[name()='name'][not(hl7:family) or string-length(hl7:family)=0]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_Name_Family_Exist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the Family Name element with updateMode = 'added' or 'altered' exists and if it contains a value.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>4
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: Family Name element with updateMode = 'added' or 'altered' must be present with a value.</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_Name_Error">
		<!-- Sub Rules:  (1)CheckAddedAltered_Name_GivenExceed35, (2) CheckAddedAltered_Name_2ndGivenExceed100, (3) CheckAddedAltered_Name_PrefixExceed35, (4)CheckAddedAltered_Name_PrefixContainFullstop, (5)CheckAddedAltered_Name_SuffixExceed35,(6)CheckAddedAltered_Name_ContainsMultiSpace,(7)CheckAddedAltered_Name_ContainsEndSpace -->
		<xsl:choose>
			<xsl:when test="self::node()[name()='name'][string-length(hl7:family)=0 or string-length(hl7:family)>35 or string-length(hl7:given[1]) >35 or string-length(hl7:suffix[1])>35 or string-length(hl7:prefix[1])>35 or string-length(hl7:given[2])>100]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>
						CheckAddedAltered_Name_Error</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that a name element with updateMode = 'added' or 'altered' by running sub rules which check specific values.
						</font>
						</td>
					</tr>
					<tr>
						<th>Sub Rules Result:</th>
						<td style="width:80%">
							<table border="1" width="800">
								<xsl:if test="self::node()[string-length(hl7:family)=0]">
									<tr>
										<td style="width:80%">
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_FamilyNull</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element, the family element contains a value</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Family must contain a value</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[string-length(hl7:family)>35]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_FamilyExceed35Char</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element, the family child element does not exceed 35 characters in length.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Family must not exceed 35 characters in length.</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[string-length(hl7:given[1])>35]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_GivenExceed35</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element the first occurance of its child element given string length does not exceed 35.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Given must not exceed 35 character length</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[string-length(hl7:given[2])>100]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_2ndGivenExceed100</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element the second occurance of its child element given string length does not exceed 100.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name second given element must not exceed 100 character length</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[string-length(hl7:prefix[1])>35]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_PrefixExceed35</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element its child element prefix string length does not exceed 35.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Prefix must not exceed 35 character length</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[contains(hl7:prefix[1],'.')]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_PrefixContainFullstop</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element its child element prefix does not contain a fullstop</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Prefix must not contain a full-stop</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[string-length(hl7:suffix[1])>35]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckAddedAltered_Name_SuffixExceed35</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that within the name element its child element suffix its string length does not exceed 35.</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The name element Suffix must not exceed 35 character length</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[count(child::*)>0]">
									<xsl:for-each select="self::node()/child::*">
										<xsl:if test="self::node()[contains(.,'  ')]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_Name_ContainsMultiSpace</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">This checks that all child element of name element do not contain consecutive space characters.</font>
													</td>
												</tr>
												<td>
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The name must not contain consective space characters</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
										<xsl:variable name="NameAfter" select="substring(self::node(),string-length(.))"/>
										<xsl:if test="self::node()[contains($NameAfter,' ')]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_Name_ContainsEndSpace</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">This checks that all child element of name element do not contain space characters at the end of the value.</font>
													</td>
												</tr>
												<td>
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The name must not contain a space characters at the end of the value</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</table>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_NhaisValue_Exist">
		<xsl:if test="self::node()[name()='nhaisRegistration'][not(hl7:value)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_NhaisValue_Exist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the nhaisRegistration element with updateMode = 'added' or 'altered' must have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The NhaisRegistration sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_PatCareProv_NullCodeError">
		<xsl:if test="self::node()[name()='patientCareProvision'][not(hl7:code/@code) or string-length(hl7:code/@code)=0]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_PatCareProv_NullCodeError</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the nhaisRegistration element with updateMode = 'added' or 'altered' must have a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The NhaisRegistration sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Add validation to only check if pat care present
	<xsl:template name="CheckAddedAltered_PatCareProv_NullCodeError">
		<xsl:if test="self::node()[name()='patientCareProvision']/hl7:code[not(@code) or string-length(@code)=0]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_PatCareProv_NullCodeError</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that a Patient Care Provision element with updateMode = 'added' or updateMode = 'altered' with must have a code present and also checks if it is not empty. 
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The NhaisRegistration sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>-->
	<!-- Add validation to only check if pat care present-->
	<xsl:template name="CheckAddedAltered_PatCareProv_PCodeError">
		<xsl:choose>
			<xsl:when test="self::node()[name()='patientCareProvision']/hl7:code[not(@code='P1') and not(@code='P2') and not(@code='P3') and not(hl7:responsibleParty/hl7:healthCareProvider/hl7:id/@root='2.16.840.1.113883.2.1.4.3')]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAddedAltered_PatCareProv_PCodeError</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that a Patient Care Provision element with updateMode = 'added' or updateMode = 'altered' with Healthcare Provider id root attribute containing 2.16.840.1.113883.2.1.4.3 must have a Patient Care Provision code of P1,P2 or P3. 
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The Patient Care Provision code containing P1, P2 or P3 must have the Healthcare Provider id root attribute containing '2.16.840.1.113883.2.1.4.3'.</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Add validation to only check if pat care present
	<xsl:template name="CheckAddedAltered_PatCareProv_1CodeError">
		<xsl:if test="self::node()[name()='patientCareProvision' and hl7:code/@code='1']/hl7:responsibleParty/hl7:healthCareProvider/hl7:id[not(@root='2.16.840.1.113883.2.1.4.3') and not(@root='2.16.840.1.113883.2.1.4.2') ]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_PatCareProv_1CodeError</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that a Patient Care Provision element with updateMode = 'added' or updateMode = 'altered' has a Patient Care Provision code of  '1' with Healthcare Provider id root attribute containing 2.16.840.1.113883.2.1.4.3 or 2.16.840.1.113883.2.1.4.2.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The Healthcare Provider id root attribute must contain 
								 '2.16.840.1.113883.2.1.4.3' or  '2.16.840.1.113883.2.1.4.2' if the Patient Care Provision code contains 1</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	-->
	<!-- Add validation to only check if pat care present-->
	<xsl:template name="CheckAdded_PatCareProv_NullId">
		<xsl:choose>
			<xsl:when test="self::node()[name()='patientCareProvision']/hl7:responsibleParty/hl7:healthCareProvider/hl7:id[not(hl7:id)]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAdded_PatCareProv_NullId</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that a Patient Care Provision element with updateMode = 'added' must have a Healthcare Provider id.
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The Healthcare Provider id must  be present.</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAdded_PDSObjID">
		<xsl:if test="self::node()[not(hl7:code/@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35')][hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1'][not(name()='birthTime' or name()='administrativeGenderCode' or name()='multipleBirthOrderNumber')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAdded_PDSObjID</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that an element with updateMode = 'added' must not have an id
							with the @root = '2.16.840.1.113883.2.1.3.2.4.18.1' and @extension which contains the PDS object identifier.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The element must not contain the PDS object id</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemovedAltered_PatCareProvIDError">
		<!--Sub Rule: (1) CheckRemovedAltered_PatCareProvID_Exist, (2) CheckRemovedAltered_PatCareProvIDRoot_Exist, (3) CheckRemovedAltered_PatCareProvIDNullExt-->
		<xsl:choose>
			<xsl:when test="self::node()[name()='patientCareProvision'][not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1') or not(hl7:id) or string-length(hl7:id/@extension)=0]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckRemovedAltered_PatCareProvIDError</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Patient Care Provision id when the updateMode = 'removed' or 'altered' by running additional sub rules. 
							child elements.
						</font>
						</td>
					</tr>
					<tr>
						<th>Sub Rules Result:</th>
						<td style="width:80%">
							<table border="1" width="800">
								<xsl:if test="self::node()[not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckRemovedAltered_PatCareProvIDRoot_Exist</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the Patient Care Provision id attribute root = '2.16.840.1.113883.2.1.3.2.4.18.1' when the updateMode = 'removed' or 'altered'</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The Patient Care Provision id, root attribute should contain '2.16.840.1.113883.2.1.3.2.4.18.1' when the updateMode = 'removed' or 'altered'</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()/hl7:id[string-length(@extension)=0]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckRemovedAltered_PatCareProvIDNullExt</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the Patient Care Provision id attribute extension is not empty when the updateMode = 'removed' or 'altered'</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The Patient Care Provision id, extension attribute should not be empty when the updateMode = 'removed' or 'altered'</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="self::node()[not(hl7:id)]">
									<tr>
										<td>
											<font color="#0000CC">
												<b>CheckRemovedAltered_PatCareProvIDNullExt</b>
											</font>
										</td>
										<tr>
											<td style="width:80%">
												<font color="#000000">This checks that the Patient Care Provision id is present when the updateMode = 'removed' or 'altered'</font>
											</td>
										</tr>
										<td>
											<xsl:element name="font">
												<xsl:attribute name="color">xFF0000</xsl:attribute>
												<b>
													<xsl:text>Failure error: The Patient Care Provision idmust be present when  the updateMode = 'removed' or 'altered'</xsl:text>
												</b>
												<xsl:text>&lt;br/></xsl:text>
												<xsl:call-template name="plotPath">
													<xsl:with-param name="forNode" select="."/>
												</xsl:call-template>
											</xsl:element>
										</td>
									</tr>
								</xsl:if>
							</table>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckRemovedAltered_PDSObjID">
		<xsl:if test="self::node()[not(local-name()='birthTime') and not(local-name()='administrativeGenderCode') and not(local-name()='languageCommunication') and not(local-name()='multipleBirthOrderNumber') and not(local-name()='preferredWrittenCommunicationFormat') and not(local-name()='deceasedTime') and not(local-name()='deathNotification') and not(local-name()='consent') and not(local-name()='preferredContactMethod') and not(local-name()='healthspaceRegistration') and not(local-name()='sharedSecret') and not(local-name()='addr' and parent::hl7:birthplace) and not(local-name()='COCT_MT000200UK02.RegisteredRolePart') and not(local-name()='COCT_MT000208UK01.PartPersonBirthPlace') and not(local-name()='COCT_MT000208UK01.BirthPlace') and not(local-name()='nHAISRegistrationEvent') and not(local-name()='nHAISRemovalRegistrationEvent') and not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemovedAltered_PDSObjID</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the PDS Unique Object identifier has an OID of 2.16.840.1.113883.2.1.3.2.4.18.1
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The PDS Unique Object identifier must have an OID  value of '2.16.840.1.113883.2.1.3.2.4.18.1'</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemovedAltered_PDSObjIDNullExtension">
		<xsl:if test="self::node()[not(name()='birthTime') and not(name()='COCT_MT000210UK01.PartBirthTime') and not(name()='administrativeGenderCode') and not(name()='multipleBirthOrderNumber') and not(name()='PreferredWrittenCommunicationFormat') and not(name()='PreferredContactMethod')][hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1'][string-length(hl7:id/@extension)=0]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemovedAltered_PDSObjIDNullExtension</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the PDS Unique Object identifier attribute extension is no null.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: Error: The PDS Unique Object identifier attribute extension must not be null</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckRemovedAltered_ForPDSObjIDOID">
		<xsl:if test="self::node()[not(hl7:code/@codeSystem='2.16.840.1.113883.2.1.3.2.4.17.35') and not(hl7:id/@root='2.16.840.1.113883.2.1.3.2.4.18.1') and not(name()='birthTime') and not(name()='COCT_MT000210UK01.PartBirthTime') and not(name()='administrativeGenderCode') and not(name()='multipleBirthOrderNumber') and not(name()='PreferredWrittenCommunicationFormat') and not(name()='PreferredContactMethod')]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckRemovedAltered_ForPDSObjIDOID</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that an element with updateMode = 'removed' or 'altered' has an id
							with the @root = '2.16.840.1.113883.2.1.3.2.4.18.1' and @extension which contains the PDS object identifier.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The element must contain the PDS object id</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_PrefWritComm_Value_Exist">
		<xsl:choose>
			<xsl:when test="self::node()[name()='preferredWrittenCommunicationFormat'][not(hl7:value)]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAddedAltered_PrefWritComm_Value_Exist</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Preferred Written Communication Format element with updateMode = 'added' or 'altered' must have a child element 'value'. 
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td style="width:40%">
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The preferredWrittenCommunicationFormat child element Value must be present</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_RelatedPersRol_Code_Exist">
		<xsl:choose>
			<xsl:when test="self::node()[name()='scopedRelatedPersonRole'][not(hl7:code)]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAdded_RelatedPersRol_Code_Exist</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Related Person Role element with updateMode = 'added' or 'altered' has a child element code.. 
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td style="width:40%">
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The scopedRelatedPersonRole child element Code must be present</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_RelatedPersRol_Errors">
		<xsl:if test="self::node()[name()='scopedRelatedPersonRole'][hl7:addr or hl7:telecom or hl7:subjectOf1/hl7:preferredContactMethod or hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat or hl7:player/hl7:name or hl7:languageCommunication]">
			<xsl:choose>
				<xsl:when test="self::node()[hl7:id/@root ='2.16.840.1.113883.2.1.4.1' or hl7:id/@root ='2.16.840.1.113883.2.1.3.2.4.3']">
					<table width="800" border="1">
						<tr>
							<th>Name: </th>
							<td>
								<font color="#0000CC">
									<b>CheckAddedAltered_RelatedPersRol_Errors</b>
								</font>
							</td>
						</tr>
						<tr>
							<th>Description: </th>
							<td>
								<font color="#000000">
							This checks that the Related Person Role element with updateMode = 'added'  or 'altered' by running sub rules which check specific values. 
						</font>
							</td>
						</tr>
						<tr>
							<th>Sub Rules Result:</th>
							<td>
								<xsl:if test="self::node()[hl7:addr]">
									<table border="1" width="800">
										<tr>
											<td>
												<font color="#0000CC">
													<b>CheckAddedAltered_RelatedPersRolAddr</b>
												</font>
											</td>
											<tr>
												<td style="width:80%">
													<font color="#000000">
														<b>Purpose:</b>This checks that if the Related Person Role nhs number is present that it has no addr child element.
														<xsl:text>&lt;br/></xsl:text>
														<xsl:text>&lt;br/></xsl:text>
														<b>Requirement Reference:</b>
														<ul>
															<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
															<li>MIM 6.2.02, PDS Version 4.3</li>
														</ul>
													</font>
												</td>
											</tr>
											<td style="width:50%">
												<xsl:element name="font">
													<xsl:attribute name="color">xFF0000</xsl:attribute>
													<b>
														<xsl:text>Failure error: The Related Person Role child element Addr should not be present</xsl:text>
													</b>
													<xsl:text>&lt;br/></xsl:text>
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:element>
											</td>
										</tr>
										<xsl:if test="self::node()[hl7:telecom]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_RelatedPersRolTel</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">
															<b>Purpose:</b>This checks that if the Related Person Role nhs number is present it has no tel child element.	<xsl:text>&lt;br/></xsl:text>
															<xsl:text>&lt;br/></xsl:text>
															<b>Requirement Reference:</b>
															<ul>
																<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
																<li>MIM 6.2.02, PDS Version 4.3</li>
															</ul>
														</font>
													</td>
												</tr>
												<td style="width:50%">
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The Related Person Role child element Telecom should not be present</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="self::node()[hl7:subjectOf1/hl7:preferredContactMethod]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_RelatedPersRolPrefConMeth</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">
															<b>Purpose:</b>This checks that if the Related Person Role nhs number is present element it has no Preferred Contact Method child element.
																<xsl:text>&lt;br/></xsl:text>
															<xsl:text>&lt;br/></xsl:text>
															<b>Requirement Reference:</b>
															<ul>
																<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
																<li>MIM 6.2.02, PDS Version 4.3</li>
															</ul>
														</font>
													</td>
												</tr>
												<td style="width:50%">
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The Related Person Role child element Preferred Contact Method should not be present</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="self::node()[hl7:subjectOf2/hl7:preferredWrittenCommunicationFormat]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_RelatedPersRolPrefWritComForm</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">
															<b>Purpose:</b>This checks that the Related Person Role nhs number is present it has no Written Communication Format child element.
																<xsl:text>&lt;br/></xsl:text>
															<xsl:text>&lt;br/></xsl:text>
															<b>Requirement Reference:</b>
															<ul>
																<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
																<li>MIM 6.2.02, PDS Version 4.3</li>
															</ul>
														</font>
													</td>
												</tr>
												<td style="width:50%">
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The Related Person Role child element Preferred Written Communication Format should not be present</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="self::node()[hl7:player/hl7:name]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_RelatedPersRolName</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">
															<b>Purpose:</b>This checks that tif the Related Person Role nhs number is present it has no name child element.
																<xsl:text>&lt;br/></xsl:text>
															<xsl:text>&lt;br/></xsl:text>
															<b>Requirement Reference:</b>
															<ul>
																<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
																<li>MIM 6.2.02, PDS Version 4.3</li>
															</ul>
														</font>
													</td>
												</tr>
												<td style="width:50%">
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The Related Person Role child element Name should not be present</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="self::node()[hl7:languageCommunication]">
											<tr>
												<td>
													<font color="#0000CC">
														<b>CheckAddedAltered_RelatedPersRolLangComm</b>
													</font>
												</td>
												<tr>
													<td style="width:80%">
														<font color="#000000">
															<b>Purpose:</b>This checks that if the Related Person Role nhs number is present it has no Language Communication child element.
																<xsl:text>&lt;br/></xsl:text>
															<xsl:text>&lt;br/></xsl:text>
															<b>Requirement Reference:</b>
															<ul>
																<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-4.1</li>
																<li>MIM 6.2.02, PDS Version 4.3</li>
															</ul>
														</font>
													</td>
												</tr>
												<td style="width:50%">
													<xsl:element name="font">
														<xsl:attribute name="color">xFF0000</xsl:attribute>
														<b>
															<xsl:text>Failure error: The Related Person Role child element Language Communication should not be present</xsl:text>
														</b>
														<xsl:text>&lt;br/></xsl:text>
														<xsl:call-template name="plotPath">
															<xsl:with-param name="forNode" select="."/>
														</xsl:call-template>
													</xsl:element>
												</td>
											</tr>
										</xsl:if>
									</table>
								</xsl:if>
							</td>
						</tr>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="self::node()[not(hl7:addr/@use='H' or hl7:telecom)]">
						<table border="1" width="800">
							<tr>
								<th>Name: </th>
								<td>
									<font color="#0000CC">
										<b>CheckAddedAltered_RelatedPersAddressOrTelecomPresent</b>
									</font>
								</td>
							</tr>
							<tr>
								<th>Description: </th>
								<td>
									<font color="#000000">
							This checks that if the Related Person Role element nhs number is not present the addr with use ='H' or telecom must be present.
						<b>Requirement Reference:</b>
										<ul>
											<li>2008-A PDS Compliance Baseline: Updates, Version 2.0 NPFIT-FNT-TO-DPM-0649.03 UPDRPS-8.,UPDRPS-8.1 </li>
											<li>MIM 6.2.02, PDS Version 4.3</li>
										</ul>
									</font>
								</td>
							</tr>
							<tr>
								<th>Result:</th>
								<td>
									<xsl:element name="font">
										<xsl:attribute name="color">xFF0000</xsl:attribute>
										<b>
											<xsl:text>Failure error: The Related Person Role address with use ='H' or telecom must be present.</xsl:text>
										</b>
										<xsl:text>&lt;br/></xsl:text>
										<xsl:call-template name="plotPath">
											<xsl:with-param name="forNode" select="."/>
										</xsl:call-template>
									</xsl:element>
								</td>
							</tr>
						</table>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAddedAltered_SharedSecretValue_Exist">
		<xsl:if test="self::node()[name()='sharedSecret'][not(hl7:value)]">
			<table border="1" width="800">
				<tr>
					<th>Name: </th>
					<td>
						<font color="#0000CC">
							<b>CheckAddedAltered_SharedSecretValue_Exist</b>
						</font>
					</td>
				</tr>
				<tr>
					<th>Description: </th>
					<td>
						<font color="#000000">
							This checks that the sharedSecret element with updateMode = 'added' or 'altered' has a child element 'value'.
						</font>
					</td>
				</tr>
				<tr>
					<th>Result:</th>
					<td>
						<xsl:element name="font">
							<xsl:attribute name="color">xFF0000</xsl:attribute>
							<b>
								<xsl:text>Failure error: The sharedSecret sub element 'value' must be present</xsl:text>
							</b>
							<xsl:text>&lt;br/></xsl:text>
							<xsl:call-template name="plotPath">
								<xsl:with-param name="forNode" select="."/>
							</xsl:call-template>
						</xsl:element>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CheckAdded_TelecomValueColon_Exist">
		<xsl:choose>
			<xsl:when test="self::node()[name()='telecom'][ancestor::hl7:patientRole][not(contains(@value,':'))]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAdded_TelecomValueColon_Exist</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							his checks that the Telecom element attribute 'value' contains a colon ':'
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The Telecom 'value' must contain a colon</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAdded_TelecomBeforeColonValue_Exist">
		<xsl:choose>
			<xsl:when test="self::node()[name()='telecom'][ancestor::hl7:patientRole][not(substring-before(@value,':')='tel')][not(substring-before(@value,':')='fax')] [not(substring-before(@value,':')='mailto')][not(substring-before(@value,':')='textphone')]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAdded_TelecomBeforeColonValue_Exist</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Telecom element attribute 'value' contains a value before the ':'
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The first part of the Telecom 'value' before the colon must contain
													'tel', 'fax', 'mailto' or 'textphone'</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:value-of select="self::node()[name()='telecom'][ancestor::hl7:patientRole][not(substring-before(@value,':')='tel')][not(substring-before(@value,':')='fax')] [not(substring-before(@value,':')='mailto')][not(substring-before(@value,':')='textphone')]/@value"/>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckAdded_TelecomAfterColonValue_Exist">
		<xsl:choose>
			<xsl:when test="self::node()[name()='telecom'][ancestor::hl7:patientRole][string-length(substring-after(@value,':'))=0]">
				<table border="1" width="800">
					<tr>
						<th>Name: </th>
						<td>
							<font color="#0000CC">
								<b>CheckAdded_TelecomAfterColonValue_Exist</b>
							</font>
						</td>
					</tr>
					<tr>
						<th>Description: </th>
						<td>
							<font color="#000000">
							This checks that the Telecom element attribute 'value' contains a value after the ':'
						</font>
						</td>
					</tr>
					<tr>
						<th>Result:</th>
						<td>
							<xsl:element name="font">
								<xsl:attribute name="color">xFF0000</xsl:attribute>
								<b>
									<xsl:text>Failure error: The second part of the Telecom 'value' after the colon must contain a value.</xsl:text>
								</b>
								<xsl:text>&lt;br/></xsl:text>
								<xsl:call-template name="plotPath">
									<xsl:with-param name="forNode" select="."/>
								</xsl:call-template>
							</xsl:element>
						</td>
					</tr>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
