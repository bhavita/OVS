<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Party.aspx.cs" Inherits="Admin_Party" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<font style="align:center" size="40px">PARTY </font>  
  <asp:ListView ID="ListView1" runat="server" DataKeyNames="pid" 
        DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
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
                    <asp:Label ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
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
                    <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
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
                                </th>
                                <th runat="server">
                                    ID</th>
                                <th runat="server">
                                    PARTY</th>
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
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                </td>
                <td>
                    <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [OVS_PARTY] WHERE [pid] = @pid" 
        InsertCommand="INSERT INTO [OVS_PARTY] ([pname]) VALUES (@pname)" 
        SelectCommand="SELECT * FROM [OVS_PARTY]" 
        UpdateCommand="UPDATE [OVS_PARTY] SET [pname] = @pname WHERE [pid] = @pid">
        <DeleteParameters>
            <asp:Parameter Name="pid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pname" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pname" Type="String" />
            <asp:Parameter Name="pid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </h1>
    <%--<asp:ListView ID="ListView1" runat="server" DataKeyNames="pid" 
    DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" 
    onselectedindexchanged="ListView1_SelectedIndexChanged">
    <AlternatingItemTemplate>
        <tr style="background-color: #FFFFFF;color: #284775;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
            </td>
            <td>
                <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
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
                <asp:Label ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' />
            </td>
            <td>
                <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
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
                <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
            </td>
        </tr>
    </InsertItemTemplate>
    <ItemTemplate>
        <tr style="background-color: #E0FFFF;color: #333333;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
            </td>
            <td>
                <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
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
                            </th>
                            <th runat="server">
                                pid</th>
                            <th runat="server">
                                pname</th>
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
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
            </td>
            <td>
                <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [OVS_PARTY] WHERE [pid] = @pid" 
    InsertCommand="INSERT INTO [OVS_PARTY] ([pname]) VALUES (@pname)" 
    SelectCommand="SELECT * FROM [OVS_PARTY]" 
    UpdateCommand="UPDATE [OVS_PARTY] SET [pname] = @pname WHERE [pid] = @pid">
    <DeleteParameters>
        <asp:Parameter Name="pid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="pname" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>--%>
    <br />
    <br />
</asp:Content>

