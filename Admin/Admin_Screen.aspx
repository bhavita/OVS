<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_Screen.aspx.cs" Inherits="Admin_Admin_Screen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div>
     <script type="text/javascript">
//         alert('safas');
//         history.pushState(null, null, 'Admin/Admin_Screen.aspx');
//         window.addEventListner('popstate', function (event) {
//             history.pushState(null, null, 'Admin/Admin_Screen.aspx');
//          });

     </script>
   <%-- <script language="JavaScript">
        if (window.event) //Internet Explorer
        {
            alert("Browser back button is clicked on Internet Explorer...");
        }
        else //Other browsers e.g. Chrome
        {
            alert("Browser back button is clicked on other browser...");
        }
    alert('hii');
//<!--
        javascript: window.history.forward(1);
//-->
</script>--%>
     <h1>welcome to admin screen</h1>
         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         <asp:Button ID="Button1" runat="server" Text="Logout" visible="false" 
             onclick="Button1_Click"/>
     </div>
</asp:Content>