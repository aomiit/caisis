<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricLaparoscopy4" CodeFile="GastricLaparoscopy4.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
#GastricLap4SiteTd td
{
	padding: 0px 10px 0px 0px;
}
.gastricPathTable
{
    border: solid 1px #cccccc; 
    margin: 10px 0px 15px 16px;
    background-color: #efefef;
    width: 90%;

}
.gastricPathTable td
{
    padding: 5px 5px 5px 5px;
}
</style>


<a name="GastricLaparoscopy4" id="GastricLaparoscopy4" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Laparoscopy 4"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="GastricLaparoscopy4YesNoContainer"><strong>Laparoscopy 4 Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="Laparoscopy4Performed" id="Laparoscopy4Performed" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricLaparoscopy4Details" style="display: none;">
 <td style="padding: 15px 0px 0px 0px; border-top: solid 1px #cccccc;"   onclick="copyGastricLaparoscopy4ProcData();" >
 
 <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">OR &amp; Procedure Details</span>
 
 <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
     <tr >
       <td style="vertical-align: top;">
	   <div style="width: 400px; float: right;">
<strong>Case Surgeon</strong> <euc:EformComboBox ShowLabel="false" Width="280" DropDownWidth="300" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="OpCaseSurgeon_16" Table="OperatingRoomDetails" RecordId="16" Field="OpCaseSurgeon" runat="server" />
	        <euc:EformTextBox style="display: none;" RecordId="16" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_16" Runat="server"  />		
        </div>
	   <div style="width: 250px; float: left;">
	   <strong>Surgery Date</strong>
	   <euc:EformTextBox RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_16" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="copyGastricLaparoscopy4ProcData()" />
	        <euc:EformHidden  RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_16" Runat="server" />		
	        <euc:EformTextBox style="display: none;" RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_16" Runat="server"  />		
			<euc:EformTextBox style="display: none;" RecordId="16" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_16" Runat="server"  />
			<euc:EformTextBox style="display: none;" RecordId="16" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_16" Runat="server"  />
	        <euc:EformTextBox style="display: none;" RecordId="16" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_16" Runat="server"  />		

        </div>
	   </td>
      </tr>
      <tr><td>
      
      	   
      
           
	   <strong>Institution</strong>
	  		<euc:EFormComboBox RecordId="16" Table="Procedures" Field="ProcInstitution" id="ProcInstitution_16" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" Uncheckable="true"  />
	        <euc:EformTextBox style="display: none;" RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpInstitution" ID="OpInstitution_16" Runat="server"  />		
 			</td>
      </tr>
      <tr><td>
      	   	   <strong>Service</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList Table="OperatingRoomDetails" Field="OpService" id="OpService_16" runat="server" 
	            RepeatLayout="Flow" ShowOther="true" RecordId="16" RepeatDirection="Horizontal" >
		            <asp:ListItem >GMT</asp:ListItem>
		            <asp:ListItem >Thoracic</asp:ListItem>
		            <asp:ListItem >Hepatopancreatobilliary</asp:ListItem>
		        </euc:EformRadioButtonList>
		        
			<euc:EformTextBox style="display: none;" RecordId="16" TABLE="Procedures" FIELD="ProcService" ID="ProcService_16" Runat="server"  />
		        
      </td></tr>
      <tr >
       <td style="vertical-align: top;">

<strong>Admit Date</strong>
	   <euc:EformTextBox RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpAdmitDateText" ID="OpAdmitDateText_16" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpAdmitDate" ID="OpAdmitDate_16" Runat="server" />	
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Discharge Date</strong> 
	   <euc:EformTextBox RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ID="OpDischargeDateText_16" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpDischargeDate" ID="OpDischargeDate_16" Runat="server" />		

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Operating Time</strong> (min)
	   <euc:EformTextBox RecordId="16" TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_16" Runat="server" Width="40px" ShowNumberPad="true"  />

	   	
        </td></tr>
        
          <tr>
            <td>
	           <strong>Indication</strong>
	  		        <euc:EFormSelect RecordId="16" Table="Procedures" Field="ProcIndication" id="ProcIndication_16" runat="server" LookupCode="Indication,Disease,Gastric" DropDownWidth="140" DropDownHeight="auto" style="width: 140px;"  />
 			
	           <strong style="margin-left: 50px;">Approach</strong>
	  		        <euc:EFormComboBox RecordId="16" Table="Procedures" Field="ProcApproach" id="ProcApproach_16" runat="server" LookupCode="OpApproach" DropDownWidth="250" style="width: 250px;"  />
 			
 			</td>
        </tr>
        
      <tr><td>
      	   	   <strong>Procedure</strong>&nbsp;&nbsp;
                <euc:EFormComboBox RecordId="16" Table="Procedures" Field="ProcName" id="ProcName_16" runat="server" Width="300" DropDownWidth="300" LookupCode="ProcName,Disease,Gastric" />

