<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.UrinaryAndSexualFunction2" CodeFile="UrinaryAndSexualFunction2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function getRadioButtonValue(radioButtonName)
{
   var radioValue = '';

   for (var i=0; i < document.dataForm.radioButtonName.length; i++)
   {
      if (document.dataForm.radioButtonName[i].checked)
      {
		radioValue = document.dataForm.radioButtonName[i].value;
      }
   }   
}

function executePageEventOnComboClick(selVal, inputFieldName) {
	if (selVal != null && selVal != '') {
		if (inputFieldName.indexOf("IncontinenceTX") > -1) {
			document.getElementById('<%= IncontinenceTX_Indication.ClientID %>').removeAttribute('disabled');
		} else if (inputFieldName.indexOf("StrictureTX") > -1) {
			document.getElementById('<%= StrictureTX_Indication.ClientID %>').removeAttribute('disabled');
		}
	}
}

function enableIncontinenceHidden(val) {
	if (val != null && val != '') {
		document.getElementById('<%= IncontinenceTX_Indication.ClientID %>').removeAttribute('disabled');
	}
}

function enableStrictureHidden(val) {
	if (val != null && val != '') {
		document.getElementById('<%= StrictureTX_Indication.ClientID %>').removeAttribute('disabled');
	}
}




</script>

<a name="UrinaryAndSexualFunction2" /><span class="controlBoxTitle">Urinary Function  </span><br/>

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr id="LastUrinaryQOLRow" runat="server">
    <td width="23%" colspan="3" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB"><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" /></td>
  </tr>
  <tr>
    <td width="5%" height="45" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>1</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA"><table border="0" cellspacing="0" cellpadding="0" width="420">
      <tr>
        <td style="font-weight: bold;">Continence<br/>&nbsp;&nbsp;<span style="font-size: smaller;">(TODAY)</span></td>
        <td align="right">
	

	<euc:EformHidden id="SurveyType_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
	<euc:EformHidden id="SurveyDate_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDate"/>
	<euc:EformHidden id="SurveyDateText_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDateText"/>
	<euc:EformHidden id="SurveyQuestion_Continence" runat="server" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_4"  runat="server" RecordId="1" ParentRecordId="2"
		EnableHiddenOnUIEvent="SurveyQuestion_Continence,SurveyType_2,SurveyDate_2,SurveyDateText_2">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Continence (no pads)</asp:ListItem>
			<asp:ListItem Value="2">2: Mild SUI (leaks only during heavy activity)</asp:ListItem>
			<asp:ListItem Value="3">3: Moderate SUI (leaks with moderate activity)</asp:ListItem>
			<asp:ListItem Value="4">4: Severe SUI (leaks during nl activity, dry at night and at rest)</asp:ListItem>
			<asp:ListItem Value="5">5: Total Incontinence (continuous leakage of urine at rest)</asp:ListItem>
	</euc:EformDropDownList>  	</td>
      </tr>
    </table><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/></td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsB"><strong>2</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td colspan="2"><asp:Label id="DateMildContinenceAchievedLabel" runat="server" Font-Bold="true">Mild Continence (Score 2 for Continence) was not achieved/recorded prior to today.</asp:Label></td>
  </tr>
  <tr id="PastMildContinenceRow" runat="server">
    <td  style="padding-top: 17px; padding-bottom: 14px; padding-left: 20px;">If Mild Continence <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
	<euc:EformHidden id="SurveyType_MildContinence" runat="server" RecordId="5" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
	<euc:EformHidden id="SurveyQuestion_MildContinence" runat="server" RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
	<euc:EformHidden id="SurveyItemResult_MildContinence" runat="server" RecordId="1" ParentRecordId="5" Table="SurveyItems" FIELD="SurveyItemResult"  Value="2"/>
	<euc:EformHidden id="MildContinence_SurveyDate" runat="server" RecordId="5" Table="Surveys" Field="SurveyDate"/>
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="5"  FIELD="SurveyDateText" Runat="server" ID="MildContinence_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_MildContinence,SurveyQuestion_MildContinence,SurveyItemResult_MildContinence"/></td>
  </tr>
