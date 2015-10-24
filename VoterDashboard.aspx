<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="VoterDashboard.aspx.cs" Inherits="VoterDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
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
        &nbsp;</p>
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

