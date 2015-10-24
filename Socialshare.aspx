<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Socialshare.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:Button ID="Button1" runat="server" Height="27px" onclick="Button1_Click" 
        Text="Share to the world" Width="219px" />
    OR SCAN THIS QR CODE IN THE MOBILE AND LET YOUR FRIENDS KNOW YOU FUILFILLED THE 
    RESPONSIBILITY<asp:Image ID="Image1" runat="server" Height="111px" 
        ImageUrl="~/img/fbsharevote.png" Width="132px" />   


</asp:Content>

