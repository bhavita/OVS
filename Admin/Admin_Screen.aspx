<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Screen.aspx.cs" Inherits="Admin_Admin_Screen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div>
    
     <h1>welcome to admin screen</h1>
         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         <asp:Button ID="Button1" runat="server" Text="Logout" visible="false" 
             onclick="Button1_Click"/>
     </div>
</asp:Content>