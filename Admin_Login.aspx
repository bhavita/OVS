<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin_login.aspx.cs" Inherits="Admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    #Password1
    {
        margin-left: 36px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <asp:Label ID="l_admin_username" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="t_admin_username" runat="server" style="margin-left: 22px" 
            Width="149px"></asp:TextBox>
    <br />
</p>
<p>
    <asp:Label ID="l_admin_password" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="t_admin_password" TextMode="password" runat="server" 
        style="margin-left: 24px" Width="149px" ></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:Button ID="Button1" runat="server" style="margin-left: 67px" Text="Login" 
        Width="104px" onclick="Button1_Click" />
</p>
<p>
</p>
<p>
</p>
</asp:Content>

