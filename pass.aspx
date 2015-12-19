<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pass.aspx.cs" Inherits="pass" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head   runat="server">
    <title></title>
    <script src="aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/crv.js"
        type="text/javascript"></script>
    <link href="aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/images/style.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <u>Encrypt</u><br />
<br />
Original Text:
<asp:TextBox ID="txtOriginalText" runat="server" Text="" />
<br />
<br />
Encrypted Text:
<asp:Label ID="lblEncryptedText" runat="server" Text="" />
<br />
<br />
<asp:Button ID="btnEncrypt" OnClick="Encrypt" Text="Encrypt" runat="server" />
<hr />
<u>Decrypt</u>
<br />
<br />
Encrypted Text:
<asp:TextBox ID="txtEncryptedText" runat="server" Text="" />
<br />
<br />
Decrypted Text:
<asp:Label ID="lblDecryptedText" runat="server" Text="" />
<br />
<br />
<asp:Button ID="btnDecrypt" OnClick="Decrypt" Text="Decrypt" runat="server" />
   
    </div>
    <CR:CrystalReportViewer ID="rptviewer"  runat="server" AutoDataBind="True" 
        GroupTreeImagesFolderUrl="" Height="1202px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="1104px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrystalReport13.rpt">
        </Report>
    </CR:CrystalReportSource>
    </form>
</body>
</html>
