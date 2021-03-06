<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.LabTestsGTD" CodeFile="LabTestsGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	tableArray.OtherLabTestsHtmlTable = "OtherLabTestsHtmlTable";
</script>

<a name="LabTestsGTD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab Tests"></asp:Label><br/>

<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OtherLabTestsHtmlTable">
	<tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		<td width="23%" class="controlBoxDataGridHeaderFirstCol">Test</td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol">Result</td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol">Units</td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther"> 
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabNotes,LabQuality', 'BiochemicalMarkers');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabNotes") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked.">&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="1"  ID="LabDate_1"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="1"  ID="LabTest_1"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="1"  ID="LabResult_1"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="1"  ID="LabUnits_1"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px" RecordId="1"  ID="LabNotes_1"    TABLE="LabTests" Field="LabNotes"   Runat="server" ShowTextEditor="true"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  ID="LabQuality_1"  TABLE="LabTests" FIELD="LabQuality" Runat="server" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="2"  ID="LabDate_2"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="2"  ID="LabTest_2"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="2"  ID="LabResult_2"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="2"  ID="LabUnits_2"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="2"  ID="LabNotes_2"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  ID="LabQuality_2"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="3"  ID="LabDate_3"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="3"  ID="LabTest_3"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="3"  ID="LabResult_3"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="3"  ID="LabUnits_3"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="3"  ID="LabNotes_3"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  ID="LabQuality_3"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="4"  ID="LabDate_4"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="4"  ID="LabTest_4"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="4"  ID="LabResult_4"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="4"  ID="LabUnits_4"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="4"  ID="LabNotes_4"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  ID="LabQuality_4"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="5"  ID="LabDate_5"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="5"  ID="LabTest_5"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="5"  ID="LabResult_5"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="5"  ID="LabUnits_5"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="5"  ID="LabNotes_5"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  ID="LabQuality_5"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="6"  ID="LabDate_6"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="6"  ID="LabTest_6"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="6"  ID="LabResult_6"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="6"  ID="LabUnits_6"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="6"  ID="LabNotes_6"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  ID="LabQuality_6"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="7"  ID="LabDate_7"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="7"  ID="LabTest_7"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="7"  ID="LabResult_7"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="7"  ID="LabUnits_7"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="7"  ID="LabNotes_7"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  ID="LabQuality_7"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="8"  ID="LabDate_8"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="8"  ID="LabTest_8"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="8"  ID="LabResult_8"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="8"  ID="LabUnits_8"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="8"  ID="LabNotes_8"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  ID="LabQuality_8"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="9"  ID="LabDate_9"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="9"  ID="LabTest_9"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="9"  ID="LabResult_9"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="9"  ID="LabUnits_9"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="9"  ID="LabNotes_9"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  ID="LabQuality_9"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" /></td>
  </tr>
  <tr style="display:none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			    <euc:EformHidden   style="width:80px;"  RecordId="10"  ID="LabDate_10"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="10"  ID="LabTest_10"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GTD" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox style="width: 60px;" RecordId="10"  ID="LabResult_10"    TABLE="LabTests" Field="LabResult"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownWidth="55" DropDownHeight="auto" RecordId="10"  ID="LabUnits_10"    TABLE="LabTests" Field="LabUnits"   Runat="server"  />
        </td>
        <td align="center">
                <euc:EformTextBox Width="100px"  RecordId="10"  ID="LabNotes_10"    TABLE="LabTests" Field="LabNotes"  Runat="server" ShowTextEditor="true"/>  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  ID="LabQuality_10"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" /></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherLabTestsHtmlTable');" />
<br/>
<br/>
<br />

