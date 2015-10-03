<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Can_detail.aspx.cs" Inherits="Admin_Can_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<asp:DataList ID="DataList2" runat="server" >
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <ItemTemplate>
                            <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                                <tr>
                            
                                    <td style="width: 10%">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Format("~/img/candidate/{0}.png", Eval("c_id"))%>' />
                                    </td>
                                    <td style="width: 10%">
                                        &nbsp;<%# Eval("c_id") %></td>
                                    <td style="width: 400px">
                                        &nbsp;<%# Eval("c_name")%></td>
                                         <td style="width: 400px">
                                        &nbsp;<%# Eval("c_description")%></td>
                                         <td style="width: 400px">
                                        &nbsp;<%# Eval("c_qualification")%></td>
                                    <td style="width: 400px">
                                        &nbsp;<%# Eval("cons_name")%></td>
                                    <td style="width: 400px">
                                        &nbsp;<%# Eval("pname")%></td>
                                        <td>
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# string.Format("~/img/party/{0}.png", Eval("pid"))%>' />
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
                   
</asp:Content>

