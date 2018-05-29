﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Diseases_Edit.aspx.cs"
    Inherits="Caisis.UI.Admin.Diseases_Edit" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Diseases</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        // closes the data entry form and closes modal
        function reloadMainAdmin() {
            window.top.location = window.top.location;
        }
        
        // when closing modal, ensure navigation updated
        function onModalClose() {
            // when closing modal, reload after form update
            if(<%= Page.IsPostBack.ToString().ToLower() %>) {
                reloadMainAdmin();
            }
        }

        /* ]]> */
    </script>

    <style type="text/css">
        .dataGrid
        {
            width: 96%;
            margin: 0px auto 0px auto;
            border-style: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 450px; overflow: auto; overflow-x: none; border: 1px solid #cccccc;">
        <custom:ExtendedGridView runat="server" ID="DiseasesGrid" TableName="Diseases" DataKeyNames="DiseaseId"
            AutoGenerateColumns="false" AutoGenerateDeleteButton="false" CssClass="dataGrid"
            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            GridLines="None" OnRowDataBound="SetDiseaseIsViewRow" OnRowDeleted="RebindOnDelete"
            BlankRows="1" ShowHeader="true">
            <Columns>
                <custom:ExtendedTemplateField HeaderText="Disease" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <cic:CaisisHidden runat="server" ID="DiseaseId" Table="Diseases" Field="DiseaseId" />
                        <cic:CaisisTextBox ID="DiseaseName" runat="server" ShowLabel="false" Table="Diseases"
                            Field="DiseaseName" Width="400"></cic:CaisisTextBox>
                    </ItemTemplate>
                </custom:ExtendedTemplateField>
                <custom:ExtendedTemplateField HeaderText="Is View" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <cic:CaisisHidden runat="server" ID="IsViewAttributeValueId" Table="DiseaseAttributeValues"
                            Field="DiseaseAttributeValueId" />
                        <cic:CaisisCheckBox ID="IsViewAttributeValue" runat="server" ShowLabel="false" Table="DiseaseAttributeValues"
                            Field="DiseaseAttributeValue" />
                    </ItemTemplate>
                </custom:ExtendedTemplateField>
                <custom:GridRowDeleteImage HeaderStyle-BackColor="Transparent" HeaderStyle-ForeColor="#333333" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center">
                </custom:GridRowDeleteImage>
            </Columns>
        </custom:ExtendedGridView>
    </div>
    <asp:Button runat="server" ID="SaveBtn" Text="Update" CssClass="dataEntryButtonGray NavListFooterButton"
        OnClick="UpdateClick" Style="float: right; margin-top: 10px;" />
    </form>
</body>
</html>