<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCComorbidities" CodeFile="PCCTCComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="PCCTCComorbidities" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>
<table id="AddComorbiditiesTable" border="0" cellspacing="0" cellpadding="16" width="650" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="AddComorbiditiesYesNoContainer">
	
	No prior comorbidities have been recorded for this patient.<br /><br />
	
	<strong>Has the subject had prior comorbidities?</strong><euc:EformRadioButtonList Table="NoTable" Field="ComorbiditiesYesNo" id="ComorbiditiesYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
</table>


<span id="ComorbiditiesDetails" style="display: none;" >
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; padding-left: 10px;">Comorbidity <span style="font-weight: normal; font-size: 11px;">(check if present)</span></td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CoronaryArteryDisease" Value="Coronary Artery Disease" RecordId="1" /> Coronary Artery Disease</td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MyocardialInfarction" Value="Myocardial Infarction" RecordId="2" /> Myocardial Infarction</td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="3" />
      Hypertension</td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CVA" Value="CVA" RecordId="4" />
      CVA</td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ThromboembolicEventsDVT" Value="Thromboembolic Events / DVT" RecordId="5" />
      Thromboembolic Events / DVT</td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Asthma" Value="Asthma" RecordId="6" /> Asthma</td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesIDDM" Value="Diabetes (IDDM)" RecordId="7" /> Diabetes (IDDM)</td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesNIDDM" Value="Diabetes (NIDDM)" RecordId="8" />
    Diabetes (NIDDM)</td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypercholesterolemia" Value="Hypercholesterolemia" RecordId="9" />
      Hypercholesterolemia</td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Depression" Value="Depression" RecordId="10" />
      Depression</td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <!-- extra blank rows -->
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="16" Table="Comorbidities" Runat="server" ID="Comorbidity_16"  /></td>
    <td align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_16"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="17" Table="Comorbidities" Runat="server" ID="Comorbidity_17"  /></td>
    <td align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_17"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="18" Table="Comorbidities" Runat="server" ID="Comorbidity_18"  /></td>
    <td align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_18"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="19" Table="Comorbidities" Runat="server" ID="Comorbidity_19"  /></td>
    <td align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_19"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="20" Table="Comorbidities" Runat="server" ID="Comorbidity_20"  /></td>
    <td align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_20"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="21"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="21" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="21" Table="Comorbidities" Runat="server" ID="Comorbidity_21"  /></td>
    <td align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_21"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="22"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="22" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="22" Table="Comorbidities" Runat="server" ID="Comorbidity_22"  /></td>
    <td align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_22"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="23"  ID="ComorbDateText_23" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="23" Runat="server" ID="ComorbDate_23" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="23" Table="Comorbidities" Runat="server" ID="Comorbidity_23"  /></td>
    <td align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_23"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="24"  ID="ComorbDateText_24" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="24" Runat="server" ID="ComorbDate_24" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="24" Table="Comorbidities" Runat="server" ID="Comorbidity_24"  /></td>
    <td align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_24"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="25"  ID="ComorbDateText_25" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="25" Runat="server" ID="ComorbDate_25" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="25" Table="Comorbidities" Runat="server" ID="Comorbidity_25"  /></td>
    <td align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_25"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <!-- extra blank rows -->
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="26"  ID="ComorbDateText_26" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="26" Runat="server" ID="ComorbDate_26" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="26" Table="Comorbidities" Runat="server" ID="Comorbidity_26"  /></td>
    <td align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_26"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="27"  ID="ComorbDateText_27" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="27" Runat="server" ID="ComorbDate_27" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="27" Table="Comorbidities" Runat="server" ID="Comorbidity_27"  /></td>
    <td align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_27"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="28"  ID="ComorbDateText_28" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="28" Runat="server" ID="ComorbDate_28" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="28" Table="Comorbidities" Runat="server" ID="Comorbidity_28"  /></td>
    <td align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_28"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="29"  ID="ComorbDateText_29" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="29" Runat="server" ID="ComorbDate_29" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="29" Table="Comorbidities" Runat="server" ID="Comorbidity_29"  /></td>
    <td align="center"><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_29"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="30"  ID="ComorbDateText_30" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="30" Runat="server" ID="ComorbDate_30" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200px"   LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="30" Table="Comorbidities" Runat="server" ID="Comorbidity_30"  /></td>
    <td align="center"><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:180px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_30"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
</span>
<div id="ComorbiditiesAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="TableName" ID="TableName_6"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldName" ID="FieldName_6"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_6"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_6"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_6"
                runat="server"  style="display:none;" />
</div>
<br/><br/>
<br/>
<script type="text/javascript">
function attachShowHideComorbiditiesScriptsAndSetInitialDisplay()
{
	var AddComorbiditiesYesNoContainer = $('AddComorbiditiesYesNoContainer');
	var ComorbiditiesYesNoRadios = AddComorbiditiesYesNoContainer.getElementsByTagName('input');
	var showComorbiditesOnload = false;
	var showComorbiditiesMsg = false;
	var ComorbiditiesDetails = document.getElementById('ComorbiditiesDetails');
	var AddComorbiditiesTable  = $('AddComorbiditiesTable');
	
	
	if (<% =PriorComorbiditiesExist.ToString().ToLower() %>)
	{
	    showComorbiditesOnload = true;
	    showComorbiditiesMsg = false;
	}
	else
	{
	    showComorbiditiesMsg = true;
	    for (var i=0;i<ComorbiditiesYesNoRadios.length;i++)
	    {
		    if (ComorbiditiesYesNoRadios[i].type == 'radio')
		    {
			    ComorbiditiesYesNoRadios[i].onclick = function() {showHideComorbidities(this)};
			    if (ComorbiditiesYesNoRadios[i].checked && ComorbiditiesYesNoRadios[i].value.toString().toUpperCase() == 'YES') showComorbiditesOnload = true;
		    }
	    }
	}
	if (showComorbiditesOnload) ComorbiditiesDetails.style.display = 'block';
	if (showComorbiditiesMsg){AddComorbiditiesTable.style.display = 'block';}
	else {AddComorbiditiesTable.style.display = 'none';}
	
}
attachShowHideComorbiditiesScriptsAndSetInitialDisplay();

function showHideComorbidities(theRadio)
{
	var ComorbiditiesDetails = document.getElementById('ComorbiditiesDetails');
	var ComorbiditiesAbsentEvent = document.getElementById('ComorbiditiesAbsentEvent');
	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		ComorbiditiesDetails.style.display = 'block';
		clearAllElementsContainedInNode(ComorbiditiesAbsentEvent);
	}
	else
	{
		ComorbiditiesDetails.style.display = 'none';
		clearAllElementsContainedInNode(ComorbiditiesDetails);
		$('<% =TableName_6.ClientID %>').value = 'Comorbidities';
		$('<% =FieldName_6.ClientID %>').value = 'Comorbidities';
		$('<% =FieldValue_6.ClientID %>').value = 'No Documented Comorbidities';
	}

}
</script>