</table>	</td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsA"><strong>3</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td><asp:Label id="DateTotalContinenceAchievedLabel" runat="server" Font-Bold="true">Total Continence (Score 1 for Continence) was not achieved/recorded prior to today.</asp:Label></td>
      </tr>
      <tr id="PastTotalContinenceRow" runat="server">
        <td style="padding-top: 17px; padding-bottom: 14px;padding-left: 20px">If Total Continence <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
        	<euc:EformHidden id="SurveyType_TotalContinence" runat="server" RecordId="6" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
            <euc:EformHidden id="SurveyQuestion_TotalContinence" runat="server" RecordId="1" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
            <euc:EformHidden id="SurveyItemResult_TotalContinence" runat="server" RecordId="1" ParentRecordId="6" Table="SurveyItems" FIELD="SurveyItemResult"  Value="1"/>
            <euc:EformHidden id="TotalContinence_SurveyDate" runat="server" RecordId="6" Table="Surveys" Field="SurveyDate"/>
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="6"  FIELD="SurveyDateText" Runat="server" ID="TotalContinence_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_TotalContinence,SurveyQuestion_TotalContinence,SurveyItemResult_TotalContinence"/>        </td>
      </tr>
    </table>      </td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><strong>4</strong></td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">TX for Incontinence</td>
    <td width="30%" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">
	<euc:EformHidden id="IncontinenceTX_Indication" name="IncontinenceTX_Indication" runat="server" RecordId="3" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Incontinence" />
	<euc:EformComboBox LookupCode="QOL_Therapy"  RefBy="IncontinenceTX" style="width:100;" Field="QOL_Therapy" Table="QOL_Therapy" RecordId="3" Runat="server" id="IncontinenceTX"  />
      <asp:Label ID="LastIncontTx" Runat="server" CssClass="blackBoldTextSmall" /></td>
    <td class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">TX Date &nbsp;&nbsp;&nbsp;
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="QOL_Therapy"  RecordId="3"  FIELD="QOL_TxDateText" Runat="server" ID="IncontinenceTXDateText" AppendToOnChange="enableIncontinenceHidden(this.value);"/>
	<euc:EformHidden RecordId="3" Runat="server" ID="IncontinenceTXDate" Table="QOL_Therapy" FIELD="QOL_TxDate" /></td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>5</strong></td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">TX for Stricture			</td>
    <td class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
	
	<euc:EformHidden id="StrictureTX_Indication" runat="server" RecordId="4" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Stricture"/>	
	<euc:EformComboBox  LookupCode="QOL_Therapy"   RefBy="IncontinenceTX" style="width:100;" Field="QOL_Therapy" Table="QOL_Therapy"    RecordId="4" Runat="server" id="StrictureTX"/></td>
    <td class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">TX Date &nbsp;&nbsp;&nbsp;
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="QOL_Therapy"  RecordId="4"  FIELD="QOL_TxDateText" Runat="server" ID="StrictureTXDateText" AppendToOnChange="enableStrictureHidden(this.value);"/>
	<euc:EformHidden RecordId="4" Runat="server" ID="StrictureTXDate" Table="QOL_Therapy" FIELD="QOL_TxDate" />	</td>
  </tr>
  
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><strong>6</strong>	</td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">IPSS Score
	<euc:EformHidden id="SurveyType_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyType" Value="IPSS"/>
	<euc:EformHidden id="SurveyDate_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyDate"/>
    <euc:EformHidden id="SurveyDateText_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyDateText"/>
	<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" ShowNumberPad="true" style="width:90px;" TABLE="Surveys" FIELD="SurveyResult" Runat="server" ID="IPSSScore"   />	</td>
  </tr>
    <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>7</strong></td>
    <td colspan="4" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
		<table cellpadding="0" cellspacing="0" border="0">
		<tr><td valign="top" style="padding-right: 8px;">
	Notes</td><td>
      <euc:EformTextArea TextMode="MultiLine" TABLE="Surveys" FIELD="SurveyNotes" RecordId="2" Rows="4" Runat="server" ID="UrinaryNotes" style="width: 500px;"/></td>
  		</tr></table></td>
  </tr>
