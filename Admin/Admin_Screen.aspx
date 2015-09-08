<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Screen.aspx.cs" Inherits="Admin_Admin_Screen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" type="text/css" href="../Styles/Site.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    Online Voting System
                </h1>
            </div>
    <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home"/>
                        <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Register"/>
                        <asp:MenuItem NavigateUrl="~/Admin_Login.aspx" Text="Admin Login"/>
                        <asp:MenuItem NavigateUrl="~/Help.aspx" Text="Help"/>
                        <asp:MenuItem NavigateUrl="~/Election_Detail.aspx" Text="Election detail"/>
                        <asp:MenuItem NavigateUrl="~/DataBase.aspx" Text="db"/>
                        <asp:MenuItem NavigateUrl="~/Add_Candidate.aspx" Text="Add Candidate"/>

                    </Items>
                </asp:Menu>
            </div>
    
    </div>
    </div>
    </div>
    <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
   <div id = "dvGrid" style ="padding:10px;width:550px">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:GridView ID="GridView1" runat="server"  Width = "550px"
AutoGenerateColumns = "false" Font-Names = "Arial"
Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B" 
HeaderStyle-BackColor = "green" AllowPaging ="true"  ShowFooter = "true" 
onrowediting="EditCustomer" OnPageIndexChanging = "OnPaging" 
onrowupdating="UpdateCustomer"  onrowcancelingedit="CancelEdit"

PageSize = "10" >
<Columns>
<asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "CustomerID">
    <ItemTemplate>
        <asp:Label ID="lblCustomerID" runat="server"
        Text='<%# Eval("pid")%>'></asp:Label>
    </ItemTemplate>
    <FooterTemplate>
        <asp:TextBox ID="txtCustomerID" Width = "40px"
            MaxLength = "5" runat="server"></asp:TextBox>
    </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Name">
    <ItemTemplate>
        <asp:Label ID="lblContactName" runat="server"
                Text='<%# Eval("pname")%>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtContactName" runat="server"
            Text='<%# Eval("pname")%>'></asp:TextBox>
    </EditItemTemplate> 
    <FooterTemplate>
        <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
    </FooterTemplate>
</asp:TemplateField>
<asp:TemplateField>
    <ItemTemplate>
          <asp:LinkButton ID="lnkRemove" runat="server"
            CommandArgument = '<%# Eval("pid")%>'
         OnClientClick = "return confirm('Do you want to delete?')"
        Text = "Delete" OnClick = "DeleteCustomer"></asp:LinkButton>
    </ItemTemplate>
    <FooterTemplate>
        <asp:Button ID="btnAdd" runat="server" Text="Add"
            OnClick = "AddNewCustomer" />
    </FooterTemplate>
</asp:TemplateField>
<asp:CommandField  ShowEditButton="True" />
</Columns>
<AlternatingRowStyle BackColor="#C2D69B"  />
</asp:GridView>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID = "GridView1" />
</Triggers>
</asp:UpdatePanel>

</div>
    </form>
</body>
</html>
