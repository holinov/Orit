<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:i="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:a="http://ws.unisoft/EGRNXX/ResponseVIPUL">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/Документ5">
		<div class="doc">
			<div class="docHeader">
				<h2>Из Единого государственного реестра юридических лиц
				(предоставляется на основании Решения ФНС России №1044 от 15.12.2006 г.)</h2>
				<div>
					<strong>Дата формирования:</strong>
					<span class="date">
						<xsl:value-of select="a:СвЮЛ/@ДатаВып"/>
					</span>
				</div>
				<h4>Настоящая справка содержит сведения о юридическом лице:</h4>
				<h5>
					<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/@НаимЮЛПолн"/>
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
							<xsl:value-of select="a:СвЮЛ/@ОГРН"/>
						</td>
					</tr>
					<tr>
						<td>ИНН</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/@ИНН"/>
						</td>
					</tr>
					<tr>
						<td>Полное наименование</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/@НаимЮЛПолн"/>
						</td>
					</tr>
					<tr>
						<td>Сокращенное наименование</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/@НаимЮЛСокр"/>
						</td>
					</tr>
					<tr>
						<td>Фирменное наименование</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/@НаимЮЛФирм"/>
						</td>
					</tr>
					<tr>
						<td>ОПФ</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/a:ОПФ/@ПолнНаимОПФ"/>
						</td>
					</tr>
					<tr>
						<td>Сведения о состоянии юр.лица</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвСтатус_РО/a:СвСтатус/@НаимСтатусЮЛ"/>
						</td>
					</tr>
				</table>
			</div>

			<div class="AddresInfo infoblock">
				<table width="100%">
					<caption>
						<h5>Адрес (место нахождения) ЮЛ</h5>
					</caption>
					<tr>
						<td>ОРГН</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/@ОГРН"/>
						</td>
					</tr>
					<tr>
						<td>Полное наименование</td>
						<td>
							<xsl:value-of select="a:СвЮЛ/a:СвНаимЮЛ/@НаимЮЛПолн"/>
						</td>
					</tr>
					<xsl:apply-templates select="a:СвЮЛ/a:СвАдрес"/>
				</table>
			</div>

			<div class="CaplitalInfo infoblock">
				<xsl:apply-templates select="a:СвЮЛ/a:СвУстКап"/>
			</div>

			<div class="ULStateInfo infoblock">
				<xsl:apply-templates select="a:СвЮЛ/a:СвСтатус_РО"/>
			</div>

			<div class="CreateInfo infoblock">
				<xsl:apply-templates select="a:СвЮЛ/a:СвОбрЮЛ"/>
			</div>

			<div class="RemoveInfo infoblock">
				<xsl:apply-templates select="a:СвЮЛ/a:СвПрекрЮЛ"/>
			</div>

			<xsl:apply-templates select="a:СвЮЛ/a:СвУчредит"/>

			<div class="RegistryAOInfo infoblock">
				<xsl:apply-templates select="a:СвЮЛ/a:СвДержРеестрАО"/>
			</div>

			<xsl:apply-templates select="a:СвЮЛ/a:СвПреемств"/>


			<div class="infoblock AuthorityInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвУправлДеят"/>
			</div>

			<div class="infoblock CompanyPartsInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвПодразд"/>
			</div>

			<!--<div class="infoblock CompanyAgencyInfo">
				<table width="100%">
					<caption><h5>Сведения о представительствах юр.лица</h5></caption>
					<tr><td>Не получал от гейта</td></tr>
					<tr><td>Нет шаблона</td></tr>
				</table>				
			</div>-->

			<div class="infoblock EconomicActivitiesInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвОКВЭД"/>
			</div>

			<div class="infoblock TaxDeptInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвУчетНО"/>
			</div>

			<div class="infoblock RegPFInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвРегПФ"/>
			</div>
			<div class="infoblock ReFSSInfo">
				<xsl:apply-templates select="a:СвЮЛ/a:СвРегФСС"/>
			</div>
			<!--
			<div class="infoblock RegFOMSInfo">
				<table width="100%">
					<caption><h5>Сведения о регистрации в ФОМС России</h5></caption>
					<tr><td>Нет шаблона</td></tr>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div> 

			<div class="infoblock LicenseInfo">
				<table width="100%">
					<caption><h5>Сведения о лицензиях</h5></caption>
					<tr><td>Нет шаблона</td></tr>
					<tr><td>Не получал от гейта</td></tr>
				</table>				
			</div> -->

			<div class="infoblock EgrulRecordsInfo">
				<table width="100%">
					<caption>
						<h5>Сведения о записях в ЕГРЮЛ</h5>
					</caption>
					<tr>
					<td>
					<xsl:apply-templates select="a:СвЮЛ/a:СвЗапДейств"/>
					</td></tr>
					<tr><td>
					<xsl:apply-templates select="a:СвЮЛ/a:СвЗапНеДейств"/>
					</td></tr>
				</table>
			</div>
		</div>
	</xsl:template>

	<!-- Описание шаблонов разделов -->

	<xsl:template match="a:СвАдрес">	
		<tr>
			<td>Адрес (место нахождения) юр.лица</td>
			<td>
				<xsl:value-of select="a:АдресРФ/@Индекс"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="a:АдресРФ/@Город"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="a:АдресРФ/a:Улица/@НаимУлица"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="a:АдресРФ/a:Улица/@ТипУлица"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="a:АдресРФ/@Дом"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="a:АдресРФ/@Корпус"/>
				<xsl:text> </xsl:text>

				<xsl:value-of select="a:АдресРФ/@Кварт"/>
			</td>
		</tr>

		<tr>
			<td>Код города</td>
			<td>
			<xsl:value-of select="a:АдресРФ/@КодРегион"/>
			</td>
		</tr>
		<tr>
			<td>Дата внесения записи в ЕГРЮЛ</td>
			<td>
				<xsl:value-of select="@ДатаНачДейств"/>
			</td>
		</tr>

		<tr>
			<td>ГРН</td>
			<td>
				<xsl:value-of select="@ГРН"/>
			</td>
		</tr>

		<tr>
			<td>Наименование регоргана, в котором внесена запись</td>
			<td>
				<xsl:value-of select="../a:СвСтатус_РО/a:СвРегОрг/@НаимНО"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="a:СвУстКап">

		<table width="100%">
			<caption>
				<h5>Сведения об уставном капитале</h5>
			</caption>
			
				<tr>
					<td>Размер (в рублях)</td>
					<td>
						<xsl:value-of select="@СумКап"/>
					</td>
				</tr>
				<tr>
					<td>Вид капитала</td>
					<td>
						<xsl:value-of select="@НаимВидКап"/>
					</td>
				</tr>
				<tr>
					<td>Дата внесения записи в ЕГРЮЛ</td>
					<td>
						<xsl:value-of select="@ДатаНачДейств"/>
					</td>
				</tr>
				<tr>
					<td>ГРН</td>
					<td>
						<xsl:value-of select="@ГРН"/>
					</td>
				</tr>
				<tr>
					<td>Наименование регоргана, в котором внесена запись</td>
					<td></td>
				</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвСтатус_РО">
		<table width="100%">
			<caption>
				<h5>Сведения о состоянии юридического лица</h5>
			</caption>
			<tr>
				<td>Сведения о состоянии ЮЛ</td>
				<td>
					<xsl:value-of select="a:СвСтатус/@НаимСтатусЮЛ"/>
				</td>
			</tr>
			<tr>
				<td>Код регоргана</td>
				<td>
					<xsl:value-of select="a:СвРегОрг/@КодНО"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регоргана</td>
				<td>
					<xsl:value-of select="a:СвРегОрг/@НаимНО"/>
				</td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td>
					<xsl:value-of select="a:СвРегОрг/@НаимНО"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвОбрЮЛ">
		<table width="100%">
			<caption>
				<h5>Сведения об образовании юридического лица</h5>
			</caption>
			<tr>
				<td>Cпособ образования</td>
				<td>
					<xsl:value-of select="a:СпОбрЮЛ/@НаимСпОбрЮЛ"/>
				</td>
			</tr>

			<tr>
				<td>Дата регистрации</td>
				<td>
					<xsl:value-of select="@ДатаОбрЮЛ"/>
				</td>
			</tr>
			<tr>
				<td>ОГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>Регномер до 01.07.2002</td>
				<td>
					<xsl:value-of select="@РегНом"/>
				</td>
			</tr>
			<!-- <tr>
				<td>Код регоргана</td>
				<td></td>
			</tr> -->
			<tr>
				<td>Наименование регоргана</td>
				<td>
					<xsl:value-of select="@НаимРО"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвПрекрЮЛ">
		<table width="100%">
			<caption>
				<h5>Сведения о прекращении деятельности</h5>
			</caption>
			<xsl:if test="not(@i:nil)">
				<tr>
					<td>Дата внесения сведений в ЕГРЮЛ</td>
					<td>
						<xsl:value-of select="@ДатаНачДейств"/>
					</td>
				</tr>
				<tr>
					<td>Государственный регистрационный номер записи, на основании которых сведения внесены в ЕГРЮЛ</td>
					<td>
						<xsl:value-of select="@ГРН"/>
					</td>
				</tr>
				<tr>
					<td>Дата прекращения юридического лица</td>
					<td>
						<xsl:value-of select="@ДатаПрекрЮЛ"/>
					</td>
				</tr>
				<tr>
					<td>Способ прекращения юридического лица</td>
					<td>
						<xsl:value-of select="a:СпПрекрЮЛ/@НаимСпПрекрЮЛ"/>
					</td>
				</tr>
				<tr>
					<td>Сведения об органе, зарегистрировавшем  прекращение юридического лица</td>
					<td>
						<xsl:value-of select="a:CвРегОрг/@НаимНО"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template match="a:УчрЮЛРос">
		<table width="100%">
			<caption>
				<h5>Сведения об учредителях - Российских ЮЛ</h5>
			</caption>
			<xsl:if test="not(@i:nil)">
				<tr>
					<td>Дата внесения сведений в ЕГРЮЛ</td>
					<td>
						<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/@ДатаНачДейств"/>
					</td>
				</tr>
				<tr>
					<td>ГРН</td>
					<td>
						<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/@ГРН"/>
					</td>
				</tr>
				<tr>
					<td>ОГРН</td>
					<td>
						<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/@ОГРН"/>
					</td>
				</tr>
				<tr>
					<td>ИНН юридического лица</td>
					<td>
						<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/@ИННЮЛ"/>
					</td>
				</tr>
				<tr>
					<td>Полное наименование юридического лица</td>
					<td>
						<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/@НаимЮЛПолн"/>
					</td>
				</tr>
				<tr>
					<td>Доля в уставном капитале</td>
					<td>
						<xsl:if test="not(a:ДокументСвЮЛСвУчредитУчрЮЛРос/a:ДоляУстКап/@i:nil)">
							<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/a:ДоляУстКап/@НоминСтоим"/>
							<xsl:value-of select="a:ДокументСвЮЛСвУчредитУчрЮЛРос/a:ДоляУстКап/@Процент"/>%</xsl:if>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template match="a:CвУчредит">
		<xsl:apply-templates select="a:УчрЮЛРос"/>
		<table width="100%">
			<caption>
				<h5>Сведения об учредителях - иностранных ЮЛ</h5>
			</caption>
			<tr>
				<td>Нет шаблона</td>
			</tr>
		</table>
		<xsl:apply-templates select="a:УчрФЛ"/>
	</xsl:template>

	<xsl:template match="a:СвДержРеестрАО">
		<table width="100%">
			<caption>
				<h5>Сведения о держателе реестра акционеров АО</h5>
			</caption>
		</table>
	</xsl:template>

	<xsl:template match="a:CвПреемств">
		<div class="infoblock ULAncestors">
			<table width="100%">
				<caption>
					<h5>Сведения о юр.лицах - предшественниках при реорганизации</h5>
				</caption>
			</table>
		</div>
		<div class="infoblock ULDescendants">
			<table width="100%">
				<caption>
					<h5>Сведения о юр.лицах - преемниках при реорганизации</h5>
				</caption>
			</table>
			<tr><td></td></tr>
		</div>
	</xsl:template>

	<xsl:template match="a:СвОКВЭД">
		<table width="100%">
			<caption>
				<h5>Сведения о видах экономической деятельности</h5>
			</caption>
			<tr>
				<td>
					Дата регистрации
				</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>
			<tr>
				<td>
					ГРН
				</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>
					Код ОКВЭД
				</td>
				<td>
					<xsl:value-of select="@КодОКВЭД"/>
				</td>
			</tr>
			<tr>
				<td>
					Тип
				</td>
				<td>
					<xsl:value-of select="@ПрОснДоп"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвУчетНО">
		<table width="100%">
			<caption>
				<h5>Сведения о постановке на учет в налоговом органе</h5>
			</caption>
			<tr>
				<td>ИНН</td>
				<td>
					<xsl:value-of select="@ИНН"/>
				</td>
			</tr>
			<tr>
				<td>КПП</td>
				<td>
					<xsl:value-of select="@КПП"/>
				</td>
			</tr>
			<tr>
				<td>Дата постановки на учет в налоговом органе</td>
				<td>
					<xsl:value-of select="@ДатаПостУч"/>
				</td>
			</tr>
			<tr>
				<td>Дата снятия с учета</td>
				<td>
					<xsl:value-of select="@ДатаСнУч"/>
				</td>
			</tr>
			<tr>
				<td>Код налогового органа</td>
				<td>
					<xsl:value-of select="a:СвНО/@КодНО"/>
				</td>
			</tr>
			<tr>
				<td>Наименование налогового органа</td>
				<td>
					<xsl:value-of select="a:СвНО/@НаимНО"/>
				</td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td>
					<xsl:value-of select="a:СвНО/@НаимНО"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвЗапДейств">
		<table style="padding-bottom:1em" width="100%">
			<tr>
				<td>ОГРН</td>
				<td>
					<xsl:value-of select="../@ОГРН"/>
				</td>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td>
					<xsl:value-of select="../a:СвНаимЮЛ/@НаимЮЛПолн"/>
				</td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>Дата внесения записи</td>
				<td>
					<xsl:value-of select="@ДатаЗап"/>
				</td>
			</tr>
			<tr>
				<td>Событие, с которым связано внесение записи</td>
				<td>
					<xsl:value-of select="a:ВидЗап/@НаимВидЗап"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td>
					<xsl:value-of select="a:СвРегОрг/@НаимНО"/>
				</td>
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

	<xsl:template match="свЗапНеДейств">
				<table style="padding-bottom:1em" width="100%">
			<tr>
				<td>ОГРН</td>
				<td>
					<xsl:value-of select="../@ОГРН"/>
				</td>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td>
					<xsl:value-of select="../a:СвНаимЮЛ/@НаимЮЛПолн"/>
				</td>
			</tr>
			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>Дата внесения записи</td>
				<td>
					<xsl:value-of select="@ДатаЗап"/>
				</td>
			</tr>
			<tr>
				<td>Событие, с которым связано внесение записи</td>
				<td>
					<xsl:value-of select="a:ВидЗап/@НаимВидЗап"/>
				</td>
			</tr>
			<tr>
				<td>Наименование регоргана, в котором внесена запись</td>
				<td>
					<xsl:value-of select="a:СвРегОрг/@НаимНО"/>
				</td>
			</tr>
			<tr>
				<td>Статус</td>
				<td>Недействительная запись</td>
			</tr>
			<tr>
				<td class="linebreak" colspan="2">
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template match="a:УчрФЛ">
		<table width="100%">
			<caption>
				<h5>Сведения об учредителях - физических лицах</h5>
			</caption>
			<xsl:if test="not(@i:nil)">
				<tr>
					<td>Дата внесения сведений в ЕГРЮЛ</td>
					<td>
						<xsl:value-of select="@ДатаНачДейств"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>


	<xsl:template match="a:СвУправлДеят">
		<table width="100%">
			<caption>
				<h5>Сведения о физ.лицах, имеющих право действовать без доверенности</h5>
			</caption>
			<xsl:apply-templates select="a:СведДолжнФЛ"/>
		</table>

