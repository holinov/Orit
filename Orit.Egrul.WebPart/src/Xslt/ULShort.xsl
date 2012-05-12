<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="cвЮЛField">
		<div class="docHeader">
			<h2>Из Единого государственного реестра юридических лиц
				(предоставляется на основании Решения ФНС России №1044 от 15.12.2006 г.)</h2>
			<div>
				<strong>Дата формирования:</strong>
				<span class="date">
					<xsl:value-of select="../@датаВыпField"/>
				</span>
			</div>
			<h4>Настоящая справка содержит краткие сведения о юридическом лице:</h4>
			<h5>
				<xsl:value-of select="@наимЮЛПолнField"/>
			</h5>
		</div>
		<div class="MainInfo  infoblock">
			<table width="100%">
				<caption>
					<h5>Основные сведения о ЮЛ</h5>
				</caption>
				<tr>
					<td>ОРГН</td>
					<td>
						<xsl:value-of select="@оГРНField"/>
					</td>
				</tr>
				<tr>
					<td>ИНН</td>
					<td>
						<xsl:value-of select="@иННField"/>
					</td>
				</tr>
				<tr>
					<td>Полное наименование</td>
					<td>
						<xsl:value-of select="@наимЮЛПолнField"/>
					</td>
				</tr>
				<tr>
					<td>Сокращенное наименование</td>
					<td>
						<xsl:value-of select="@наимЮЛСокрField"/>
					</td>
				</tr>
				<tr>
					<td>Сведения о размере уставного капитала</td>
					<td>
						<xsl:value-of select="@сумКапField"/>
					</td>
				</tr>
				<tr>
					<td>Сведения о местоположении</td>
					<td>
						<xsl:apply-templates select="адресРФField"/>
					</td>
				</tr>
				<xsl:if test="свСтатусField/наимСтатусЮЛField != ''">
					<tr>
						<td>Сведения о состоянии юр.лица</td>
						<td>
							<xsl:value-of select="свСтатусField/наимСтатусЮЛField"/>
						</td>
					</tr>
				</xsl:if>
			</table>
		</div>

		<div class="infoblock">
			<xsl:apply-templates select="свРегОргField"/>
		</div>

		<div class="infoblock">
			<xsl:apply-templates select="сведУчетНОField"/>
		</div>

		<div class="infoblock">
			<xsl:apply-templates select="сведУправлДеятField"/>
		</div>
	</xsl:template>

	<xsl:template match="адресРФField">

		<xsl:value-of select="индексField"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="районField/@типРайонField"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="районField/@наимРайонField"/>
		<xsl:text>, </xsl:text>

		<xsl:value-of select="городField/@типГородField"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="городField/@наимГородField"/>
		<xsl:text> </xsl:text>

		<xsl:value-of select="улицаField/@наимУлицаField"/>
		<xsl:text> </xsl:text>

		<xsl:value-of select="улицаField/@типУлицаField"/>
		<xsl:text> </xsl:text>

		<xsl:value-of select="@домField"/>
		<xsl:text> </xsl:text>

		<xsl:value-of select="@корпусField"/>
		<xsl:text> </xsl:text>

		<xsl:if test="not(адресРФField/квартField/@i:nil)">
			<xsl:value-of select="адресРФField/квартField"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="свРегОргField">
		<table>
			<caption>
				<h5>Сведения о регистрирующем (налоговом) органе, по месту нахождения юридического лица</h5>
			</caption>
			<tr>
				<td>Код органа по справочнику СОНО</td>
				<td>
					<xsl:value-of select="@кодНО"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регистрирующего (налогового) органа</td>
				<td>
					<xsl:value-of select="@наимНО"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="сведУчетНОField">
		<table width="100%">
			<caption>
				<h5>Сведения об учете в налоговом органе</h5>
			</caption>
			<xsl:if test="@датаПостУч != ''">
				<tr>
					<td>Дата постановки на учет в налоговом органе</td>
					<td>
						<xsl:value-of select="@датаПостУч"/>
					</td>
				</tr>
			</xsl:if>


			<xsl:if test="@датаСнУч != ''">
				<tr>
					<td>Дата снятия с учета в налоговом органе</td>
					<td>
						<xsl:value-of select="@датаСнУч"/>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td>Код органа по справочнику СОНО</td>
				<td>
					<xsl:value-of select="свНОField/@кодНОField"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регистрирующего (налогового) органа</td>
				<td>
					<xsl:value-of select="свНОField/@наимНОField"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="сведУправлДеятField">

			<xsl:apply-templates select="сведДолжнФЛField"/>

			<xsl:apply-templates select="упрКомпРосField"/>

			<xsl:apply-templates select="упрКомпИнField"/>

	</xsl:template>


	<xsl:template match="сведДолжнФЛField">
		<table width="100%">
			<caption>
				<h5>Сведения о физическом лице, имеющем право без доверенности действовать от имени юридического лица</h5>
			</caption>
			<tr>
				<td>Должность</td>
				<td>
					<xsl:value-of select="@наимДолжнField"/>
				</td>
			</tr>
			<xsl:apply-templates select="фИОField"/>
			<tr>
				<td>ИНН</td>
				<td>
					<xsl:value-of select="@иННФЛField"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="фИОField">
		<tr>
			<td>Фамилия</td>
			<td>
				<xsl:value-of select="@фамилияField"/>
			</td>
		</tr>
		<tr>
			<td>Имя</td>
			<td>
				<xsl:value-of select="@имяField"/>
			</td>
		</tr>
		<tr>
			<td>Отчество</td>
			<td>
				<xsl:value-of select="@отчествоField"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="упрКомпРосField">
		<table width="100%">
			<caption>
				<h5>Сведения об Российской управляющей компании</h5>
			</caption>
			<tr>
				<td>Основной государственный регистрационный номер юридического лица</td>
				<td>
					<xsl:value-of select="@оГРНField"/>
				</td>
			</tr>
			<tr>
				<td>ИНН юридического лица</td>
				<td>
					<xsl:value-of select="@иННField"/>
				</td>
			</tr>
			<tr>
				<td>Полное наименование юридического лица</td>
				<td>
					<xsl:value-of select="@наимЮЛПолнFeild"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="упрКомпИнField">
		<table width="100%">
			<caption>
				<h5>Сведения об иностранной управляющей компании</h5>
			</caption>
			<tr>
				<td>ИНН юридического лица</td>
				<td>
					<xsl:value-of select="@оГРНField"/>
				</td>
			</tr>
			<tr>
				<td>Полное наименование юридического лица</td>
				<td>
					<xsl:value-of select="@наимЮЛПолнFeild"/>
				</td>
			</tr>
			<tr>
				<td>Код страны регистрации (инкорпорации) по справочнику ОКСМ</td>
				<td>
					<xsl:value-of select="@оКСМField"/>
				</td>
			</tr>
			<tr>
				<td>Наименование страны регистрации (инкорпорации) по справочнику ОКСМ</td>
				<td>
					<xsl:value-of select="@наимСтрField"/>
				</td>
			</tr>
			<tr>
				<td>Место нахождения  иностранного юридического лица в стране регистрации (инкорпорации)</td>
				<td>
					<xsl:value-of select="@АдрИнField"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="ULShort.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->