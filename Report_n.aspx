<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_n.aspx.cs" Inherits="Report_n" %>

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
    <div>
        <table style="width: 50%;">
            <tr>
                <td>
                    1st
                </td>
                <td>
                    2nd
                </td>
            </tr>
            <tr>
                <td width="50%">
                    <asp:Panel ID="Panel5" runat="server" Width="50%" Height="50%">
                        <CR:CrystalReportViewer ID="CrystalReportViewer4" runat="server" 
                            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
                            ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
                            ToolPanelWidth="200px" Width="1104px" />
                        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                            <Report FileName="Can_cons_vise.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </asp:Panel>
                </td>
                <td width="50%">
                    &nbsp;<asp:Panel ID="Panel2" runat="server" Width="50%" Height="50%">
                        <CR:CrystalReportViewer ID="CrystalReportViewer3" runat="server" 
                            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
                            ReportSourceID="CrystalReportSource2" ToolbarImagesFolderUrl="" 
                            ToolPanelWidth="200px" Width="1104px" />
                        <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
                            <Report FileName="genderwise.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </asp:Panel>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    3rd
                </td>
                <td>
                    4th
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    
                    <asp:Panel ID="Panel3" runat="server" Width="50%" Height="50%">
                       <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
                            ReportSourceID="CrystalReportSource3" ToolbarImagesFolderUrl="" 
                            ToolPanelWidth="200px" Width="1104px"></CR:CrystalReportViewer>
                        <CR:CrystalReportSource ID="CrystalReportSource3" runat="server">
                            <Report FileName="Count_of_cid_per_cons.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                    <asp:Panel ID="Panel4" runat="server" Width="50%" Height="50%">
                        <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" 
                            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
                            ReportSourceID="CrystalReportSource4" ToolbarImagesFolderUrl="" 
                            ToolPanelWidth="200px" Width="1104px" />
                        <CR:CrystalReportSource ID="CrystalReportSource4" runat="server">
                            <Report FileName="Count_of_party_per_cons.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