<%--                <euc:EformRadioButtonList Table="Procedures" Field="ProcName" id="ProcName_16" runat="server" 
	            RepeatLayout="Flow" ShowOther="true" RecordId="16" RepeatDirection="Horizontal" >
		            <asp:ListItem >Laparoscopy w/ LUS</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ No LUS</asp:ListItem>
		        </euc:EformRadioButtonList>
--%>      </td></tr>
      
      <tr >
       <td style="vertical-align: top;">
       
       	   
	   </td>
      </tr>
	  <tr>
	  	<td id="GastricLap3SiteTd">
		<strong >Site</strong>
		<euc:EFormComboBox Table="Procedures" Field="ProcSite" RecordId="16" id="ProcSite_16" LookupCode="BxSite" runat="server" />

		<strong style="margin-left: 50px;">Subsite</strong>
		<euc:EFormComboBox Table="Procedures" Field="ProcSubsite" RecordId="16" id="ProcSubsite_16" LookupCode="BxSubSite" runat="server">
		</euc:EFormComboBox>
		
	  <%-- <euc:EformRadioButtonList Table="Procedures" Field="ProcSubsite" id="ProcSubsite_16" runat="server" 
	    RepeatLayout="Table" RecordId="16" RepeatDirection="Vertical" RepeatColumns="5" >
		    <asp:ListItem >Antrum/Pylorus</asp:ListItem>
			<asp:ListItem >Body/Middle 1/3</asp:ListItem>
		    <asp:ListItem >Whole Stomach</asp:ListItem>
			<asp:ListItem >Proximal/Upper 1/3</asp:ListItem>
			<asp:ListItem >GE Junction</asp:ListItem>
			<asp:ListItem >Fundus/Upper 1/3</asp:ListItem>
			<asp:ListItem >Cardia</asp:ListItem>
			<asp:ListItem >Anastomosis</asp:ListItem>
			<asp:ListItem >Remnant</asp:ListItem>
		</euc:EformRadioButtonList>--%>
		</td>
	  </tr>

 </table>
  
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Gastrectomy Details</span>
  
 <table border="0" cellspacing="0" id="resectionDetailsTable"> 
    <tr >
        <td style="font-weight: bold;">Residual Tumor</td>
       <td>
            <euc:EformRadioButtonList Table="GastricProc" Field="ProcResidualTumor" id="ProcResidualTumor_16" runat="server" 
	            RepeatLayout="Table" ShowOther="true" RecordId="16"  RepeatDirection="Horizontal"  >
		            <asp:ListItem >Stomach</asp:ListItem>
		            <asp:ListItem >Nodes</asp:ListItem>
		            <asp:ListItem >Peritoneum</asp:ListItem>
		            <asp:ListItem >None</asp:ListItem>
		        </euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Intent</td>
       <td >
       <euc:EformSelect Table="GastricProc" Field="ProcIntent" id="ProcIntent_16" runat="server" 
	            RecordId="16"  LookupCode="ProcIntent" style="width: 90px;" DropDownHeight="auto" DropDownWidth="200" />
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Complete Resection</td>
       <td >
       <euc:EformSelect Table="GastricProc" Field="ProcCompleteResection" id="ProcCompleteResection_16" runat="server" 
	            RecordId="16"  LookupCode="GastricResection" style="width: 60px;" DropDownHeight="auto" DropDownWidth="200" ></euc:EformSelect>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Proximal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcProximalMarginFrozen" id="ProcProximalMarginFrozen_16" runat="server" 
	            RepeatLayout="Table"  RecordId="16"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Distal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDistalMarginFrozen" id="ProcDistalMarginFrozen_16" runat="server" 
	            RepeatLayout="Table"  RecordId="16"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Deep Frozen Margins </td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDeepOtherMarginFrozen" id="ProcDeepOtherMarginFrozen_16" runat="server" 
	            RepeatLayout="Table"  RecordId="16"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Addtional Margin</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcAddMargin" id="ProcAddMargin_16" runat="server" 
	            RepeatLayout="Table"  RecordId="16"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">IntraOp Ultrasound</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcIntraOpUS" id="ProcIntraOpUS_16" runat="server" 
	            RepeatLayout="Table"  RecordId="16"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>
