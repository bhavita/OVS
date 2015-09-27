<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Can_detail.aspx.cs" Inherits="Admin_Can_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<font style="align:center" size="30px">CANDIDATE DETAIL </font>  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [OVS_CANDIDATE]"></asp:SqlDataSource>

    <asp:ListView ID="ListView2" runat="server" DataKeyNames="c_id" 
        DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <tr style="">
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
                    <asp:Label ID="c_descriptionLabel" runat="server" Text='<%# Eval("c_description") %>' />
                </td>
                <td>
                    <asp:Label ID="c_qualificationLabel" runat="server" Text='<%# Eval("c_qualification") %>' />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="can_phnoLabel" runat="server" Text='<%# Eval("can_phno") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
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
                    <asp:TextBox ID="c_descriptionTextBox" runat="server" 
                        Text='<%# Bind("c_description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="c_qualificationTextBox" runat="server" 
                        Text='<%# Bind("c_qualification") %>' />
                </td>
                <td>
                    <asp:TextBox ID="pidTextBox" runat="server" Text='<%# Bind("pid") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" 
                        Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_phnoTextBox" runat="server" 
                        Text='<%# Bind("can_phno") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
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
                    <asp:TextBox ID="c_descriptionTextBox" runat="server" 
                        Text='<%# Bind("c_description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="c_qualificationTextBox" runat="server" 
                        Text='<%# Bind("c_qualification") %>' />
                </td>
                <td>
                    <asp:TextBox ID="pidTextBox" runat="server" Text='<%# Bind("pid") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" 
                        Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="can_phnoTextBox" runat="server" 
                        Text='<%# Bind("can_phno") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
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
                    <asp:Label ID="c_descriptionLabel" runat="server" Text='<%# Eval("c_description") %>' />
                </td>
                <td>
                    <asp:Label ID="c_qualificationLabel" runat="server" Text='<%# Eval("c_qualification") %>' />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
               
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="2" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    id</th>
                                <th runat="server">
                                    Name</th>
                                <th runat="server">
                                    Cons_id</th>
                                <th runat="server">
                                    Description</th>
                                <th runat="server">
                                    Qualification</th>
                                <th runat="server">
                                    Party</th>
                                <th runat="server">
                                    Address</th>
                                <th runat="server">
                                    Email</th>
                                <th runat="server">
                                    PhoneNo</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
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
            <tr style="">
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
                    <asp:Label ID="c_descriptionLabel" runat="server" Text='<%# Eval("c_description") %>' />
                </td>
                <td>
                    <asp:Label ID="c_qualificationLabel" runat="server" Text='<%# Eval("c_qualification") %>' />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
              
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [OVS_CANDIDATE]"></asp:SqlDataSource>
    <br />
    <br />

</asp:Content>

