<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Demographics2" CodeFile="Demographics2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
	tableArray.DemographicsHtmlTable = "DemographicsHtmlTable";
</script>

<a name="Demographics2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>


<br />
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >
    
      <tr id="DemographicsxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The demographics recorded for this patient has been populated below.  Click to edit.</td>            
    </tr>    


  <asp:Repeater ID="PtDemoGx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; "  align="left"  class="controlBoxDataGridTitleColumn"  width="250px">&nbsp;MRN&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;First&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Gender&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtMRN,PtGender,PtBirthDateText,PtRace,PtFirstName,PtLastName,PtCountry,PtBirthPlace,PtLanguage', 'Patients');"> 
			<td id="rptr_PtMRN" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtMRN")%>&nbsp;</td>
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtFirstName")%>&nbsp;</td>
			<td id="rptr_PtLastName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtLastName")%>&nbsp;</td>
			<td id="rptr_PtGender" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtGender")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <asp:Repeater ID="PtDemoGx2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Birth Date&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Birth Place&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Race&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Language&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtMRN,PtGender,PtBirthDateText,PtRace,PtFirstName,PtLastName,PtCountry,PtBirthPlace,PtLanguage', 'Patients');"> 
			<td id="rptr_PtBirthDateText" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtBirthDateText")%>&nbsp;</td>
			<td id="rptr_PtTitle" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtBirthPlace")%>&nbsp;</td>  
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtRace")%>&nbsp;</td>
			<td id="rptr_PtSuffix" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtLanguage")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
 	
  </table>

<br/><br /><br />

 