<table>
    <tr>
         <td>
            <a name="PreTreatmentSerum" /><asp:Label ID="Label1" runat="server" CssClass="controlBoxTitle" Text="Pre-Treatment Serum(HCGN)"></asp:Label><br/>

            <table width="275" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="Table1">
	        <tr> 
		        <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align:left">Date</td>
		        <td width="20%" class="controlBoxDataGridHeaderFirstCol">Result</td>
		        <td width="25%" class="controlBoxDataGridHeaderFirstCol">Units</td>
		        <td width="15%" class="controlBoxDataGridHeaderFirstCol"></td>
	        </tr>
	        <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
			            <euc:EformTextBox  style="width:80px;"  RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			            <euc:EformHidden   style="width:80px;"  RecordId="11"  ID="LabDate_11"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                <td style="white-space: nowrap;">
                        <euc:EformTextBox  style="display: none;"  RecordId="11"  ID="LabTest_11"     TABLE="LabTests" Field="LabTest"  Runat="server" />
                        <euc:EformTextBox style="width: 60px;" RecordId="11"  ID="LabResult_11"    TABLE="LabTests" Field="LabResult" Runat="server"  />
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"  ID="LabQuality_11"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
                <td align="center" style="white-space:nowrap">
                        <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownHeight="auto" RecordId="11"  ID="LabUnits_11"    TABLE="LabTests" Field="LabUnits"   Runat="server"  /></td>          
                <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" /></td>
            </tr>
            </table>
        </td>
        <td width="20">&nbsp;</td>
        <td>
             <a name="DateOfNormalization" /><asp:Label ID="Label2" runat="server" CssClass="controlBoxTitle" Text="Date of Normalization(HCGN)"></asp:Label><br/>

            <table width="275" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="Table2">
	        <tr> 
		        <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align:left">Date</td>
		        <td width="20%" class="controlBoxDataGridHeaderFirstCol">Result</td>
		        <td width="25%" class="controlBoxDataGridHeaderFirstCol">Units</td>
		        <td width="15%" class="controlBoxDataGridHeaderFirstCol"></td>
	        </tr>
	        <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
			            <euc:EformTextBox  style="width:80px;"  RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True"   />
			            <euc:EformHidden   style="width:80px;"  RecordId="12"  ID="LabDate_12"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                <td style="white-space: nowrap;">
                        <euc:EformTextBox style="display: none;"  RecordId="12"  ID="LabTest_12"     TABLE="LabTests" Field="LabTest"  Runat="server" />
                        <euc:EformTextBox style="width: 60px;" RecordId="12"  ID="LabResult_12"    TABLE="LabTests" Field="LabResult" Runat="server"  />
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  ID="LabQuality_12"  TABLE="LabTests" FIELD="LabQuality"  Runat="server" /></td>
                <td align="center" style="white-space:nowrap">
                        <euc:EformSelect style="width: 55px;" LookupCode="LabUnits" DropDownHeight="auto" RecordId="12"  ID="LabUnits_12"    TABLE="LabTests" Field="LabUnits"   Runat="server"  /></td>          
                <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" /></td>
            </tr>
            </table>
        </td>
    </tr> 
</table>

