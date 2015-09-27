<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Add_Candidate.aspx.cs" Inherits="Add_Candidate" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <font style="align: center" size="40px">CANDIDATE </font>
    <table id="Table1" runat="server">
        <tr>
            <td class="style1">
                <asp:Label ID="can_name" runat="server" Text="Candidate Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="cons_id" runat="server" Text="Consituency Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="cons_name" DataValueField="cons_id" CssClass="text_size" Height="25px"
                    Width="200px" AppendDataBoundItems="true">
                    <asp:ListItem Text="select constituency" Value="" />
                </asp:DropDownList>
            </td>
            <td class="style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList3"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="can_desc" runat="server" Text="Candidate Description" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="can_qua" runat="server" Text="Candidate Qualification" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Labe10" runat="server" Text="Party-Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="pname" DataValueField="pid" Height="25px" Width="199px" CssClass="text_size"
                    AppendDataBoundItems="true">
                    <asp:ListItem Text="select party" Value="" />
                </asp:DropDownList>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList4"
                    ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                <asp:Label ID="Label1" runat="server" Text="Candidate Address" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style14">
                <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Width="199px" CssClass="text_size"
                    Height="54px"></asp:TextBox>
            </td>
            <td class="style15">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Label3" runat="server" Text="Email" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="TextBox7" runat="server" Width="200px" CssClass="text_size"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7"
                    ErrorMessage="Enter valid Email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7"
                    ErrorMessage="This Feild is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Label5" runat="server" Text="Phone Number" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <br />
                <asp:TextBox ID="TextBox8" runat="server" CssClass="text_size" Width="202px"></asp:TextBox>
            </td>
            <td class="style12">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox8"
                    ErrorMessage="Enter Valid Phone no" ForeColor="#FF3300" ValidationExpression="(D-)?\d{10}"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8"
                    ErrorMessage="This feild is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<tr>
         <td>
    <asp:Label ID="Label6" runat="server" Text="Insert Candidate's Profile Picture" CssClass="lab_size" 
                 Width="220px"></asp:Label>
         </td>
         <td>
         </td>
            <td class="style12">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="289px" />
            </td>
            
            </tr>--%>
        <tr>
            <td class="style19">
            </td>
            <td class="style17">
                <asp:Button ID="Button1" runat="server" Style="margin-left: 4px" CssClass="text_size"
                    Text="Add Candidate" Width="129px" OnClick="Button1_Click" />
            </td>
            <td class="style16">
                &nbsp;
            </td>
        </tr>
    </table>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_CONSTITUENCY]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_PARTY]"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 199px;
            height: 30px;
        }
        .style9
        {
            width: 268px;
            height: 50px;
        }
        .style10
        {
            width: 283px;
            height: 50px;
        }
        .style12
        {
            height: 50px;
        }
        .style13
        {
            height: 75px;
            width: 199px;
        }
        .style14
        {
            width: 268px;
            height: 75px;
        }
        .style15
        {
            width: 283px;
            height: 75px;
        }
        .style16
        {
            height: 49px;
        }
        .style17
        {
            height: 49px;
            width: 268px;
        }
        .style18
        {
            height: 50px;
            width: 199px;
        }
        .style19
        {
            height: 49px;
            width: 199px;
        }
    </style>
</asp:Content>
