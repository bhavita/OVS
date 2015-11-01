<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Screen.aspx.cs" Inherits="Admin_Admin_Screen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
 
    <style type="text/css">
        .style1
        {
            width: 144px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div>
    
     <h1>welcome to admin screen</h1>
      
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

    <table style="width: 30%;" border="2px">
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="party" runat="server" Text="Party Count"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:Label ID="l_party" runat="server" Text="Label"></asp:Label>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="cons" runat="server" Text="Constituency Count"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:Label ID="l_cons" runat="server" Text="Label"></asp:Label>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                &nbsp;<asp:Label ID="Label2" runat="server" Text="Candidate Count"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:Label ID="l_can" runat="server" Text="Label"></asp:Label>
            </td>
           
           
        </tr>
    </table>
     </div>

     <div style="position:absolute;right:10%;padding:2%;top:35%">
     <script id="_wauqgu">         var _wau = _wau || [];
         _wau.push(["map", "2gwiux632byi", "qgu", "420", "210", "natural", "star-blue"]);
         (function () {
             var s = document.createElement("script"); s.async = true;
             s.src = "http://widgets.amung.us/map.js";
             //window.open('www.yourdomain.com','_blank');
             document.getElementsByTagName("head")[0].appendChild(s);
         })();</script>
     
     
     </div>
</asp:Content>