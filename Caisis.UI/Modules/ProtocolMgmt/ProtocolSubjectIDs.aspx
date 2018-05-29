﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolSubjectIDs.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolSubjectIDs" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Subject IDs</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">
        Browser.ResizeElement({ nodeId: "Overflow", heightOffset: 275 });    
    </script>
    <style type="text/css">
        #ProtocolPatientIdentifiers
        {
            width: 100%;
            margin: 0;
        }
        .dataGrid,
        .dataGridHeader
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 600px; margin: auto; text-align: center;">
        <div id="DataEntryChoices" class="dataEntryNavToggleContainer">
            <div class="dataEntryNavToggle">
                <a href="<%= GetQueryString("ProtocolSubjectIDs.aspx") %>&idType=broad" class="dataEntryButtonGray <%= QueryIdType == "broad"?"active":"" %>">
                    Manage Broad Subject IDs</a> <a href="<%= GetQueryString("ProtocolSubjectIDs.aspx") %>&idType=michigan"
                        class="dataEntryButtonGray <%= QueryIdType == "michigan"?"active":"" %>">Manage
                        Michigan IDs</a> <a href="<%= GetQueryString("ProtocolSubjectIDs.aspx") %>&idType=local"
                            class="dataEntryButtonGray <%= QueryIdType == "local"?"active":"" %>">Manage Local
                            IDs</a>
            </div>
        </div>
        <div id="Overflow" style="overflow: auto; margin: auto; width: 500px; height: 200px;">
            <asp:GridView runat="server" ID="ProtocolPatientIdentifiers" DataKeyNames="PatientId,PatientProtocolId"
                AutoGenerateColumns="false" AutoGenerateDeleteButton="false" ShowDeleteButton="false"
                CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="ItemRow_A"
                AlternatingRowStyle-CssClass="ItemRow_B" Visible="false" GridLines="Horizontal" OnRowDataBound="SetDeleteBtn">
                <Columns>
                    <cic:ExtendedTemplateField HeaderText="Caisis Study Id" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%# Eval("PtProtocolStudyId")%>
                        </ItemTemplate>
                    </cic:ExtendedTemplateField>
                    <cic:ExtendedTemplateField HeaderText="Broad Subject ID">
                        <ItemTemplate>
                            <cic:CaisisHidden runat="server" ID="Broad_Subject_ID_IdentifierId" ShowLabel="false"
                                Table="Identifiers" Field="IdentifierId" Value='<%# Eval("Broad_Subject_ID_IdentifierId") %>'>
                            </cic:CaisisHidden>
                            <cic:CaisisTextBox runat="server" ID="Broad_Subject_ID" ShowLabel="false" Table="Identifiers"
                                Field="Identifier" Value='<%# Eval("Broad_Subject_ID") %>'></cic:CaisisTextBox>
                        </ItemTemplate>
                    </cic:ExtendedTemplateField>
                    <cic:ExtendedTemplateField HeaderText="Michigan Subject ID">
                        <ItemTemplate>
                            <cic:CaisisHidden runat="server" ID="Michigan_Subject_ID_IdentifierId" ShowLabel="false"
                                Table="Identifiers" Field="IdentifierId" Value='<%# Eval("Michigan_Subject_ID_IdentifierId") %>'>
                            </cic:CaisisHidden>
                            <cic:CaisisTextBox runat="server" ID="Michigan_Subject_ID" ShowLabel="false" Table="Identifiers"
                                Field="Identifier" Value='<%# Eval("Michigan_Subject_ID") %>'></cic:CaisisTextBox>
                        </ItemTemplate>
                    </cic:ExtendedTemplateField>
                    <cic:ExtendedTemplateField HeaderText="Local Subject ID">
                        <ItemTemplate>
                            <cic:CaisisHidden runat="server" ID="Local_Subject_ID_IdentifierId" ShowLabel="false"
                                Table="Identifiers" Field="IdentifierId" Value='<%# Eval("Local_Subject_ID_IdentifierId") %>'>
                            </cic:CaisisHidden>
                            <cic:CaisisTextBox runat="server" ID="Local_Subject_ID" ShowLabel="false" Table="Identifiers"
                                Field="Identifier" Value='<%# Eval("Local_Subject_ID") %>'></cic:CaisisTextBox>
                        </ItemTemplate>
                    </cic:ExtendedTemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="DeleteBtn" OnCommand="DeleteIdentifier" OnClientClick="return confirmDelete();" Text="Delete" CssClass="dataEntryButtonRed" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div style="text-align: center;">
        <asp:Button runat="server" ID="UpdateBtn" CssClass="dataEntryButtonRed" Text="Update Identifiers"
            OnClick="UpdateIdentifiers" Visible="false" Style="margin: 5px; width: 250px;" />
    </div>
    </form>
</body>
</html>