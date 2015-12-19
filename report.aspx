<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/crv.js"
        type="text/javascript"></script>
    <link href="aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/images/style.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:50%">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
        AutoDataBind="True"  Height="500px" 
        ReportSourceID="CrystalReportSource1" 
        ToolPanelWidth="100%" Width="100%" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrystalReport8.rpt">
        </Report>
    </CR:CrystalReportSource>
    </div>
   
    </form>
</body>
</html>
