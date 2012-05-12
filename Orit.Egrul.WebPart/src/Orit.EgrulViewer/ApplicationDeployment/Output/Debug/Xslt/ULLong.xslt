<?xml version='1.0' ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/ДокументСвЮЛ4">
		<div class="doc">
			<style type="text\css">
				.comment{color:gray;}
			</style>	
			<div class="docHeader">
				<h3>
			Из Единого государственного реестра юридических лиц
(предоставляется на основании Решения ФНС России №1044 от 15.12.2006 г.)</h3>
				<strong>Дата формирования: </strong>
				<span class="date">
					<xsl:value-of select="датаВыпField"/>
				</span>г. 
				<br/>
				<div>№ 	ХХХХ/ИВ (не понял откуда это берется)</div>
				<h4>Настоящая справка содержит сведения о юридическом лице:</h4>
				<div class="title">
					<xsl:value-of select="свНаимЮЛField/наимЮЛПолнField"/>
				</div>
				<hr/>
			</div>
			<div class="MainInfo  infoblock">
				<table width="100%">
					<caption>Основные сведения о ЮЛ</caption>
					<tr>
						<td>ОРГН</td>
						<td>
							<xsl:value-of select="оГРНField"/>
						</td>
					</tr>
					<tr>
						<td>ИНН</td>
						<td>
							<xsl:value-of select="иННField"/>
						</td>
					</tr>
					<tr>
						<td>Полное наименование</td>
						<td>
							<xsl:value-of select="свНаимЮЛField/наимЮЛПолнField"/>
						</td>
					</tr>
					<tr>
						<td>Сокращенное наименование</td>
						<td>
							<xsl:value-of select="свНаимЮЛField/наимЮЛСокрField"/>
						</td>
					</tr>
					<tr>
						<td>Фирменное наименование</td>
						<td>
							<xsl:value-of select="свНаимЮЛField/наимЮЛФирмField"/>
						</td>
					</tr>
					<tr>
						<td>ОПФ</td>
						<td>
							<xsl:value-of select="свНаимЮЛField/оПФField/полнНаимОПФField"/>
						</td>
					</tr>
					<tr>
						<td>Сведения о состоянии юр.лица</td>
						<td>
							<xsl:value-of select="свСтатус_РОField/свСтатусField/наимСтатусЮЛField"/>
						</td>
					</tr>
				</table>
			</div>

			<div class="AddresInfo infoblock">
				<table width="100%">
					<caption>Адрес (место нахождения) ЮЛ</caption>
					<tr>
						<td>ОРГН</td>
						<td>
							<xsl:value-of select="оГРНField"/>
						</td>
					</tr>
					<tr>
						<td>Полное наименование</td>
						<td>
							<xsl:value-of select="свНаимЮЛField/наимЮЛПолнField"/>
						</td>
					</tr>
					<xsl:apply-templates select="свАдресField"/>
				</table>
			</div>

			<div class="CaplitalInfo infoblock">
				<xsl:apply-templates select="свУстКапField"/>
			</div>

			<div class="ULStateInfo infoblock">
				<xsl:apply-templates select="свСтатус_РОField"/>
			</div>

			<div class="CreateInfo infoblock">
				<xsl:apply-templates select="свОбрЮЛField"/>
			</div>

			<div class="RemoveInfo infoblock">
				<xsl:apply-templates select="свПрекрЮЛField"/>
			</div>

			<!--<div class="OwnersInfo infoblock">-->
				<xsl:apply-templates select="свУчредитField"/>
			<!--</div>-->

			<div class="RegistryAOInfo infoblock">
				<xsl:value-of select="свДержРеестрАОField"/>
			</div>

			<xsl:apply-templates select="свПреемствField"/>


			<div class="infoblock AuthorityInfo">
				<table width="100%">
					<caption>Сведения о физ.лицах, имеющих право действовать без доверенности</caption>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div>		

			<div class="infoblock ManagementCompanyInfo">
				<table width="100%">
					<caption>Сведения об управляющей компании</caption>
					<tr><td>Не получал от гейта</td></tr>
					<tr><td>Нет шаблона</td></tr>
				</table>				
			</div>

			<div class="infoblock CompanyPartsInfo">
				<table width="100%">
					<caption>Сведения о филиалах юр.лица</caption>
					<tr><td>Не получал от гейта</td></tr>
					<tr><td>Нет шаблона</td></tr>
				</table>				
			</div>

			<div class="infoblock CompanyAgencyInfo">
				<table width="100%">
					<caption>Сведения о представительствах юр.лица</caption>
					<tr><td>Не получал от гейта</td></tr>
					<tr><td>Нет шаблона</td></tr>
				</table>				
			</div>

			<div class="infoblock EconomicActivitiesInfo">
				<xsl:apply-templates select="свОКВЭДField"/>
			</div>

			<div class="infoblock TaxDeptInfo">
				<xsl:apply-templates select="свУчетНОField"/>
			</div>

			<div class="infoblock RegPFInfo">
				<table width="100%">
					<caption>Сведения о регистрации в ПФ России</caption>
					<tr><td>Нет шаблона</td></tr>
				</table>				
			</div>
			<div class="infoblock ReFSSInfo">
				<table width="100%">
					<caption>Сведения о регистрации в ФСС России</caption>
					<tr><td>Нет шаблона</td></tr>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div>

			<div class="infoblock RegFOMSInfo">
				<table width="100%">
					<caption>Сведения о регистрации в ФОМС России</caption>
					<tr><td>Нет шаблона</td></tr>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div>

			<div class="infoblock LicenseInfo">
				<table width="100%">
					<caption>Сведения о лицензиях</caption>
					<tr><td>Нет шаблона</td></tr>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div>

			<div class="infoblock EgrulRecordsInfo">
				<table width="100%">
					<caption>Сведения о записях в ЕГРЮЛ</caption>					
					<xsl:apply-templates select="./свЗапДействField"/>
					<tr><td colspan="2">Не получал от гейта недействительныйх записей</td></tr>
				</table>				
			</div>


		</div>
	</xsl:template>

	<!-- Описание шаблонов разделов -->

	<xsl:template match="свАдресField">
		<tr>
			<td>Наименование органа (лица)</td>
			<td></td>
		</tr>
		<tr>
			<td>Адрес (место нахождения) юр.лица</td>
			<td>
				<xsl:value-of select="адресРФField/индексField" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="адресРФField/городField" /> 
				<xsl:text> </xsl:text>

				<xsl:value-of select="адресРФField/улицаField/наимУлицаField"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="адресРФField/улицаField/типУлицаField"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="адресРФField/домField"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="адресРФField/корпусField"/>
				<xsl:text> </xsl:text>

				<xsl:if test="not(адресРФField/квартField/@i:nil)">
					<xsl:value-of select="адресРФField/квартField"/>
				</xsl:if>

			</td>
		</tr>

		<tr>
			<td>Код города</td>
			<td><xsl:value-of select="адресРФField/кодРегионField"/></td>
		</tr>

		<tr>
			<td>Телефон</td>
			<td></td>
		</tr>
		<tr>
			<td>Факс</td>
			<td></td>
		</tr>

		<tr>
			<td>Дата внесения записи в ЕГРЮЛ</td>
			<td><xsl:value-of select="датаНачДействField"/></td>
		</tr>

		<tr>
			<td>ГРН</td>
			<td><xsl:value-of select="гРНField"/></td>
		</tr>

		<tr>
			<td>Наименование регоргана, в котором внесена запись</td>
			<td><xsl:value-of select="../свСтатус_РОField/свРегОргField/наимНОField"/></td>
		</tr>
	</xsl:template>

	<xsl:template match="свУстКапField">
	
		<table width="100%">
			<caption>Сведения об уставном капитале</caption>
			<xsl:if test="not(@i:nil)">
			<tr>
				<td>Размер (в рублях)</td>
				<td><xsl:value-of select="СумКапField"/></td>
			</tr>
			<tr>
				<td>Вид капитала</td>
				<td><xsl:value-of select="КодВидКапField"/></td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td><xsl:value-of select="ДатаНачДействField"/></td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td><xsl:value-of select="ГРНField"/></td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td></td>
			</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template match="свСтатус_РОField">
		<table width="100%">
			<caption>Сведения о состоянии юридического лица</caption>
			<tr>
				<td>Сведения о состоянии ЮЛ</td>
				<td><xsl:value-of select="свСтатусField/наимСтатусЮЛField"/></td>
			</tr>
			<tr>
				<td>Код регоргана</td>
				<td><xsl:value-of select="свРегОргField/кодНОField"/></td>
			</tr>
			<tr>
				<td>Наименование регоргана</td>
				<td><xsl:value-of select="свРегОргField/наимНОField"/></td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td><xsl:value-of select="датаНачДействField"/></td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td><xsl:value-of select="гРНField"/></td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td><xsl:value-of select="свРегОргField/наимНОField"/></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="свОбрЮЛField">
		<table width="100%">
			<caption>Сведения об образовании юридического лица</caption>
			<tr>
				<td>Cпособ образования</td>
				<td><xsl:value-of select="наимСпОбрЮЛField"/></td>
			</tr>

			<tr>
				<td>Дата регистрации</td>
				<td><xsl:value-of select="датаОбрЮЛField"/></td>
			</tr>
			<tr>
				<td>ОГРН</td>
				<td><xsl:value-of select="гРНField"/></td>
			</tr>
			<tr>
				<td>Регномер до 01.07.2002</td>
				<td><xsl:value-of select="регНомField"/></td>
			</tr>
			<!-- <tr>
				<td>Код регоргана</td>
				<td></td>
			</tr> -->
			<tr>
				<td>Наименование регоргана</td>
				<td><xsl:value-of select="наимРОField"/></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="свПрекрЮЛField">
		<table width="100%">
			<caption>Сведения о прекращении деятельности</caption>
			<xsl:if test="not(@i:nil)">
			<tr>
				<td>Дата внесения сведений в ЕГРЮЛ</td>
				<td><xsl:value-of select="датаНачДействField"/></td>
			</tr>
			<tr>
				<td>Государственный регистрационный номер записи, на основании которых сведения внесены в ЕГРЮЛ</td>
				<td><xsl:value-of select="гРНField"/></td>
			</tr>
			<tr>
				<td>Дата прекращения юридического лица</td>
				<td><xsl:value-of select="датаПрекрЮЛField"/></td>
			</tr>
			<tr>
				<td>Способ прекращения юридического лица</td>
				<td><xsl:value-of select="спПрекрЮЛField/наимСпПрекрЮЛField"/></td>
			</tr>
			<tr>
				<td>Сведения об органе, зарегистрировавшем  прекращение юридического лица</td>
				<td><xsl:value-of select="свРегОргField/наимНОField"/></td>
			</tr>
			</xsl:if>
		</table>
	</xsl:template>
	
	<xsl:template match="учрЮЛРосField">
		<table width="100%">
			<caption>Сведения об учредителях - Российских ЮЛ</caption>
			<xsl:if test="not(@i:nil)">
			<tr>
				<td>Дата внесения сведений в ЕГРЮЛ</td>
				<td><xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/датаНачДействField"/></td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td><xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/гРНField"/></td>
			</tr>
			<tr>
				<td>ОГРН</td>
				<td><xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/оГРНField"/></td>
			</tr>
			<tr>
				<td>ИНН юридического лица</td>
				<td><xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/иННЮЛField"/></td>
			</tr>
			<tr>
				<td>Полное наименование юридического лица</td>
				<td><xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/наимЮЛПолнField"/></td>
			</tr>
			<tr>
				<td>Доля в уставном капитале</td>
				<td>
					<xsl:if test="not(ДокументСвЮЛСвУчредитУчрЮЛРос/оГРНField/@i:nil)">
						<xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/доляУстКапField/номинСтоимField"/>
						<xsl:value-of select="ДокументСвЮЛСвУчредитУчрЮЛРос/доляУстКапField/процентField"/>%
					</xsl:if>
				</td>
			</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template match="свУчредитField">
		<xsl:apply-templates select="учрЮЛРосField"/>		
		<table width="100%">
			<caption>Сведения об учредителях - иностранных ЮЛ</caption>
			<tr><td>Нет шаблона</td></tr>
		</table>
		<xsl:apply-templates select="учрФЛField"/>
	</xsl:template>

	<xsl:template match="свДержРеестрАОField">
		<table width="100%">
			<caption>Сведения о держателе реестра акционеров АО</caption>
		</table>	
	</xsl:template>

	<xsl:template match="свПреемствField">
			<div class="infoblock ULAncestors">
				<table width="100%">
					<caption>Сведения о юр.лицах - предшественниках при реорганизации</caption>
					<tr><td>Нет шаблона</td></tr>
				</table>
			</div>
			<div class="infoblock ULDescendants">
				<table width="100%">
					<caption>Сведения о юр.лицах - преемниках при реорганизации</caption>
					<tr><td>Нет шаблона</td></tr>
				</table>
			</div>		
	</xsl:template>

	<xsl:template match="свОКВЭДField">
		<table width="100%">
			<caption>Сведения о видах экономической деятельности</caption>
			<tr><td>Не получал от гейта</td></tr>
		</table>
	</xsl:template>

	<xsl:template match="свУчетНОField">
		<table width="100%">
			<caption>Сведения о постановке на учет в налоговом органе</caption>
			<tr>
				<td>ИНН</td>
				<td><xsl:value-of select="иННField"/></td>
			</tr>
			<tr>
				<td>КПП</td>
				<td><xsl:value-of select="кППField"/></td>
			</tr>
			<tr>
				<td>Дата постановки на учет в налоговом органе</td>
				<td><xsl:value-of select="датаПостУчField"/></td>
			</tr>
			<tr>
				<td>Дата снятия с учета</td>
				<td><xsl:value-of select="датаСнУчField"/></td>
			</tr>
			<tr>
				<td>Код налогового органа</td>
				<td><xsl:value-of select="свНОField/кодНОField"/></td>
			</tr>
			<tr>
				<td>Наименование налогового органа</td>
				<td><xsl:value-of select="свНОField/наимНОField"/></td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td><xsl:value-of select="датаНачДействField"/></td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td><xsl:value-of select="гРНField"/></td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td><xsl:value-of select="свНОField/наимНОField"/></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="свЗапДействField">
		<xsl:apply-templates select="ДокументСвЮЛСвЗапДейств"/>
	</xsl:template>

	<xsl:template match="ДокументСвЮЛСвЗапДейств">
		<table style="padding-bottom:1em" width="100%">			
			<tr>
				<td>ОГРН</td>
				<td><xsl:value-of select="../../оГРНField"/></td>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td><xsl:value-of select="../../свНаимЮЛField/наимЮЛПолнField"/></td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td><xsl:value-of select="гРНField"/></td>
			</tr>
			<tr>
				<td>Дата внесения записи</td>
				<td><xsl:value-of select="датаЗапField"/></td>
			</tr>
			<tr>
				<td>Событие, с которым связано внесение записи</td>
				<td><xsl:value-of select="видЗапField/наимВидЗапField"/></td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td><xsl:value-of select="свРегОргField/наимНОField"/></td>
			</tr>
			<tr>
				<td>Статус</td>
				<td>действующая запись</td>
			</tr>
			<tr>
				<td class="linebreak" colspan="2"> </td>
			</tr>	
		</table>
	</xsl:template>



	<xsl:template match="учрФЛField">
		<table width="100%">
			<caption>Сведения об учредителях - физических лицах</caption>
			<xsl:if test="not(@i:nil)">
				<tr>
					<td>Дата внесения сведений в ЕГРЮЛ</td>
					<td><xsl:value-of select="датаНачДействField"/></td>
				</tr>
			</xsl:if>			
		</table>
	</xsl:template>


<xsl:template match="оГРНField">
	
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="test2.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="test2.xml" srcSchemaRoot="Документ5" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="свАдресField"></template>
			<template match="Документ5"></template>
			<template match="/">
				<block path="div/div[2]/table/xsl:apply-templates" x="278" y="88"/>
			</template>
			<template match="свНаимЮЛField"></template>
			<template name="MainInfo">
				<block path="table/tr/td[1]/xsl:value-of" x="278" y="86"/>
			</template>
			<template match="a:свАдресField">
				<block path="tr[1]/td[1]/xsl:value-of" x="278" y="88"/>
				<block path="tr[1]/td[1]/xsl:value-of[1]" x="318" y="88"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext>
			<template match="Документ5" mode="" srcContextPath="/Документ5" srcContextFile="file:///c:/Users/KHOLINOV/Desktop/sql/test2.xml" targetContextPath="/doc" targetContextFile=""/>
		</TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->