</table>


 
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Clinical Staging (UICC 2010)</span>
  
<%--  <euc:EformTextBox style="display: none;" RecordId="16" TABLE="GastricProc" FIELD="ProcIntent" ID="ProcIntent_16" Runat="server"  />
  <euc:EformTextBox style="display: none;" RecordId="16" TABLE="GastricProc" FIELD="ProcCompleteResection" ID="ProcCompleteResection_16" Runat="server"  />
--%>  <euc:EformTextBox style="display: none;" RecordId="16" TABLE="GastricProc" FIELD="ProcStageSystem" ID="ProcStageSystem_16" Runat="server"  />
<%--  <euc:EformTextBox style="display: none;" RecordId="16" TABLE="NodeProc" FIELD="ProcDissectionExtent" ID="ProcDissectionExtent_16" Runat="server"  />
--%> <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
     <%-- <tr >
       <td style="vertical-align: top;">
       <strong>Staging System</strong>&nbsp;&nbsp;
       	 <euc:EFormComboBox RecordId="16" Table="GastricProc" Field="ProcStageSystem" id="ProcStageSystem_16" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="90" DropDownWidth="260" DropDownHeight="auto" LookupCode="StagingSystem"  />
       </td>
     </tr>--%>
     <tr >
       <td style="vertical-align: top;">
       <strong>T Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="16" Table="GastricProc" Field="ProcStageT" id="ProcStageT_16" runat="server" 
	    style="width: 40px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_T"  />
       
       <strong style="margin-left: 50px;">N Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="16" Table="GastricProc" Field="ProcStageN" id="ProcStageN_16" runat="server" 
	     style="width: 40px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_N"  />
       
       <strong style="margin-left: 50px;">M Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="16" Table="GastricProc" Field="ProcStageM" id="ProcStageM_16" runat="server" 
	    style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_M"  />
       
       </td>
     </tr>
</table>


  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Pathology Details</span>
  
 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Cytology</span>
      		<euc:EformTextBox style="display: none;" ParentRecordId="16" RecordId="1" TABLE="Pathology"  FIELD="PathSpecimenType" ID="PathSpecimenType_1" Runat="server"  />
      		<euc:EformTextBox style="display: none;" ParentRecordId="16" RecordId="1" TABLE="Pathology"  FIELD="PathHistology" ID="PathHistology_1" Runat="server"  />		

      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="16" RecordId="1" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_1" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        <euc:EformHidden  ParentRecordId="16" RecordId="1" TABLE="Pathology" FIELD="PathDate" ID="PathDate_1" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="16" RecordId="1" TABLE="Pathology" FIELD="PathNum" ID="PathNum_1" Runat="server" Width="80px" ShowNumberPad="true"  AppendToOnChange="setGastricLap4PathSpecimenTypes()" />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" onmouseout="setLap4ClinStageMBasedOnCytologyResult();">
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="16" RecordId="1" Table="Pathology" Field="PathResult" id="PathResult_1" runat="server" 
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="16" RecordId="1" Table="Pathology" Field="PathInstitution" id="PathInstitution_1" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="16" RecordId="1" id="PathSite_1" LookupCode="BxSite" runat="server" />

		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="16" RecordId="1" id="PathSubsite_1" LookupCode="BxSubSite" runat="server">
		    </euc:EFormComboBox>
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="16" RecordId="1" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_1" style="width: 35px;"/>
       </td>
     </tr>
