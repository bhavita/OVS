<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Voting.aspx.cs" Inherits="Voting"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">


<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript">
    function showmodalpopup() {
        $("#popupdiv").dialog({
            // title: "jQuery Popup from Server Side",
            width: 430,
            height: 150,
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                    var url = "Socialshare.aspx";
                    $(location).attr('href', url);
                },
                Cancle: function () {
                    $(this).dialog('close');
                    var url = "VoterDashboard.aspx";
                    $(location).attr('href', url);
                }
            }
        });
    };

    function showmodalpopup1() {
        $("#popupdiv1").dialog({
            // title: "jQuery Popup from Server Side",
            width: 430,
            height: 150,
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                    var url = "VoterDashboard.aspx";
                    $(location).attr('href', url);
                }
            }
        });
    };
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div id="popupdiv1" title="Alert" style="display: none">
<b> Voting is Already done</b>
</div>

<div id="popupdiv" title="Alert" style="display: none">
<b> Voting is done succssefully..press ok to share it on facebook and cancle to go back</b>
</div>
    <asp:DataList ID="DataList2" runat="server">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <ItemTemplate>
            <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                <tr>
                    <td style="width: 10%">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Format("img/candidate/{0}.png", Eval("c_id"))%>' />
                    </td>
                    
                    <td style="width: 10%">
                        &nbsp;<%# Eval("c_id") %></td>
                    <td style="width: 400px">
                        &nbsp;<%# Eval("c_name")%></td>
                     <td style="width: 400px">
                        &nbsp;<%# Eval("cons_id")%></td>
                    <td style="width: 400px">
                        &nbsp;<%# Eval("pid")%></td>
                    <td style="width: 10%">
                    
                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# string.Format("img/party/{0}.png", Eval("pid"))%>' CommandArgument='<%#Eval("c_id") %>' OnCommand="sw1_Command"/>
                       <%-- <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%#Eval("c_id") %>' OnCommand="sw1_Command"/>--%>
                       <%-- <asp:LinkButton ID="lnkEdit" runat="server" Text="vote" CommandName="Edit" CommandArgument='<%#Eval("c_id") %>'></asp:LinkButton>--%>
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
                    <asp:HiddenField ID="h_vid" runat="server" />
                </td>
                
            </tr>
        </table>
    </asp:Panel>
   
</asp:Content>
