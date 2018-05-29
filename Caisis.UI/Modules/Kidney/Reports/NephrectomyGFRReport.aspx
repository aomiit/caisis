<%@ Page Language="C#" EnableViewState="true" AutoEventWireup="true" CodeFile="NephrectomyGFRReport.aspx.cs"  Debug="true" 
    Inherits="Caisis.UI.Modules.Kidney.Reports.NephrectomyGFRReport" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nephrectomy GFR Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    var imgDir = '<%= Page.ResolveUrl("~/Images/Calendar/") %>';
    var seconds = 0;
    function showLoading()
    {
        var loadingLayer = $('LoadingLayer');
        loadingLayer.show('');
        loadingLayer.center();
        showLoadingBar();
        setInterval(showLoadingBar,1000);
    }
    
    function showLoadingBar()
    {
        var loadingLayerText = $('LoadingTextLayer');
        var loadingText = 'Loading ... ' + seconds + ' Seconds';
        loadingLayerText.innerHTML = loadingText; 
        seconds++;
    }
    
    function setTodayOnBlur(field)
    {
         if(field.value.replace(' ','')=='') { field.value = '<%= DateTime.Today.ToShortDateString() %>'; }
    }
    </script>

    <style type="text/css">
    a  { color: #ffffff; }
    a:visited { color: #ffffff; }
    a:active { color: #ffffff; }
    
    #LoadingLayer
    {
        text-align: center; 
        width: 250px; 
        height: auto;
        margin: auto;
        background-color: #004256;
        color: #ffffff;
        border: 2px solid #cccccc;
        font-size: 14px; 
        font-weight: bold;
        position: absolute;
        padding: 5px;
    }
    #ReportCount
    {
        display: block;
        font-weight: bold;
        font-size: 14px;
    }
    #UserText
    {
        display: block;
        text-align: left;
        font-weight: bold;
    }
    </style>
</head>
<body class="reportContentBody">

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <form id="form1" runat="server">
        <span id="LoadingLayer" style="display: none;"><span id="LoadingTextLayer"></span></span>
        <span class="SectionTitle">Nephrectomy Date Range</span>
        <table style="table-layout: fixed; width: 95%; margin: auto;">
            <tr>
                <td>Beginning</td>
                <td>Ending</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><cic:CaisisTextBox runat="server" ID="StartDateField" onblur="setTodayOnBlur(this);" ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox></td>
                <td><cic:CaisisTextBox runat="server" ID="EndDateField" onblur="setTodayOnBlur(this);" ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox></td>
                <td>
                    <asp:ImageButton runat="server" ID="RunReportBtn" ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" OnClientClick="showLoading();" />
                    <excel:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExportToExcelClick" />
                </td>
            </tr>
        </table>
        <asp:Label runat="server" ID="UserText"></asp:Label>
        <asp:GridView runat="server" CellPadding="3" ID="ReportGrid" CssClass="dataGrid"
            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" RowStyle-Wrap="false"
            AlternatingRowStyle-Wrap="false" AlternatingRowStyle-CssClass="dataGridItemRowA"
            OnSorting="HandleSorting" AutoGenerateColumns="false" AllowSorting="true">
            <Columns>
                <asp:BoundField DataField="PtMRN" HeaderText="MRN" SortExpression="PtMRN" />
                <asp:TemplateField SortExpression="ProcDate" HeaderText="Procedure Date">
                    <ItemTemplate>
                        <%# ((DateTime)Eval("ProcDate")).ToShortDateString()%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProcName" HeaderText="Procedure" SortExpression="ProcName" />
                <asp:TemplateField SortExpression="LabDate" HeaderText="Lab Date">
                    <ItemTemplate>
                        <%# (Eval("LabDate").ToString().Length > 0) ? ((DateTime)Eval("LabDate")).ToShortDateString() : "" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LabResult" HeaderText="CREAT" SortExpression="LabResult" />
                <asp:BoundField DataField="GFR" HeaderText="GFR" SortExpression="GFR" />
                <asp:BoundField DataField="GFRError" HeaderText="GFRError" SortExpression="GFRError" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