<%--     <tr >
       <td style="vertical-align: top;">
	            <strong >2010 Peritoneal Cytology Staging</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="16" Table="PathologyStageGrade" Field="PathStageT" id="PathStageT_16" runat="server" 
	    style="width: 40px;" DropDownWidth="450" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_T"  />
       </td>
     </tr>
--%></table>
 
 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Biopsy</span>
      		<euc:EformTextBox style="display: none;" ParentRecordId="16" RecordId="2" TABLE="Pathology"  FIELD="PathSpecimenType" ID="PathSpecimenType_2" Runat="server"  />

      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="16" RecordId="2" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_2" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        <euc:EformHidden  ParentRecordId="16" RecordId="2" TABLE="Pathology" FIELD="PathDate" ID="PathDate_2" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="16" RecordId="2" TABLE="Pathology" FIELD="PathNum" ID="PathNum_2" Runat="server" Width="80px" ShowNumberPad="true"  AppendToOnChange="setGastricLap4PathSpecimenTypes()" />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="16" RecordId="2" Table="Pathology" Field="PathResult" id="PathResult_2" runat="server" 
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="16" RecordId="2" Table="Pathology" Field="PathInstitution" id="PathInstitution_2" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="16" RecordId="2" id="PathSite_2" LookupCode="BxSite" runat="server" />
		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="16" RecordId="2" id="PathSubsite_2" LookupCode="BxSubSite" runat="server" />
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="16" RecordId="2" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_2" style="width: 35px;"/>
       </td>
     </tr>
</table>

 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Brushing</span>
      		<euc:EformTextBox style="display: none;" ParentRecordId="16" RecordId="3" TABLE="Pathology"  FIELD="PathSpecimenType" ID="PathSpecimenType_3" Runat="server"  />
      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="16" RecordId="3" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_3" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        <euc:EformHidden  ParentRecordId="16" RecordId="3" TABLE="Pathology" FIELD="PathDate" ID="PathDate_3" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="16" RecordId="3" TABLE="Pathology" FIELD="PathNum" ID="PathNum_3" Runat="server" Width="80px" ShowNumberPad="true"  AppendToOnChange="setGastricLap4PathSpecimenTypes()" />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="16" RecordId="3" Table="Pathology" Field="PathResult" id="PathResult_3" runat="server" 
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric" AppendToOnChange="setGastricLap4PathSpecimenTypes()" />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="16" RecordId="3" Table="Pathology" Field="PathInstitution" id="PathInstitution_3" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="16" RecordId="3" id="PathSite_3" LookupCode="BxSite" runat="server" />
		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="16" RecordId="3" id="PathSubsite_3" LookupCode="BxSubSite" runat="server" />
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="16" RecordId="3" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_3" style="width: 35px;"/>
       </td>
     </tr>
</table>
 </td>
 </tr>
</table>
<br/><br/>

<script type="text/javascript">
function GastricLaparoscopy4AttachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('GastricLaparoscopy4YesNoContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideGastricLaparoscopy4(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricLaparoscopy4Details.style.display = 'block';
	
}
GastricLaparoscopy4AttachShowHideScriptsAndSetInitialDisplay();