<!--

		<table width="100%">
			<caption>
				<h5>Сведения об управляющей компании</h5>
			</caption>
		</table> -->
	</xsl:template>

	<xsl:template match="a:СведДолжнФЛ">
		<tr>
			<td>ОГРН</td>
			<td>
				<xsl:value-of select="@ГРН"/>
			</td>
		</tr>
		<tr>
			<td>Должность</td>
			<td>
				<xsl:value-of select="@НаимДолжн"/>
			</td>
		</tr>
		<tr>
			<td>Фамилия</td>
			<td>
				<xsl:value-of select="a:ФИО/@Фамилия"/>
			</td>
		</tr>
		<tr>
			<td>Имя</td>
			<td>
				<xsl:value-of select="a:ФИО/@Имя"/>
			</td>
		</tr>
		<tr>
			<td>Отчество</td>
			<td>
				<xsl:value-of select="a:ФИО/@Отчество"/>
			</td>
		</tr>
		<tr>
			<td>ИНН</td>
			<td>
				<xsl:value-of select="@ИННФЛ"/>
			</td>
		</tr>
		<tr>
			<td>Дата внесения записи в ЕГРЮЛ</td>
			<td>
				<xsl:value-of select="@ДатаНачДейств"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="a:СвУпрОргРос">
	</xsl:template>

	<xsl:template match="a:СвУпрОргИн">
	</xsl:template>

	<xsl:template match="a:СвУправлИП">
	</xsl:template>


	<xsl:template match="a:СвПодразд">
		<table width="100%">
			<xsl:if test="гРНField = 1">
				<caption>
					<h5>Сведения о филиалах юр.лица</h5>
				</caption>
			</xsl:if>
			<xsl:if test="гРНField = 2">
				<caption>
					<h5>Сведения о представительствах юр.лица</h5>
				</caption>
			</xsl:if>

			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td>
					<xsl:value-of select="@НаимПолн"/>
				</td>
			</tr>
			<tr>
				<td>Адрес (место нахождения) филиала</td>
				<td>
					<xsl:apply-templates select="a:АдрМНРФ"/>
					<xsl:apply-templates select="a:АдрМНИн"/>
				</td>
			</tr>
			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="a:СвРегПФ">
		<table width="100%">
			<caption>
				<h5>Сведения о регистрации в ПФ России</h5>
			</caption>
			<tr>
				<td>ОГРН</td>
				<xsl:value-of select="../@ОГРН"/>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td>
					<xsl:value-of select="../a:CвНаимЮЛ/@НаимЮЛПолн"/>
				</td>
			</tr>
			<tr>
				<td>Регномер ПФ</td>
				<td>
					<xsl:value-of select="@РегНомПФ"/>
				</td>
			</tr>
			<tr>
				<td>Дата регистрации</td>
				<td>
					<xsl:value-of select="@ДатаРег"/>
				</td>
			</tr>
			<tr>
				<td>Дата снятия с учета</td>
				<td>
					<xsl:value-of select="@ДатаСнУч"/>
				</td>
			</tr>
			<tr>
				<td>Наименование территориального органа ПФ</td>
				<td>
				<xsl:value-of select="a:СвОргПФ/@НаимПФ"/>
				</td>
			</tr>

			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>

			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="a:СвРегФСС">
		<table width="100%">
			<caption>
				<h5>Сведения о регистрации ФСС России</h5>
			</caption>
			<tr>
				<td>ОГРН</td>
				<xsl:value-of select="../@ОГРН"/>
			</tr>
			<tr>
				<td>Полное наименование ЮЛ</td>
				<td>
					<xsl:value-of select="../a:CвНаимЮЛ/@НаимЮЛПолн"/>
				</td>
			</tr>
			<tr>
				<td>Регномер ФСС</td>
				<td>
					<xsl:value-of select="@РегНомФСС"/>
				</td>
			</tr>
			<tr>
				<td>Дата регистрации</td>
				<td>
					<xsl:value-of select="@ДатаРег"/>
				</td>
			</tr>
			<tr>
				<td>Дата снятия с учета</td>
				<td>
					<xsl:value-of select="@ДатаСнУч"/>
				</td>
			</tr>
			<tr>
				<td>Наименование исполнительного органа ФСС</td>
				<td>
					<xsl:value-of select="a:СвОргФСС/@НаимФСС"/>
				</td>
			</tr>

			<tr>
				<td>Дата внесения записи в ЕГРЮЛ</td>
				<td>
					<xsl:value-of select="@ДатаНачДейств"/>
				</td>
			</tr>

			<tr>
				<td>ГРН</td>
				<td>
					<xsl:value-of select="@ГРН"/>
				</td>
			</tr>
		</table>
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
		<scenario default="no" name="Scenario2" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Users\KHOLINOV\Desktop\sql\test.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
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
			<SourceSchema srcSchemaPath="test2.xml" srcSchemaRoot="ДокументСвЮЛ4" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
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
			<template match="/ДокументСвЮЛ4">
				<block path="div/div/div/span/xsl:value-of" x="278" y="144"/>
				<block path="div/div/h5/xsl:value-of" x="38" y="85"/>
				<block path="div/div[1]/table/tr/td[1]/xsl:value-of" x="158" y="45"/>
				<block path="div/div[1]/table/tr[1]/td[1]/xsl:value-of" x="118" y="45"/>
				<block path="div/div[1]/table/tr[2]/td[1]/xsl:value-of" x="78" y="45"/>
				<block path="div/div[1]/table/tr[3]/td[1]/xsl:value-of" x="38" y="45"/>
				<block path="div/div[1]/table/tr[4]/td[1]/xsl:value-of" x="318" y="125"/>
				<block path="div/div[1]/table/tr[5]/td[1]/xsl:value-of" x="238" y="125"/>
				<block path="div/div[1]/table/tr[6]/td[1]/xsl:value-of" x="198" y="125"/>
				<block path="div/div[2]/table/tr/td[1]/xsl:value-of" x="158" y="125"/>
				<block path="div/div[2]/table/tr[1]/td[1]/xsl:value-of" x="118" y="125"/>
				<block path="div/div[2]/table/xsl:apply-templates" x="238" y="45"/>
				<block path="div/div[3]/xsl:apply-templates" x="278" y="85"/>
				<block path="div/div[4]/xsl:apply-templates" x="318" y="85"/>
				<block path="div/div[5]/xsl:apply-templates" x="238" y="85"/>
				<block path="div/div[6]/xsl:apply-templates" x="198" y="85"/>
				<block path="div/xsl:apply-templates" x="278" y="18"/>
				<block path="div/div[7]/xsl:value-of" x="158" y="85"/>
				<block path="div/xsl:apply-templates[1]" x="318" y="18"/>
				<block path="div/div[12]/xsl:apply-templates" x="118" y="85"/>
				<block path="div/div[13]/xsl:apply-templates" x="78" y="85"/>
				<block path="div/div[18]/table/xsl:apply-templates" x="198" y="45"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext>
			<template match="Документ5" mode="" srcContextPath="/Документ5" srcContextFile="file:///c:/Users/KHOLINOV/Desktop/sql/test2.xml" targetContextPath="/doc" targetContextFile=""/>
		</TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->