</table>
<br/>
<br/>
<br/>

<script language="javascript">
	function enableSurveyType() {
		var val = document.getElementById('<%= IPSSScore.ClientID %>').value;
		if (val != null && val != '') {
			document.getElementById('<%= SurveyType_IPSS.ClientID %>').removeAttribute('disabled');
			document.getElementById('<%= SurveyDate_IPSS.ClientID %>').removeAttribute('disabled');
			document.getElementById('<%= SurveyDateText_IPSS.ClientID %>').removeAttribute('disabled');
		} else {
			document.getElementById('<%= SurveyType_IPSS.ClientID %>').disabled = 'disabled';
			document.getElementById('<%= SurveyDate_IPSS.ClientID %>').disabled = 'disabled';
			document.getElementById('<%= SurveyDateText_IPSS.ClientID %>').disabled = 'disabled';
		}
	}
	
	document.getElementById('<%= IPSSScore.ClientID %>').onblur = enableSurveyType;
</script>


<span class="controlBoxTitle">Erectile Function </span><br/>
<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr  id="LastSexualQOLRow" runat="server">
    <td width="6%" colspan="2" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB"><asp:Label CssClass="blackBoldTextSmall" ID="SexualQOL" Runat="server" />&nbsp;</td>
  </tr>
  <tr>
    <td width="5%" height="45" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>8</strong></td>
    <td colspan="3" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
	<table border="0" cellspacing="0" cellpadding="0" width="390">
      <tr>
        <td style="vertical-align: top; font-weight: bold;">Erectile Function<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: smaller;">(TODAY)</td>
        <td  style="vertical-align: top;"><euc:EformHidden id="SurveyType_2_Sexual" runat="server" RecordId="3" Table="Surveys" Field="SurveyType" Value="Sexual Function"/>
          <euc:EformHidden id="SurveyDate_3" runat="server" RecordId="3" Table="Surveys" Field="SurveyDate"/>
		  <euc:EformHidden id="SurveyDateText_3" runat="server" RecordId="3" Table="Surveys" Field="SurveyDateText"/>
          <euc:EformHidden id="SurveyQuestion_ErectileFunction" runat="server" RecordId="1" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" Value="Erectile Function"/>
          <euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_4_Sexual"  runat="server" RecordId="1" ParentRecordId="3"
		EnableHiddenOnUIEvent="SurveyQuestion_ErectileFunction,SurveyType_2_Sexual,SurveyDate_3,SurveyDateText_3">
            <asp:ListItem Value="">-- Select Value --</asp:ListItem>
            <asp:ListItem Value="1">1: Normal, full erections</asp:ListItem>
            <asp:ListItem Value="2">2: Full, but recently diminished</asp:ListItem>
            <asp:ListItem Value="3">3: Partial, satisfactory for intercourse</asp:ListItem>
            <asp:ListItem Value="4">4: Partial, unsatisfactory for intercourse</asp:ListItem>
            <asp:ListItem Value="5">5: Impotent</asp:ListItem>
          </euc:EformDropDownList>          </td>
      </tr>
    </table><asp:Label CssClass="blackBoldTextSmall" ID="LastPot" Runat="server" />    </td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><strong>9</strong></td>
    <td colspan="3" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td><asp:Label id="DatePartialErectionAchievedLabel" runat="server" Font-Bold="true">Partial Erection (Score 3 for Erectile Function) was not achieved/recorded prior to today.</asp:Label></td>
      </tr>
      <tr id="PastPartialErectionRow" runat="server">
        <td style="padding-top: 17px; padding-bottom: 14px; padding-left: 20px">If Partial Erection <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
			<euc:EformHidden id="SurveyType_PartialErection" runat="server" RecordId="7" Table="Surveys" Field="SurveyType" Value="Sexual Function"/>
            <euc:EformHidden id="SurveyQuestion_PartialErection" runat="server" RecordId="1" ParentRecordId="7" Table="SurveyItems" Field="SurveyItem" Value="Erectile Function"/>
            <euc:EformHidden id="SurveyItemResult_PartialErection" runat="server" RecordId="1" ParentRecordId="7" Table="SurveyItems" FIELD="SurveyItemResult"  Value="3"/>
            <euc:EformHidden id="PartialErection_SurveyDate" runat="server" RecordId="7" Table="Surveys" Field="SurveyDate"/>
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="7"  FIELD="SurveyDateText" Runat="server" ID="PartialErection_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_PartialErection,SurveyQuestion_PartialErection,SurveyItemResult_PartialErection"/></td>
      </tr>
    </table>  </td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsA" valign="top"><strong>10</strong></td>
    <td colspan="3" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td><asp:Label id="DateFullRecentlyDiminishedErectionAchievedLabel" runat="server" Font-Bold="true">Full but Recently Diminished Erection (Score 2 for Erectile Function) was not<br/>achieved/recorded prior to today.</asp:Label></td>
      </tr>
      <tr id="PastFullRecentlyDiminishedRow" runat="server">
        <td  style="padding-top: 17px; padding-bottom: 14px; padding-left: 20px">If Full, but Recently Diminished Erection <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
        	<euc:EformHidden id="SurveyType_FullRecentlyDiminishedErection" runat="server" RecordId="8" Table="Surveys" Field="SurveyType" Value="Sexual Function"/>
            <euc:EformHidden id="SurveyQuestion_FullRecentlyDiminishedErection" runat="server" RecordId="1" ParentRecordId="8" Table="SurveyItems" Field="SurveyItem" Value="Erectile Function"/>
            <euc:EformHidden id="SurveyItemResult_FullRecentlyDiminishedErection" runat="server" RecordId="1" ParentRecordId="8" Table="SurveyItems" FIELD="SurveyItemResult"  Value="2"/>
            <euc:EformHidden id="FullRecentlyDiminishedErection_SurveyDate" runat="server" RecordId="8" Table="Surveys" Field="SurveyDate"/>
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="8"  FIELD="SurveyDateText" Runat="server" ID="FullRecentlyDiminishedErection_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_FullRecentlyDiminishedErection,SurveyQuestion_FullRecentlyDiminishedErection,SurveyItemResult_FullRecentlyDiminishedErection"/></td>
      </tr>
    </table>    </td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB" valign="top"><strong>11</strong></td>
    <td colspan="3" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">
	
	
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td><asp:Label id="DateFullNormalErectionAchievedLabel" runat="server" Font-Bold="true">Full, Normal Erection (Score 1 for Erectile Function) was not achieved/recorded prior to today.</asp:Label></td>
      </tr>
      <tr id="PastFullNormalRow" runat="server">
        <td  style="padding-top: 17px; padding-bottom: 14px; padding-left: 20px; border-bottom: solid 1px #cccccc;">If Full, Normal Erection <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
        	<euc:EformHidden id="SurveyType_FullNormalErection" runat="server" RecordId="9" Table="Surveys" Field="SurveyType" Value="Sexual Function"/>
            <euc:EformHidden id="SurveyQuestion_FullNormalErection" runat="server" RecordId="1" ParentRecordId="9" Table="SurveyItems" Field="SurveyItem" Value="Erectile Function"/>
            <euc:EformHidden id="SurveyItemResult_FullNormalErection" runat="server" RecordId="1" ParentRecordId="9" Table="SurveyItems" FIELD="SurveyItemResult"  Value="1"/>
            <euc:EformHidden id="FullNormalErection_SurveyDate" runat="server" RecordId="9" Table="Surveys" Field="SurveyDate"/>
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="9"  FIELD="SurveyDateText" Runat="server" ID="FullNormalErection_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_FullNormalErection,SurveyQuestion_FullNormalErection,SurveyItemResult_FullNormalErection"/></td>
      </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB">% Best Erection, w/ PO meds
	<euc:EformHidden id="SurveyQuestion_PercentBestErectionMeds" runat="server" RecordId="2" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" Value="Percent Best Erection (Meds)"/>	</td>
    <td class="ControlBoxRowAlternatingRowsB"><euc:EformTextBox  RecordId="2" ParentRecordId="3" ShowCalendar="false" ShowNumberPad="True" CalcDate="false" style="width:30px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="PercentBestErectionWithMeds" EnableHiddenOnUIEvent="SurveyType_2,SurveyQuestion_PercentBestErectionMeds"/>%</td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB">% Best Erection, w/o meds </td>
    <td class="ControlBoxRowAlternatingRowsB">
	<euc:EformHidden id="SurveyQuestion_PercentBestErectionNoMeds" runat="server" RecordId="3" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" Value="Percent Best Erection (No Meds)"/>
	<euc:EformTextBox  RecordId="3" ParentRecordId="3" ShowCalendar="false" ShowNumberPad="True" CalcDate="false" style="width:30px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="PercentBestErectionWithoutMeds" EnableHiddenOnUIEvent="SurveyType_2,SurveyQuestion_PercentBestErectionNoMeds"/>%</td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>12</strong></td>
    <td colspan="3" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
    
    
    
    
    <table width="80%" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SexualQOLHtmlTable">
  <tr> 
    <td width="50%"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;TX for Erectile Dysfunction</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Start Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="QolTherapy" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('QOL_Therapy', <%# DataBinder.Eval(Container.DataItem, "QOL_TherapyId") %>, 'QOL_TxDateText,QOL_TxIndication,QOL_Therapy,QOL_TxStopDateText', 'ShortQOLSexual');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_Therapy") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxStopDateText") %></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

  
  

  <tr>
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Vacuum Erection Device
		<euc:EformHidden id="QOL_TxIndication" runat="server" RecordId="1" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Erectile Dysfunction"/>
		<euc:EformHidden id="QOL_Therapy" runat="server" RecordId="1" Table="QOL_Therapy" Field="QOL_Therapy" Value="Vacuum Erectile Device (VED)"/>    </td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="1"  ID="QOL_TxTherapyDateText" TABLE="QOL_Therapy" FIELD="QOL_TxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="QOL_TxIndication,QOL_Therapy"/>
		<euc:EformHidden RecordId="1" Runat="server" ID="QOL_TxTherapyDate" Table="QOL_Therapy" FIELD="QOL_TxDate" />	</td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="1"  ID="QOL_TxTherapyStopDateText" TABLE="QOL_Therapy" FIELD="QOL_TxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="QOL_TxIndication,QOL_Therapy" />
		<euc:EformHidden RecordId="1" Runat="server" ID="QOL_TxTherapyStopDate" Table="QOL_Therapy" FIELD="QOL_TxStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  
  
   <tr>
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Penile Prosthesis
		<euc:EformHidden id="OpNamePenileProsthesis" runat="server" RecordId="12" Table="Procedures" Field="ProcName" Value="Penile Prosthesis"/>
		<euc:EformHidden id="OpIndicationPenileProsthesis" runat="server" RecordId="12" Table="Procedures" Field="ProcIndication" Value="Erectile Dysfunction"/>    </td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="12"  ID="PenileProsthesisOpDateText" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="OpNamePenileProsthesis,OpIndicationPenileProsthesis" />
		<euc:EformHidden RecordId="12" Runat="server" ID="PenileProsthesisOpDate" Table="Procedures" Field="ProcDate" />    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  
   <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;MUSE
		<euc:EformHidden id="MedicationMUSE" runat="server" RecordId="21" Table="Medications" Field="Medication" Value="MUSE"/>
		<euc:EformHidden id="MedIndicationMUSE" runat="server" RecordId="21" Table="Medications" Field="MedIndication" Value="Erectile Dysfunction"/>    </td>
    <td >
    
    &nbsp;<euc:EformTextBox Runat="server" RecordId="21"  ID="MUSEMedDateText" TABLE="Medications" FIELD="MedDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationMUSE,MedIndicationMUSE" />
    <euc:EformHidden RecordId="21" Runat="server" ID="MUSEMedDate" Table="Medications" Field="MedDate" />    </td>
    <td style="white-space: nowrap;">&nbsp;
        <euc:EformTextBox Runat="server" RecordId="21"  ID="MUSEMedStopDateText" TABLE="Medications" FIELD="MedStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationMUSE,MedIndicationMUSE" />
        <euc:EformHidden RecordId="21" Runat="server" ID="MUSEMedStopDate" Table="Medications" Field="MedStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Intracorp. Injection
		<euc:EformHidden id="MedicationErectileInjection" runat="server" RecordId="22" Table="Medications" Field="Medication" Value="Intracavernosal Injection"/>
		<euc:EformHidden id="MedRouteErectileInjection" runat="server" RecordId="22" Table="Medications" Field="MedRoute" Value="Intracavernosal"/>
		<euc:EformHidden id="MedIndicationErectileInjection" runat="server" RecordId="22" Table="Medications" Field="MedIndication" Value="Erectile Dysfunction"/>    </td>
    <td >
    
    &nbsp;<euc:EformTextBox Runat="server" RecordId="22"  ID="ErectileInjectionMedDateText" TABLE="Medications" FIELD="MedDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationErectileInjection,MedIndicationErectileInjection,MedRouteErectileInjection" />
    <euc:EformHidden RecordId="22" Runat="server" ID="ErectileInjectionMedDate" Table="Medications" Field="MedDate" />    </td>
    <td style="white-space: nowrap;" >&nbsp;
        <euc:EformTextBox Runat="server" RecordId="22"  ID="ErectileInjectionMedStopDateText" TABLE="Medications" FIELD="MedStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationErectileInjection,MedIndicationErectileInjection,MedRouteErectileInjection" />
        <euc:EformHidden RecordId="22" Runat="server" ID="ErectileInjectionMedStopDate" Table="Medications" Field="MedStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;PDE-5 Inhibitors
		<euc:EformHidden id="MedicationPDE" runat="server" RecordId="23" Table="Medications" Field="Medication" Value="PDE-5 Inhibitors"/>
		<euc:EformHidden id="MedIndicationPDE" runat="server" RecordId="23" Table="Medications" Field="MedIndication" Value="Erectile Dysfunction"/>    </td>
    <td >
    
    &nbsp;<euc:EformTextBox Runat="server" RecordId="23"  ID="MedDateTextPDE" TABLE="Medications" FIELD="MedDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationPDE,MedIndicationPDE" />
    <euc:EformHidden RecordId="23" Runat="server" ID="MedDatePDE" Table="Medications" Field="MedDate" />    </td>
    <td style="white-space: nowrap;">&nbsp;
        <euc:EformTextBox Runat="server" RecordId="23"  ID="MedStopDateTextPDE" TABLE="Medications" FIELD="MedStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationPDE,MedIndicationPDE" />
        <euc:EformHidden RecordId="23" Runat="server" ID="MedStopDatePDE" Table="Medications" Field="MedStopDate" />    </td>
    <td>&nbsp;</td>
 </tr>

</table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To enter  other Medications, please see the Medications section. <br />
    <br /></td>
  </tr>
  
  
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsB"><strong>13</strong></td>
    <td colspan="3" valign="top" class="ControlBoxRowAlternatingRowsB">
	
	<table cellpadding="0" cellspacing="0" border="0">
		<tr><td valign="top" style="padding-right: 8px;">
	Notes</td><td>
      <euc:EformTextArea TextMode="MultiLine" TABLE="Surveys" FIELD="SurveyNotes" RecordId="3" Rows="4" Runat="server" ID="SexualFunctionNotes" style="width:500px;"/></td>
  		</tr></table>	</td>
  </tr>
</table>
<br/>
<br/>
<br/>