function showHideGastricLaparoscopy4(theRadio)
{
	var GastricLaparoscopy4Details = document.getElementById('GastricLaparoscopy4Details');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricLaparoscopy4Details.style.display = 'block';
		$('<% = OpQuality_16.ClientID %>').value = 'STD';
		$('<% = ProcQuality_16.ClientID %>').value = 'STD';
		$('<% = ProcSite_16.ClientID %>').value = 'Stomach';
//		$('<% = ProcIntent_16.ClientID %>').value = 'Diagnostic';
		$('<% = ProcCompleteResection_16.ClientID %>').value = 'R3';
		$('<% = ProcStageSystem_16.ClientID %>').value = 'UICC_10';
//		$('ProcDissectionExtent_16.ClientID').value = 'N/A';
		$('<% = ProcIndication_16.ClientID %>').value = 'Diagnostic';
		
		
		
		if ($('<% = ProcInstitution_16.ClientID %>').value.length < 1) $('<% = ProcInstitution_16.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
		if ($('<% = OpInstitution_16.ClientID %>').value.length < 1) $('<% = OpInstitution_16.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
	}
	else
	{
		GastricLaparoscopy4Details.style.display = 'none';
		clearAllElementsContainedInNode(GastricLaparoscopy4Details);
	}

}

function copyGastricLaparoscopy4ProcData()
{
	var OpDateTextField = $('<% = OpDateText_16.ClientID %>');
	var OpDateField = $('<% = OpDate_16.ClientID %>');
	var ProcDateTextField = $('<% = ProcDateText_16.ClientID %>');
	var ProcDateField = $('<% = ProcDate_16.ClientID %>');
	ProcDateTextField.value = OpDateTextField.value;
	ProcDateField.value = OpDateField.value;
	
	//var ProcServiceField = $('<% = ProcService_16.ClientID %>');
	//var OpServiceField = $('<% = OpService_16.ClientID %>');
	//OpServiceField.value = ProcServiceField.value;
	
    var ProcInstitutionField = $('<% = ProcInstitution_16.ClientID %>');
    var OpInstitutionField = $('<% = OpInstitution_16.ClientID %>');
	OpInstitutionField.value = ProcInstitutionField.value;
	
    var ProcSurgeonField = $('<% = ProcSurgeon_16.ClientID %>');
    var OpSurgeonField = $('<% = OpCaseSurgeon_16.ClientID %>');
	ProcSurgeonField.value = OpSurgeonField.value;
}

function setGastricLap4PathSpecimenTypes()
{
    if ($('<% = PathDateText_1.ClientID %>').value != '' || $('<% = PathNum_1.ClientID %>').value != '' || $('<% = PathResult_1.ClientID %>').value != '')
    {
        $('<% = PathSpecimenType_1.ClientID %>').value = 'Cytology';
        $('<% = PathSite_1.ClientID %>').value = 'Stomach';
        $('<% = PathSubsite_1.ClientID %>').value = 'Peritoneum';
        $('<% = PathHistology_1.ClientID %>').value = 'Adenocarcinoma';
        if ($('<% = PathInstitution_1.ClientID %>').value == '') $('<% = PathInstitution_1.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
        if ($('<% = PathQuality_1.ClientID %>').value == '') $('<% = PathQuality_1.ClientID %>').value = 'STD';
    }
    else
    {
        $('<% = PathSpecimenType_1.ClientID %>').value = '';
        $('<% = PathSite_1.ClientID %>').value = '';
        $('<% = PathSubsite_1.ClientID %>').value = '';
        $('<% = PathHistology_1.ClientID %>').value = '';
    }
    
    if ($('<% = PathDateText_2.ClientID %>').value != '' || $('<% = PathNum_2.ClientID %>').value != '' || $('<% = PathResult_2.ClientID %>').value != '')
    {
        $('<% = PathSpecimenType_2.ClientID %>').value = 'Biopsy';
        $('<% = PathSite_2.ClientID %>').value = 'Stomach';
        if ($('<% = PathInstitution_2.ClientID %>').value == '') $('<% = PathInstitution_2.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
        if ($('<% = PathQuality_2.ClientID %>').value == '') $('<% = PathQuality_2.ClientID %>').value = 'STD';
    }
    else
    {
        $('<% = PathSpecimenType_2.ClientID %>').value = '';
        $('<% = PathSite_2.ClientID %>').value = '';
    }
    
    if ($('<% = PathDateText_3.ClientID %>').value != '' || $('<% = PathNum_3.ClientID %>').value != '' || $('<% = PathResult_3.ClientID %>').value != '')
    {
        $('<% = PathSpecimenType_3.ClientID %>').value = 'Brushing';
        $('<% = PathSite_3.ClientID %>').value = 'Stomach';
        if ($('<% = PathInstitution_3.ClientID %>').value == '') $('<% = PathInstitution_3.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
        if ($('<% = PathQuality_3.ClientID %>').value == '') $('<% = PathQuality_3.ClientID %>').value = 'STD';
    }
    else
    {
        $('<% = PathSpecimenType_3.ClientID %>').value = '';
        $('<% = PathSite_3.ClientID %>').value = '';
    }
}

function setLap4ClinStageMBasedOnCytologyResult()
{
        if ($('<% = PathResult_1.ClientID %>').value.indexOf('Positive') > -1)
        {
            
            $('<% = ProcStageM_16.ClientID %>').value = 'M1';
        }
}

</script>