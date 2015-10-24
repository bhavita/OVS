<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


 <asp:Label ID="LAid" runat="server" Text="Aadhar id:"></asp:Label>
            <asp:TextBox ID="aadhar_id" runat="server" style="margin-left: 50px" CssClass="text_size" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
    runat="server" ControlToValidate="aadhar_id" 
    ErrorMessage="RequiredFieldValidator" ValidationGroup="v"></asp:RequiredFieldValidator>
             <br />
             <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="t_pass1" TextMode="password" runat="server" style="margin-left: 50px" CssClass="text_size" ></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="t_pass1" ErrorMessage="RequiredFieldValidator" 
    ValidationGroup="v"></asp:RequiredFieldValidator>
<br />
<br />
<br />
<br />
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" 
    ValidationGroup="v" Width="89px" />
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
    Text="Forget Password" Width="122px" style="margin-left: 57px" />
    <br />
    <br />
    If you are new user..<asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="Default.aspx">Register</asp:LinkButton>
<br />
<br />

</asp:Content>

