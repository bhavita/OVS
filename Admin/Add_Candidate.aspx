<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Add_Candidate.aspx.cs" Inherits="Add_Candidate" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <%-- <table style="width: 100%;">
        <tr>
            <td class="style27">
                  <asp:Label ID="Label2" runat="server" Text="Candidate Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style28">
                <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox> 
            </td>
            <td class="style29">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox10"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style30">
                <asp:Label ID="Label4" runat="server" Text="Consituency ID" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style31">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="cons_name" DataValueField="cons_id" CssClass="text_size" Height="25px"
                    Width="200px">
                </asp:DropDownList>
            </td>
            <td class="style32">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList3"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;
            </td>
            <td class="style24">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>--%>
    <table id="Table1" runat="server">
        <tr>
            <td class="style1">
                <asp:Label ID="can_name" runat="server" Text="Candidate Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">    
              
                <asp:TextBox ID="TextBox10" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox10"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="cons_id" runat="server" Text="Consituency ID" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="cons_name" DataValueField="cons_id" CssClass="text_size" Height="25px"
                    Width="200px">
                </asp:DropDownList>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList3"
                    ErrorMessage="This field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style19">
                <asp:Label ID="can_desc" runat="server" Text="Candidate Description" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style19">
                <asp:Label ID="can_qua" runat="server" Text="Candidate Qualification" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style19">
                <asp:Label ID="Labe10" runat="server" Text="Party-ID" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="p_name" DataValueField="p_id" Height="25px" Width="199px" CssClass="text_size">
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
            <td class="style19">
                <asp:Label ID="Label3" runat="server" Text="Email" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:TextBox ID="TextBox7" runat="server" Width="200px" CssClass="text_size"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7"
                    ErrorMessage="Enter valid Email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style19">
                <asp:Label ID="Label5" runat="server" Text="Phone Number" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style26">
                <asp:TextBox ID="TextBox8" runat="server" CssClass="text_size" Width="202px"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8"
                    ErrorMessage="This feild is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="Label6" runat="server" Text="Insert Candidate's Profile Picture" CssClass="lab_size"
                    Width="220px"></asp:Label>
            </td>
            <td class="style26">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="289px" />
            </td>
            <td class="style10">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style21">
            </td>
            <td class="style16">
                <asp:Button ID="Button1" runat="server" Style="margin-left: 0px" CssClass="text_size"
                    Text="Add Candidate" Width="129px" OnClick="Button1_Click" />
            </td>
            <td class="style22">
                &nbsp;
            </td>
        </tr>
    </table>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_CONSTITUENCY]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_PARTY]"></asp:SqlDataSource>
        </p>
    <p>
        &nbsp;</p>
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
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 171px;
            height: 30px;
        }
        .style10
        {
            width: 350px;
            height: 50px;
        }
        tr.td.style12
        {
            height: 50px;
            width: 20px;
        }
        .style13
        {
            height: 75px;
            width: 171px;
        }
        .style14
        {
            height: 60px;
            width: 13px;
        }
        .style15
        {
            width: 350px;
            height: 75px;
        }
        .style16
        {
            height: 49px;
            width: 13px;
        }
        .style19
        {
            height: 50px;
            width: 171px;
        }
        .style20
        {
            width: 171px;
        }
        .style21
        {
            height: 49px;
            width: 171px;
        }
        .style22
        {
            height: 49px;
            width: 350px;
        }
        .style24
        {
            width: 221px;
        }
        .style25
        {
            width: 121px;
        }
        .style26
        {
            width: 13px;
        }
        .style27
        {
            width: 121px;
            height: 51px;
        }
        .style28
        {
            width: 221px;
            height: 51px;
        }
        .style29
        {
            height: 51px;
        }
        .style30
        {
            width: 121px;
            height: 52px;
        }
        .style31
        {
            width: 221px;
            height: 52px;
        }
        .style32
        {
            height: 52px;
        }
    </style>
</asp:Content>
