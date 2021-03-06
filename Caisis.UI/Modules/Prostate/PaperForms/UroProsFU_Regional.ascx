<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroProsFU_Regional" CodeFile="UroProsFU_Regional.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<asp:PlaceHolder id="SurveyFormHolder" runat="server"></asp:PlaceHolder>


<div id="PaperFormStart">

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U06*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Prostate Follow- Up Patient</span><br>
            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: 
              <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
              <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
              <asp:Repeater ID="ReferringMD" Runat="server" > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName") %>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName") %>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution") %>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label> 
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td height="30" align="left" valign="top" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Chief 
              Complaint</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="170" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top"> <asp:Repeater ID="hpi" Runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="HpiProstatectomies" Runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>
                  </asp:Label>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" />
              
              <asp:Repeater ID="hpiProtocols" Runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %> 
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater>
              
              <asp:Repeater ID="hpiBiopsies" runat="server" > 
                <ItemTemplate> Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName")%>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
              
              
         <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" /> 
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="22%" rowspan="2" valign="top" class="FormInsideTableTopLeftCell"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Nomogram 
              Prediction </span></td>
            <td width="11%" class="FormInsideTableTopCell">&nbsp;PreRP 5:</td>
            <td width="15%" class="FormInsideTableTopCell">&nbsp; <asp:Label ID="preRP5Nomo" Runat="server" /></td>
            <td width="11%" class="FormInsideTableTopCell">&nbsp;PreBrachy:</td>
            <td width="15%" class="FormInsideTableTopCell">&nbsp; 
              <asp:Label ID="preBrachyNomo" Runat="server" /></td>
            <td width="12%" class="FormInsideTableTopCell">&nbsp;Post RP 
              7 Yr:</td>
            <td width="14%" class="FormInsideTableTopCell">&nbsp; <asp:Label ID="postRP7yrNomo" Runat="server" /></td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">&nbsp;PreRP 10:</td>
            <td class="FormInsideTableRegCell">&nbsp; <asp:Label ID="preRP10Nomo" Runat="server" /></td>
            <td class="FormInsideTableRegCell">&nbsp;PreXRT:</td>
            <td class="FormInsideTableRegCell">&nbsp; 
              <asp:Label ID="preXRTNomo" Runat="server" /></td>
            <td class="FormInsideTableRegCell">&nbsp;Post RP 
              10 Yr:</td>
            <td class="FormInsideTableRegCell">&nbsp; <asp:Label ID="postRP10yrNomo" Runat="server" /></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="55%" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Interval 
              History</span><br>
            </td>
            <td width="45%" align="left" valign="top"><span class="blackBoldText">Other 
              Treatments:</span> <span class="smallGrayText"> (CHEMO,GENE,HORM,ORCH,XRT,NONE)</span><br> 
              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td align="center" class="FormInsideTableTopLeftCell">Start 
                    Date</td>
                  <td align="center" class="FormInsideTableTopCell">TX<br> <img src="../../Images/shim.gif" border="0" width="90" height="1"></td>
                  <td align="center" class="FormInsideTableTopCell">Notes (Protocol 
                    #)</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="2" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Late 
              Complications:&nbsp;&nbsp; <input type="checkbox" name="No">
              No&nbsp;&nbsp; <input type="checkbox" name="Yes">
              Yes (specify): 
              <asp:Repeater ID="complications" Runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ROS_DateText") %>
                  <%# DataBinder.Eval(Container.DataItem, "ROS_Result") %>
                </ItemTemplate>
                <SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
          </tr>
          <!-- <tr>
						<td colspan="8" align="left" valign="top">
							<table align="left" border="0" width="70%" cellpadding="0" cellspacing="0" >
								<tr>
									<td valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0">Check Indication:</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+SM</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">BCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+ECE/SVI</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">LCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+LN</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">Mets</td>
								</tr>
							</table>
						</td>
					</tr>-->
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="52%" class="FormInnerRowRightBorder" valign="top"> <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3"><span class="blackBoldText">Medications</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH4" type="checkbox" id="DateLastGnRH4" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="60%" class="FormInsideTableTopCell">Agent</td>
                  <td width="18%" class="FormInsideTableTopCell">Dose</td>
                  <td width="22%" class="FormInsideTableTopCell">Schedule</td>
                </tr>
                <asp:Repeater ID="medications" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height:30px;"> 
                        <%# DataBinder.Eval(Container.DataItem, "Medication") %>
                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedDose") %>
                        &nbsp;</td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %>
                        &nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
            <td width="48%" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">
                    NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="47%" class="FormInsideTableRegCell">Allergen</td>
                  <td width="53%" class="FormInsideTableRegCell">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height:30px;">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td bgcolor="#FFFFFF" class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td height="90" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span  class="blackBoldText">Medical 
              &amp; Surgical History / Comorbidities</span><br/> 
              <img src="../../Images/shim.gif" border="0" width="1" height="14"> 
              <asp:Repeater ID="comorbidities" Runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate>&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td colspan="2" valign="top" class="blackBoldText"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biochemical 
              Markers / Lab Tests</span> </td>
          </tr>
          <tr > 
            <td valign="top" class="FormInnerRowRightBorder"> <table width="100%" border="0" cellpadding="1" cellspacing="0" class="FormInnerRowRightBorder">
                <tr > 
                  <td width="100" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data 
                    Source</td>
                </tr>
                <asp:Repeater ID="labTests" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td height="28" align="center" class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDateText") %>                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabTest") %>
                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabResult") %>
                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
            <td valign="top" class="blackBoldText"><table border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr > 
                  <td width="100" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data 
                    Source</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="28" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized<br>
        </span> <table class="pageWidth" align="center" border="0" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <asp:Repeater ID="images" Runat="server"> 
            <ItemTemplate> 
              <tr > 
                <td height="30" align="center" class="FormInsideTableRegCell">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                </td>
                <td class="FormInsideTableRegCell">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                </td>
                <td class="FormInsideTableRegCell">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                </td>
                <td class="FormInnerRowBottomBorder">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1">U06<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">02</span></td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U06*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Prostate Follow- Up Patient</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Review 
        of Systems</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="PA22" value="Yes">
        RN&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA3" value="Yes">
        PA/NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow3" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending3" value="Yes">
        Attending</span> 
        <table class="pageWidth" align="center" border="0" cellpadding="0" cellspacing="0" >
          <!-- <tr>
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Not<br>
              Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease<br>
              Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="23" align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Wounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="23" align="left" class="FormInsideTableRegCell">Breast 
              Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">CV&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell"> Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Chest 
              Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GI&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Dyspepsia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Obstruction</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="5" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Penile 
              Pain/curvature/length</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="1" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Psych&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro&nbsp;</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Numbness 
              / Tingling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other:<br> 
              <img src="../../Images/shim.gif" border="0" width="0" height="6"></td>
            <td height="23" align="left" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="left" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td colspan="4" class="FormInnerRowBottomBorder"><strong>Prostate QOL Survey</strong></td>
    </tr>
  <tr>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Sexual</td>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Urinary</td>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Bowel</td>
    <td class="blackBoldTextSmall">General</td>
  </tr>
  <tr>
    <td height="35" valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____&nbsp;&nbsp;Q3:____&nbsp;&nbsp;Q4:____&nbsp;Q5:____&nbsp;&nbsp;Q6:____&nbsp;&nbsp;Q7:____<br />
      <!--<asp:Label ID="LastUrinaryQOLScores" Runat="server" />--><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" />
    </span></td>
    <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____&nbsp;&nbsp;Q3:____&nbsp;&nbsp;Q4:____&nbsp;Q5:____</span><br />
      <!--<asp:Label ID="LastSexualQOLScores" CssClass="blackBoldTextSmall"  Runat="server" />--><asp:Label CssClass="blackBoldTextSmall" ID="SexualQOL" Runat="server" /></td>
    <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____</span></td>
    <td valign="top" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____</span></td>
  </tr>
