<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master"
    CodeFile="AddParty.aspx.cs" Inherits="Admin_AddParty" %>

<asp:Content ID="con2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="width: auto; position: absolute; right: 10%;">
        <asp:Label ID="Label2" runat="server" Text="Welcome,Admin" ForeColor="#FF9900"></asp:Label>
        &nbsp;
        <asp:Button ID="Button2" runat="server" Text="Logout" Visible="true" 
            OnClick="LogOut" CssClass="text_size" />
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:HiddenField ID="h_edit" runat="server" />
        <asp:HiddenField ID="h_pid" runat="server" />
        &nbsp;<table style="width: 100%;">
            <tr>
                <td>
                    <asp:DataList ID="DataList2" runat="server" OnSelectedIndexChanged="DataList2_SelectedIndexChanged"
                        OnEditCommand="Edit_Command" OnDeleteCommand="Delete_Command">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <ItemTemplate>
                            <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                                <tr>
                                    <td style="width: 10%">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Format("~/img/party/{0}.png", Eval("pid"))%>' />
                                    </td>
                                    <td style="width: 10%">
                                        &nbsp;<%# Eval("pid") %></td>
                                    <td style="width: 400px">
                                        &nbsp;<%# Eval("pname")%></td>
                                    <td style="width: 10%">
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="EDIT" CommandName="Edit" CommandArgument='<%#Eval("pid") %>'></asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lnkdelete" runat="server" Text="DELETE" CommandName="delete"
                                            CommandArgument='<%#Eval("pname") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Panel ID="Panel1" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px"
                                        Width="43px" OnClick="btnfirst_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px"
                                        Width="43px" OnClick="btnprevious_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" Width="43px"
                                        OnClick="btnnext_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px"
                                        Width="43px" OnClick="btnlast_Click" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT * FROM [OVS_PARTY]"></asp:SqlDataSource>
                    <br />
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                    <asp:Panel ID="PanelAddNewParty" runat="server" CssClass="addparty">
                        <table style="margin-left: 53px">
                            <tr>
                                <td class="style7">
                                    <asp:Label ID="Label1" runat="server" Text="PartyName"></asp:Label>
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="PartyName" runat="server" Style="margin-left: 38px" 
                                        CssClass="text_size" Height="22px"></asp:TextBox>
                                </td>
                                <td class="style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PartyName"
                                        ErrorMessage="This field is Required" ForeColor="Red" ValidationGroup="p"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    <asp:Label ID="PartyImageUploadLabel" runat="server" Text="Upload Party Logo"></asp:Label>
                                </td>
                                <td class="style2">
                                    <asp:FileUpload ID="FileUploadControl" runat="server" Style="margin-left: 36px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="StatusLabel" Text=" "  Style="margin-left: 36px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                </td>
                                <td>
                                <br />
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Party"
                                        Style="margin-left: 42px" ValidationGroup="p" CssClass="text_size" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style2
        {
            height: 56px;
        }
        .style6
        {
            height: 18px;
        }
        .style7
        {
            height: 18px;
            width: 166px;
        }
        .style8
        {
            height: 56px;
            width: 166px;
        }
        .style9
        {
            width: 181px;
        }
        .style10
        {
            width: 166px;
        }
    </style>
</asp:Content>
