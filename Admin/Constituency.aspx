<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Constituency.aspx.cs" Inherits="Admin_Constituency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<font style="align:center" size="40px">CONSTITUENCY </font>  

   <%-- <asp:ListView ID="ListView1" runat="server" DataKeyNames="cons_id" 
    DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
    <AlternatingItemTemplate>
        <tr style="background-color: #FFFFFF;color: #284775;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                    Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
            </td>
            <td>
                <asp:Label ID="cons_nameLabel" runat="server" Text='<%# Eval("cons_name") %>' />
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
                <asp:Label ID="cons_idLabel1" runat="server" Text='<%# Eval("cons_id") %>' />
            </td>
            <td>
                <asp:TextBox ID="cons_nameTextBox" runat="server" 
                    Text='<%# Bind("cons_name") %>' />
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
                <asp:TextBox ID="cons_nameTextBox" runat="server" 
                    Text='<%# Bind("cons_name") %>' />
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
                <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
            </td>
            <td>
                <asp:Label ID="cons_nameLabel" runat="server" Text='<%# Eval("cons_name") %>' />
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
                                cons_id</th>
                            <th runat="server">
                                cons_name</th>
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
                <asp:Label ID="cons_idLabel" runat="server" Text='<%# Eval("cons_id") %>' />
            </td>
            <td>
                <asp:Label ID="cons_nameLabel" runat="server" Text='<%# Eval("cons_name") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [OVS_CONSTITUENCY] WHERE [cons_id] = @cons_id" 
    InsertCommand="INSERT INTO [OVS_CONSTITUENCY] ([cons_name]) VALUES (@cons_name)" 
    SelectCommand="SELECT * FROM [OVS_CONSTITUENCY]" 
    UpdateCommand="UPDATE [OVS_CONSTITUENCY] SET [cons_name] = @cons_name WHERE [cons_id] = @cons_id">
    <DeleteParameters>
        <asp:Parameter Name="cons_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="cons_name" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="cons_name" Type="String" />
        <asp:Parameter Name="cons_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>--%>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="CONS_ID" 
        DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CONS_IDLabel" runat="server" Text='<%# Eval("CONS_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="CONS_NAMELabel" runat="server" Text='<%# Eval("CONS_NAME") %>' />
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
                    <asp:Label ID="CONS_IDLabel1" runat="server" Text='<%# Eval("CONS_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CONS_NAMETextBox" runat="server" 
                        Text='<%# Bind("CONS_NAME") %>' />
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
                    <asp:TextBox ID="CONS_IDTextBox" runat="server" Text='<%# Bind("CONS_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CONS_NAMETextBox" runat="server" 
                        Text='<%# Bind("CONS_NAME") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CONS_IDLabel" runat="server" Text='<%# Eval("CONS_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="CONS_NAMELabel" runat="server" Text='<%# Eval("CONS_NAME") %>' />
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
                                    CONSTITUENCY</th>
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
                    <asp:Label ID="CONS_IDLabel" runat="server" Text='<%# Eval("CONS_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="CONS_NAMELabel" runat="server" Text='<%# Eval("CONS_NAME") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [CONSTITUENCY] WHERE [CONS_ID] = @CONS_ID" 
        InsertCommand="INSERT INTO [CONSTITUENCY] ([CONS_ID], [CONS_NAME]) VALUES (@CONS_ID, @CONS_NAME)" 
        SelectCommand="SELECT * FROM [CONSTITUENCY]" 
        UpdateCommand="UPDATE [CONSTITUENCY] SET [CONS_NAME] = @CONS_NAME WHERE [CONS_ID] = @CONS_ID">
        <DeleteParameters>
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="CONS_NAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CONS_NAME" Type="String" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

