<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="VoterDashboard.aspx.cs" Inherits="VoterDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript">

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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="popupdiv1" title="Alert" style="display: none">
<b> Voting is Already done</b>
</div>

    <p>
        <asp:Button ID="VoterLogOut" runat="server" Text="LogOut" 
            onclick="VoterLogOut_Click" />
    </p>
<p>
        &nbsp;</p>
<p>
        <br />
        <asp:ImageButton ID="castVote" runat="server" 
            ImageUrl="~/img/icons/Cast-Vote-icon.png" onclick="castVote_Click" />
        <asp:ImageButton ID="CandidateDetails" runat="server" 
            ImageUrl="~/img/icons/Candidate-icon.png" 
            onclick="CandidateDetails_Click"  />
        <asp:ImageButton ID="Help" runat="server" Height="256px" 
            ImageUrl="~/img/icons/help-icon.png" onclick="Help_Click" 
            Width="256px" />
    </p>
    <p>
        <asp:HiddenField ID="vid" runat="server" />
    </p>
    <p>
        <asp:ImageButton ID="ElectionDetails" runat="server" 
            ImageUrl="~/img/icons/Election-icon.png" onclick="ElectionDetails_Click" />
        <asp:ImageButton ID="ModifyDetails" runat="server" 
            ImageUrl="~/img/icons/Modify-Voter-icon.png" 
            onclick="ModifyDetails_Click" />
        <asp:ImageButton ID="Share" runat="server" 
            ImageUrl="~/img/icons/share.png" onclick="Share_Click" />
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    
</asp:Content>

