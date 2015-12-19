<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Screen.aspx.cs" Inherits="Admin_Admin_Screen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
 
    <style type="text/css">
        .style1
        {
            width: 144px;
        }
        .style2
        {
            width: 156px;
            height: 250px;
        }
        .style3
        {
            width: 173px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div>
    
     <h1>welcome to admin screen</h1>
     <br />
    <asp:Button ID="Button2" runat="server" Text="Report" Height="50px" Width="320px" 
              OnClientClick="window.open('../Report_n.aspx')" BorderStyle="Solid" 
              Font-Size="Larger" style="margin-left: 4px" />
      <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <div style="top:30%;position:absolute;right:10%;">
         <table >
      <tr>
         <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#FF9900" ></asp:Label>&nbsp;&nbsp;&nbsp;
         <asp:Button ID="Button1" runat="server" Text="Logout" visible="false" 
             onclick="Button1_Click" />
            </tr>
            </table>
            </div>

    <table border="2px" class="style2" style="width:30%">
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="party" runat="server" Text="Party Count"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;<asp:Label ID="l_party" runat="server" Text="Label"></asp:Label>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="cons" runat="server" Text="Constituency Count"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;<asp:Label ID="l_cons" runat="server" Text="Label"></asp:Label>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="Label2" runat="server" Text="Candidate Count"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;<asp:Label ID="l_can" runat="server" Text="Label"></asp:Label>
            </td>
           
           
        </tr>
    </table>
     </div>

     <div style="position:absolute;right:10%;padding:2%;top:40%;">
     <script id="_wauqgu">         var _wau = _wau || [];
         _wau.push(["map", "2gwiux632byi", "qgu", "500", "300", "natural", "star-blue"]);
         (function () {
             var s = document.createElement("script"); s.async = true;
             s.src = "http://widgets.amung.us/map.js";
             //window.open('www.yourdomain.com','_blank');
             document.getElementsByTagName("head")[0].appendChild(s);
         })();</script>
     
     
     </div>
</asp:Content>