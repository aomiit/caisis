﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolOverviewReport.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolOverviewReport" %>

<%@ Register TagPrefix="report" TagName="ProtocolDetails" Src="~/Modules/ProtocolMgmt/Reports/ProtocolDetails.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Report: Protocol Overview</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheets/ProtocolReportStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <report:ProtocolDetails runat="server" ID="details"></report:ProtocolDetails>
    <p runat="server" id="ErrorText" class="boldText" style="text-align: center;" visible="false">
        Please select a report</p>
    </form>
</body>
</html>