</table>

	  
	  
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="100%" align="center" border="0" cellpadding="2" cellspacing="0" >
          
          <tr> 
            <td width="300" class="FormInsideTableRegCell" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">1.</span>&nbsp;Continence:<img src="../../Images/shim.gif" width="10" height="0"> 
              <input name="textfield4" type="text" class="inputFieldFlat" size="5"><br><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/></td>
            <td align="left" valign="top" rowspan="5"> <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
              <tr> 
                <td><p class="smallGrayText">1 - Continence(no pads)<br>
                  2 - Mild SUI(leaks only during heavy actvty)<br>
                  3 - Moderate SUI(leaks with moderate actvty)<br>
                  4 - Severe SUI<br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(leaks during nl actvty, dry 
                  at night and at rest)<br>
                  5 - Total incont(continuous leakage of urine at rest)</p></td>
                  </tr>
              </table>
                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
                  <tr> 
                    <td height="61" valign="top" nowrap class="smallGrayText">NONE<br>
                      AUS - Sphincter<br>
                      OU - Optical urethrotomy<br>
                    BIO - Biofeedback</td>
                    <td valign="top" nowrap class="smallGrayText">MED - Medications 
                      only<br>
                      DIL - Urethral dilation<br>
                      COL - Collagen injection<br>
                    URO - Urodynamics</td>
                  </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="2"  class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">2.</span>&nbsp;Date 
              Mild Incontinence Achieved (#2): 
              <input name="ContLv2Textbox" id="ContLv2Textbox" runat="server" type="text" class="inputFieldFlat" size="10" /> </td>
            </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">3.</span>&nbsp;Date 
              Total Contin. Achieved (#1): 
              <input name="ContLv1Textbox" id="ContLv1Textbox" runat="server" type="text" class="inputFieldFlat" size="10" /> </td>
            </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">4.</span>&nbsp;TX 
              for Incontinence: 
              <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
            <td align="left" class="FormInsideTableRegCell">Tx Date: <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td ><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">5.</span>&nbsp;TX 
              for Stricture:<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
            <td class="FormInnerRowRightBorder">Tx Date: <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr id="LastIncontTxTableRow" runat="server"> 
            <td class="FormInnerRowRightBorder" colspan="2"><img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <asp:Label ID="LastIncontTx" Runat="server" CssClass="blackBoldTextSmall" /></td>
            <td align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="100%" align="center" border="0" cellpadding="2" cellspacing="0" >
          <tr> 
            <td colspan="2" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Erectile 
              Function</span><br><asp:Label CssClass="FormPopulatedSmallerText" ID="LastPot" Runat="server" />
              <br />
              <span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">6.</span>&nbsp;On PDE-5?
<input type="checkbox" name="Yes2">Yes&nbsp;<input type="checkbox" name="Yes22">No<br>
              </span></td>
            <td rowspan="7" valign="top" class="FormInnerRowRightBorder"><br />
                <br />
                <br />
			  Current Erectile Function Codes <br>
              1-Normal, full erections <br>
              2-Full, but recently diminished <br>
              3-Partial, satis. for intercourse <br>
              4-Partial, unsatis. for intercourse<br>
              5-Impotent</span></td>
            <td width="38%"  rowspan="7" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">13.</span>&nbsp;TX 
              for Erectile Dysfunction (that apply):<br> <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td class="FormInsideTableTopLeftCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <asp:Repeater ID="QolTherapy" runat="server" > 
                  <%--- OnItemDataBound="QolTherapyItemDataBound" ---%>
                  <ItemTemplate> 
                    <tr id="QolTherapyRow" runat="server"> 
                      <td class="FormInsideTableLeftCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_Therapy") %>                      </td>
                      <td class="FormInsideTableRegCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_TxDateText") %>                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_TxStopDateText") %>                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Oral Agents&nbsp;(ex: Viagra)</td>
                  <td class="FormInsideTableRegCell">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                  <td class="FormInnerRowBottomBorder">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Topical Agents</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Vacuum Erection Device</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Intracorp. Injection</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">MUSE</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Penile Prosthesis</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table>			</td>
          </tr>
          <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">7.</span>&nbsp;Current Erectile Function:</td>
            <td align="left" class="FormInsideTableRegCell"><input type="text" name="CurrentErectileFunctionTextbox" runat="server" id="CurrentErectileFunctionTextbox" class="inputFieldFlat" size="10"></td>
          </tr>
		  <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">8.</span>&nbsp;Date 
              #3 Achieved On:</td>
            <td align="left" class="FormInsideTableRegCell"> <input type="text" name="potLv3Textbox" runat="server" id="potLv3Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">9.</span>&nbsp;Date 
              #2 Achieved On:</td>
            <td class="FormInsideTableRegCell"> <input type="text" name="potLv2Textbox" runat="server" id="potLv2Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">10.</span>&nbsp;Date 
              #1 Achieved On: </td>
            <td align="left" class="FormInsideTableRegCell"> <input type="text" name="potLv1Textbox" runat="server" id="potLv1Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">% Best erection w/ PO meds:</td>
            <td align="left" class="FormInsideTableRegCell" nowrap><input type="text" name="textfield242" class="inputFieldFlat" size="10">%</td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">% Best erection, w/o meds:</td>
            <td align="left" class="FormInsideTableRegCell" nowrap><input type="text" name="textfield243" class="inputFieldFlat" size="10">%</td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="44" valign="bottom" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"> 
        <span class="blackBoldText"> PFSH and ROS performed by:  _____________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1">U06<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">02</span></td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U06*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Prostate Follow- Up Patient</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biopsies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="checkbox" name="PA222" value="Yes"><strong>Check if None</strong><br> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Result</td>
            <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
          </tr>
          <tr > 
            <td height="30" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="30" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
        </table>		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
            <td height="32" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="32" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Initial Exam: 
        <input type="checkbox" name="NP2" value="Yes">
        PA / NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0" >
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong><strong></strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Attnd<br>
              Performed</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Vital Signs Verified</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen&nbsp;</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Well Healed Incision</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell"> No Masses or Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell"> No Palpable Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">G/U</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Testes w/o Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell"> No Palpable Penile 
              Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Empty Prostatic Fossa</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">No Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="5" align="left" class="FormInnerRowBottomBorder">
              <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr valign="top">
                  <td><span class="blackBoldText">Rectal 
              Exam</span></td>
                  <td><strong>2002 
              Clinical T Stage: __________</strong></td>
                  <td>&nbsp;</td>
                </tr>
                <tr valign="top"> 
                  <td width="215"> <table width="210" border="0" cellspacing="0" cellpadding="1">
                      <tr align="center"> 
                        <td class="FormInsideTableTopLeftCell">Side</td>
                        <td class="FormInsideTableTopCell">Level</td>
                        <td class="FormInsideTableTopCell">Cancer (1-5)</td>
                        <td class="FormInsideTableTopCell">ECE (1-5)</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                    </table></td>
                  <td> Prostate Weight:<br>
                    _________ g<br> <br>
                    Size of Largest Induration (Length x Width):<br> <img src="../../Images/shim.gif" border="0" width="1" height="18">____cm&nbsp;&nbsp; 
                    x&nbsp;&nbsp; ____cm<br></td>
                  <td><img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="125"></td>
                </tr>
                <tr valign="top"> 
                  <td colspan="3"><strong>CODES</strong><span class="smallGrayText">&nbsp;&nbsp;&nbsp;&nbsp;Cancer: 
                    &nbsp;1. Definitely No Ca&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No Ca&nbsp;&nbsp;&nbsp;&nbsp;3. 
                    Possible Ca&nbsp;&nbsp;&nbsp;&nbsp;4. Probably Ca&nbsp;&nbsp;&nbsp;&nbsp;5. 
                    Definitely Ca<br><img src="../../Images/shim.gif" border="0" width="54" height="1"> 
                    ECE: &nbsp;&nbsp;1. Definitely No Ca&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No Ca&nbsp;&nbsp;&nbsp;&nbsp;3. 
                    Possible Ca&nbsp;&nbsp;&nbsp;&nbsp;4. Probably Ca&nbsp;&nbsp;&nbsp;&nbsp;5. 
                    Definitely Ca</span></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td height="26" align="left" class="FormInsideTableRegCell"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other&nbsp;</td>
            <td height="26" align="left" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td colspan="8" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Disease 
              State</span><img src="../../Images/shim.gif" border="0" width="20" height="1">
              <input type="checkbox" name="NED2">
              Stable<img src="../../Images/shim.gif" border="0" width="20" height="1">
			  <input type="checkbox" name="ActiveSurveillance">
              Active Surveillance<img src="../../Images/shim.gif" border="0" width="20" height="1">
              <input type="checkbox" name="NED">
              NED<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="BCR">
              BCR<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="LCR">
              LCR<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="Mets">
              Mets<img src="../../Images/shim.gif" border="0" width="20" height="1">Date:</td>
          </tr>
        </table>
        <img src="../../Images/shim.gif" border="0" width="105" height="1"> <asp:Label ID="LastStatus" Runat="server" /></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1">U06<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">02</span></td>
    </tr>
  </table>
