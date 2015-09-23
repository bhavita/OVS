<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">

            <asp:Label ID="Label1" runat="server" Text="Aadhar id:"></asp:Label>
            <asp:TextBox ID="aadhar_id" runat="server" style="margin-left: 30px"></asp:TextBox>
            <br /><br />
           
            <%-- <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkTab2_Click">Next</asp:LinkButton>--%>
            <asp:Button ID="Button2" runat="server" onclick="lnkTab2_Click" 
                Text="Submit AadharID" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label2" runat="server" Text="OTP:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br />
             <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Send OTP" 
                onclick="Button1_Click" />            
           
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:ListView ID="lvCustomers" runat="server" >
                <ItemTemplate>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="AadharId :"></asp:Label>
                    <%# Eval("vid") %>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Name: "></asp:Label>
                    <%# Eval("v_name") %>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Address :"></asp:Label>
                    <%# Eval("vaddress") %>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="EmailId: "></asp:Label>
                    <%# Eval("vemailid") %>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="phone_no :"></asp:Label>
                    <%# Eval("phone_no") %>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Gender: "></asp:Label>
                    <%# Eval("Gender") %>
                    <br />
                    <tr style="">
     <td>
        
        <asp:Button ID="Button1" runat="server" Text="Set Password" OnClick="setpass" />
      </td>
   </tr>
             </ItemTemplate>
                

          </asp:ListView>
                  
           
         </asp:View>

         <asp:View ID="View4" runat="server">
            <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" TextMode="password" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label9" runat="server" Text="Conform Password"></asp:Label>
            <asp:TextBox ID="TextBox3" TextMode="password" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button3" runat="server" Text="Register"  />
         </asp:View>

    </asp:MultiView>
<br /><br />
<asp:TextBox ID="txtrollno" runat="server">  
</asp:TextBox>  
<br /><br />
<asp:Image ID="Image1" runat="server" length="100px" Width="100px" />  
<br />  
<asp:Button ID="txtGetImage" runat="server"  
Text="Convert" OnClick="txtGetImage_Click" />



</asp:Content>
