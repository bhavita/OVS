<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add_Candidate.aspx.cs" Inherits="Add_Candidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <p>
    <br />
    <asp:Label ID="can_name" runat="server" Text="Candidate Name"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 46px"></asp:TextBox>
</p>
<p>
    <asp:Label ID="cons_id" runat="server" Text="Consituency ID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" Width="125px">
        <asp:ListItem Enabled="False">Baroda</asp:ListItem>
        <asp:ListItem>Surat</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    <asp:Label ID="can_desc" runat="server" Text="Candidate Description"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="can_qua" runat="server" Text="Candidate Qualification"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 11px"></asp:TextBox>
</p>
<p>
    Party Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" Width="125px">
        <asp:ListItem>Bjp</asp:ListItem>
        <asp:ListItem>Congress</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    <asp:Label ID="Label1" runat="server" Text="Candidate Address"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox5" runat="server" Height="68px"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label2" runat="server" Text="Birth date"></asp:Label>
    <asp:TextBox ID="TextBox6" runat="server" style="margin-left: 90px"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
        style="margin-left: 147px">
        <asp:ListItem>male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>
</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Button ID="Button1" runat="server" style="margin-left: 145px" 
        Text="Add Candidate" Width="129px" />
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
</p>
<p>
</p>

</asp:Content>