</div>


<div  id="LastPageInForm" runat="server" align="left" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U06*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Prostate Follow- Up Patient</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr>
            <td align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr>
            <td width="50%" height="40" valign="top" class="FormInsideTableRegCell">1.</td>
            <td width="28%" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" valign="top" class="FormInnerRowBottomBorder"><input type="checkbox" name="GNRH22" value="Yes" />
              Sexual Med Consult<br />
              <input type="checkbox" name="GNRH23" value="Yes" />
              Rad Tx Consult<br />
              <input type="checkbox" name="GNRH24" value="Yes" />
              Med Oncology Consult</td>
          </tr>
          <tr>
            <td height="40" valign="top" class="FormInsideTableRegCell">2.</td>
            <td height="25" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" valign="top" class="FormInsideTableRegCell">4.</td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <!--<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
      </table></td>
      </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr>
            <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="20%" height="26">Prescriptions:</td>
                  <td width="20%" align="left">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr>
                  <td height="26" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="26" colspan="3">Rx: __________________________________________________________</td>
                </tr>
            </table></td>
            <td width="31%" align="center"><span>Protocol #: ________</span> <br />
                <table align="left" width="100%">
                  <tr>
                    <td>Considered:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                  <tr>
                    <td>Consent Obtained:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                  <tr>
                    <td>Registered:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                </table>
              <br />
                <br /></td>
          </tr>
      </table></td>
      </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br> <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)22">
              15-24 (3)&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="25-39 (4)22">
              25-39 (4)&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="40+ (5)22">
              40+ (5)</td>
            <td width="50%" height="100" valign="top"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:<br> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="32" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td rowspan="2" align="right" valign="top">Copy to:</td>
            <td width="43%" rowspan="2" valign="top"><input name="fellow222" type="checkbox" id="fellow223" />
referring M.D.: ________________________<br />
<input name="fellow2222" type="checkbox" id="fellow2222" />
other: _______________________________</td>
          </tr>
          <tr> 
            <td height="32" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr class="pageWidth">
            <td height="40" align="right" valign="bottom" style="padding-bottom: 0px; padding-top: 13px;"><span class="blackBoldText">Attending&nbsp;<br />
              Addendum:</span></td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr class="pageWidth">
            <td>&nbsp;</td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1">U06<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">02</span></td>
    </tr>
  </table>
</div>

</div>