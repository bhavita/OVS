<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

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
                    var url = "Help.aspx";
                    $(location).attr('href', url);
                }
            }
        });
    };
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


 
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div id="popupdiv" title="Alert" style="display: none">
<b> Please Enter Valid aadhar id</b>
</div>
            <asp:Label ID="Label1" runat="server" Text="Aadhar id:"></asp:Label>
            <asp:TextBox ID="aadhar_id" runat="server" style="margin-left: 30px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="aadhar_id" ErrorMessage="*must be valid" ForeColor="#FF3300" 
                ValidationExpression="\d{12}" ValidationGroup="fi"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="aadhar_id" ErrorMessage="*Please enter addhar id" 
                ForeColor="#FF3300" ValidationGroup="fi"></asp:RequiredFieldValidator>
            <br />
            <br />
           
            <%-- <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkTab2_Click">Next</asp:LinkButton>--%>
            <asp:Button ID="Button2" runat="server" onclick="lnkTab2_Click" 
                Text="Submit AadharID" ValidationGroup="fi" />
            <asp:HiddenField ID="h_try" runat="server" />
            <asp:HiddenField ID="h_cons" runat="server" />
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


  <%--          <asp:ListView ID="lvCustomers" runat="server" >
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
                

          </asp:ListView>--%>


                  
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [VID], [V_NAME], [CONS_ID], [VADDRESS], [VEMAILID], [PHONE_NO], [GENDER] FROM [VOTERINFO] WHERE ([VID] = @VID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="aadhar_id" Name="VID" PropertyName="Text" 
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>


                  
           
            <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                Height="50px" Width="70%" AutoGenerateRows="False" DataKeyNames="VID">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="VID" HeaderText="VID" 
                        SortExpression="VID" ReadOnly="True" />
                    <asp:BoundField DataField="V_NAME" HeaderText="V_NAME" 
                        SortExpression="V_NAME" />
                    <asp:BoundField DataField="CONS_ID" HeaderText="CONS_ID" 
                        SortExpression="CONS_ID" />
                    <asp:BoundField DataField="VADDRESS" HeaderText="VADDRESS" 
                        SortExpression="VADDRESS" />
                    <asp:BoundField DataField="VEMAILID" HeaderText="VEMAILID" 
                        SortExpression="VEMAILID" />
                    <asp:BoundField DataField="PHONE_NO" HeaderText="PHONE_NO" 
                        SortExpression="PHONE_NO" />
                    <asp:BoundField DataField="GENDER" HeaderText="GENDER" 
                        SortExpression="GENDER" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>

  
        
        <asp:Button ID="Button4" runat="server" Text="Set Password" OnClick="setpass" />
      
                  
           
         </asp:View>

         <asp:View ID="View4" runat="server">
            <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="t_pass1" TextMode="password" runat="server" ValidationGroup="x"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="t_pass1" ErrorMessage="RequiredFieldValidator" 
                 ValidationGroup="x"></asp:RequiredFieldValidator>
             &nbsp;&nbsp;&nbsp;&nbsp;
            <br /><br />
            <asp:Label ID="Label9" runat="server" Text="Conform Password"></asp:Label>
            <asp:TextBox ID="t_pass2" TextMode="password" runat="server" ValidationGroup="x"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                 ControlToValidate="t_pass2" ErrorMessage="RequiredFieldValidator" 
                 ValidationGroup="x"></asp:RequiredFieldValidator>
            <br />
             <asp:CompareValidator ID="CompareValidator1" runat="server" 
                 ControlToCompare="t_pass1" ControlToValidate="t_pass2" 
                 ErrorMessage="password must match" ForeColor="Red"></asp:CompareValidator>
             <br />
            <asp:Button ID="Button3" runat="server" Text="Register" 
                 onclick="Button3_Click" ValidationGroup="x"  />
         </asp:View>

    </asp:MultiView>
<br /><br />
    <%# Eval("v_name") %>

</asp:Content>