<br />
<br />
<br />
<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(labDateTextID,labTestID,labResultID,labUnitsID,labNotesID,labQualityID)
    { 
        $(labDateTextID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labUnitsID,labNotesID,labQualityID));
        $(labTestID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labNotesID,labQualityID));
        $(labResultID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labNotesID,labQualityID));
   }
   function addHCGNEvents(labDateTextID,labTestID,labResultID,labUnitsID,labQualityID)
    { 
        $(labDateTextID).addEvent('blur',curry(SetHCGNHiddenFields,labDateTextID,labTestID,labResultID,labUnitsID,labQualityID));
        $(labResultID).addEvent('blur',curry(SetHCGNHiddenFields,labDateTextID,labTestID,labResultID,labQualityID));
   }
   
   

    addEvents($('<%= LabDateText_1.ClientID %>'),$('<%= LabTest_1.ClientID %>'),$('<%= LabResult_1.ClientID %>'),$('<%= LabUnits_1.ClientID %>'),$('<%= LabNotes_1.ClientID %>'),$('<%= LabQuality_1.ClientID %>'));
    addEvents($('<%= LabDateText_2.ClientID %>'),$('<%= LabTest_2.ClientID %>'),$('<%= LabResult_2.ClientID %>'),$('<%= LabUnits_2.ClientID %>'),$('<%= LabNotes_2.ClientID %>'),$('<%= LabQuality_2.ClientID %>'));
    addEvents($('<%= LabDateText_3.ClientID %>'),$('<%= LabTest_3.ClientID %>'),$('<%= LabResult_3.ClientID %>'),$('<%= LabUnits_3.ClientID %>'),$('<%= LabNotes_3.ClientID %>'),$('<%= LabQuality_3.ClientID %>'));
    addEvents($('<%= LabDateText_4.ClientID %>'),$('<%= LabTest_4.ClientID %>'),$('<%= LabResult_4.ClientID %>'),$('<%= LabUnits_4.ClientID %>'),$('<%= LabNotes_4.ClientID %>'),$('<%= LabQuality_4.ClientID %>'));
    addEvents($('<%= LabDateText_5.ClientID %>'),$('<%= LabTest_5.ClientID %>'),$('<%= LabResult_5.ClientID %>'),$('<%= LabUnits_5.ClientID %>'),$('<%= LabNotes_5.ClientID %>'),$('<%= LabQuality_5.ClientID %>'));
    addEvents($('<%= LabDateText_6.ClientID %>'),$('<%= LabTest_6.ClientID %>'),$('<%= LabResult_6.ClientID %>'),$('<%= LabUnits_6.ClientID %>'),$('<%= LabNotes_6.ClientID %>'),$('<%= LabQuality_6.ClientID %>'));
    addEvents($('<%= LabDateText_7.ClientID %>'),$('<%= LabTest_7.ClientID %>'),$('<%= LabResult_7.ClientID %>'),$('<%= LabUnits_7.ClientID %>'),$('<%= LabNotes_7.ClientID %>'),$('<%= LabQuality_7.ClientID %>'));
    addEvents($('<%= LabDateText_8.ClientID %>'),$('<%= LabTest_8.ClientID %>'),$('<%= LabResult_8.ClientID %>'),$('<%= LabUnits_8.ClientID %>'),$('<%= LabNotes_8.ClientID %>'),$('<%= LabQuality_8.ClientID %>'));
    addEvents($('<%= LabDateText_9.ClientID %>'),$('<%= LabTest_9.ClientID %>'),$('<%= LabResult_9.ClientID %>'),$('<%= LabUnits_9.ClientID %>'),$('<%= LabNotes_9.ClientID %>'),$('<%= LabQuality_9.ClientID %>'));
    addEvents($('<%= LabDateText_10.ClientID %>'),$('<%= LabTest_10.ClientID %>'),$('<%= LabResult_10.ClientID %>'),$('<%= LabUnits_10.ClientID %>'),$('<%= LabNotes_10.ClientID %>'),$('<%= LabQuality_10.ClientID %>'));
    addHCGNEvents($('<%= LabDateText_11.ClientID %>'),$('<%= LabTest_11.ClientID %>'),$('<%= LabResult_11.ClientID %>'),$('<%= LabUnits_11.ClientID %>'),$('<%= LabQuality_11.ClientID %>'));
    addHCGNEvents($('<%= LabDateText_12.ClientID %>'),$('<%= LabTest_12.ClientID %>'),$('<%= LabResult_12.ClientID %>'),$('<%= LabUnits_12.ClientID %>'),$('<%= LabQuality_12.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(labDateTextID,labTestID,labResultID,labUnitsID,labNotesID,labQualityID,notesValue)
{
    if (labDateTextID.value != '' || labTestID.value != '' || labResultID.value != ''  || labUnitsID.value != '' )
    {
//        labNotesID.value = notesValue;
        labQualityID.value = 'STD';
    }
    else
    {
//        labNotesID.value = '';    
        labQualityID.value = '';
    }
}

function SetHCGNHiddenFields(labDateTextID,labTestID,labResultID,labUnitsID,labQualityID)
{
    if (labDateTextID.value != '' || labResultID.value != ''  || labUnitsID.value != '' )
    {
        labQualityID.value = 'STD';
        labTestID.value = 'HCGN';
    }
    else
    {
        labQualityID.value = '';
        labTestID.value = '';
    }
}
</script>