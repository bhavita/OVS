<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Candidate.aspx.cs" Inherits="Add_Candidate" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
    <br />
    <asp:Label ID="can_name" runat="server" Text="Candidate Name"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 46px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="This field is required" 
            ForeColor="#FF3300"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="cons_id" runat="server" Text="Consituency ID"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList3" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="cons_name" 
        DataValueField="cons_id" 
         Width="128px">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="DropDownList3" ErrorMessage="This field is required" 
        ForeColor="#FF3300"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="can_desc" runat="server" Text="Candidate Description"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:Label ID="can_qua" runat="server" Text="Candidate Qualification"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 11px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    Party Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList 
        ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" 
        DataTextField="pname" DataValueField="pid" Height="16px" Width="132px">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="DropDownList4" ErrorMessage="This field is required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="Label1" runat="server" Text="Candidate Address"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Width="149px"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label2" runat="server" Text="Birth date"></asp:Label>
    <asp:TextBox ID="TextBox6" runat="server" style="margin-left: 90px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="TextBox6" ErrorMessage="This field is required" 
        ForeColor="#FF3300"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="id" Text="Male" />
&nbsp;&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="id" 
        Text="Female" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBox7" ErrorMessage="Enter valid Email" 
        ForeColor="#FF3300" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</p>
<p>
    <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox8" runat="server" style="margin-left: 0px" 
        Width="121px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="TextBox8" ErrorMessage="This feild is required" 
        ForeColor="#FF3300"></asp:RequiredFieldValidator>
</p>
<p>
    <asp:Button ID="Button1" runat="server" style="margin-left: 145px" 
        Text="Add Candidate" Width="129px" onclick="Button1_Click" />
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [ovs_constituency]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [ovs_party]"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
</p>
<p>
</p>

</asp:Content>

