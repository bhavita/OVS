<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Can_detail.aspx.cs" Inherits="Admin_Can_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="c_id" 
        DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="c_idLabel" runat="server" Text='<%# Eval("c_id") %>' />
                </td>
                <td>
                    <asp:Label ID="c_nameLabel" runat="server" Text='<%# Eval("c_name") %>' />
                </td>
                <td>
                    <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_descLabel" runat="server" Text='<%# Eval("can_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="can_qualLabel" runat="server" Text='<%# Eval("can_qual") %>' />
                </td>
                <td>
                    <asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_addLabel" runat="server" Text='<%# Eval("can_add") %>' />
                </td>
                <td>
                    <asp:Label ID="can_emailLabel" runat="server" Text='<%# Eval("can_email") %>' />
                </td>
                <td>
                    <asp:Label ID="can_phnoLabel" runat="server" Text='<%# Eval("can_phno") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="c_idLabel1" runat="server" Text='<%# Eval("c_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="c_nameTextBox" runat="server" Text='<%# Bind("c_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="cons_idTextBox" runat="server" Text='<%# Bind("cons_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_descTextBox" runat="server" 
                        Text='<%# Bind("can_desc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_qualTextBox" runat="server" 
                        Text='<%# Bind("can_qual") %>' />
                </td>
                <td>
                    <asp:TextBox ID="p_idTextBox" runat="server" Text='<%# Bind("p_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_addTextBox" runat="server" Text='<%# Bind("can_add") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_emailTextBox" runat="server" 
                        Text='<%# Bind("can_email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_phnoTextBox" runat="server" 
                        Text='<%# Bind("can_phno") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="c_nameTextBox" runat="server" Text='<%# Bind("c_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="cons_idTextBox" runat="server" Text='<%# Bind("cons_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_descTextBox" runat="server" 
                        Text='<%# Bind("can_desc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_qualTextBox" runat="server" 
                        Text='<%# Bind("can_qual") %>' />
                </td>
                <td>
                    <asp:TextBox ID="p_idTextBox" runat="server" Text='<%# Bind("p_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_addTextBox" runat="server" Text='<%# Bind("can_add") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_emailTextBox" runat="server" 
                        Text='<%# Bind("can_email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_phnoTextBox" runat="server" 
                        Text='<%# Bind("can_phno") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="c_idLabel" runat="server" Text='<%# Eval("c_id") %>' />
                </td>
                <td>
                    <asp:Label ID="c_nameLabel" runat="server" Text='<%# Eval("c_name") %>' />
                </td>
                <td>
                    <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_descLabel" runat="server" Text='<%# Eval("can_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="can_qualLabel" runat="server" Text='<%# Eval("can_qual") %>' />
                </td>
                <td>
                    <asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_addLabel" runat="server" Text='<%# Eval("can_add") %>' />
                </td>
                <td>
                    <asp:Label ID="can_emailLabel" runat="server" Text='<%# Eval("can_email") %>' />
                </td>
                <td>
                    <asp:Label ID="can_phnoLabel" runat="server" Text='<%# Eval("can_phno") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">
                                    c_id</th>
                                <th runat="server">
                                    c_name</th>
                                <th runat="server">
                                    cons_id</th>
                                <th runat="server">
                                    can_desc</th>
                                <th runat="server">
                                    can_qual</th>
                                <th runat="server">
                                    p_id</th>
                                <th runat="server">
                                    can_add</th>
                                <th runat="server">
                                    can_email</th>
                                <th runat="server">
                                    can_phno</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="c_idLabel" runat="server" Text='<%# Eval("c_id") %>' />
                </td>
                <td>
                    <asp:Label ID="c_nameLabel" runat="server" Text='<%# Eval("c_name") %>' />
                </td>
                <td>
                    <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_descLabel" runat="server" Text='<%# Eval("can_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="can_qualLabel" runat="server" Text='<%# Eval("can_qual") %>' />
                </td>
                <td>
                    <asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' />
                </td>
                <td>
                    <asp:Label ID="can_addLabel" runat="server" Text='<%# Eval("can_add") %>' />
                </td>
                <td>
                    <asp:Label ID="can_emailLabel" runat="server" Text='<%# Eval("can_email") %>' />
                </td>
                <td>
                    <asp:Label ID="can_phnoLabel" runat="server" Text='<%# Eval("can_phno") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [OVS_CANDIDATE]"></asp:SqlDataSource>

</asp:Content>

