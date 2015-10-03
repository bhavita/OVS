<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master"
    CodeFile="AddConstituency.aspx.cs" Inherits="Admin_AddConstituency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:DataList ID="DataList2" runat="server" OnSelectedIndexChanged="DataList2_SelectedIndexChanged"
                    OnEditCommand="Edit_Command">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <ItemTemplate>
                        <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                            <tr>
                                <td style="width: 10%">
                                    &nbsp;<%# Eval("cons_id") %>
                                </td>
                                <td style="width: 400px">
                                    &nbsp;<%# Eval("cons_name")%>
                                </td>
                                <td style="width: 10%">
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="EDIT" CommandName="Edit" CommandArgument='<%#Eval("cons_id") %>'></asp:LinkButton>
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
            </td>
            <td>
                <asp:Panel ID="PanelAddNewCons" runat="server" CssClass="addCons">
                    <asp:Label ID="Lcname" runat="server" Text="Constituency Name"></asp:Label>
                    <asp:TextBox ID="TConsName" runat="server" Style="margin-left: 38px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This Field is required"
                        ForeColor="Red" ControlToValidate="TConsName" ValidationGroup="b"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Button ID="ConsSubmit" runat="server" OnClick="Button1_Click" Text="Add New Constituency"
                        Style="margin-left: 151px" ValidationGroup="b" />
                    <br />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="h_cedit" runat="server" />
    <asp:HiddenField ID="h_cid" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [cons_name] FROM [ovs_constituency]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .addCons
        {
            margin-left: 64px;
        }
    </style>
</asp:Content>
