<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="feedback_contactus.aspx.cs" Inherits="Default5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Email-Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="t_email" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Comments"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="t_comment" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit Feedback" 
                        onclick="Button1_Click" />
                </td>
            </tr>
        </table>
        <br /><br />
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" style="margin-left:30%">
    <p>
    Contact Us : adharvotingsystem@gmail.com
    </p>
    <p>
    Devloped By:

    <p>-Bhavita Lalwani : +91-9033641982 </p>
    <p>-Riddhi Soni     : +91-9408344793</p>
    </p>

    </asp:Panel>

</asp:Content>

