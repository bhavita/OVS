<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="Add_Candidate.aspx.cs" Inherits="Add_Candidate" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <font style="align: center" size="40px">CANDIDATE 
    <br />
     <br />
    </font>
   
    <asp:HiddenField ID="Act" runat="server"  />
    <asp:HiddenField ID="Hcid" runat="server"  />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">

       <asp:DataList ID="DataList2" runat="server" OnEditCommand="Edit_Command">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <ItemTemplate>
            <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                 <thead>
                    <tr>
                        <th style="width:300px; text-align:left ">
                            Image
                        </th>
                        <th style="width:300px;text-align:left ">
                            NAME
                        </th>
                        <th style="width:300px ;text-align:left">
                            DESCRIPTION
                        </th>
                        <th style="width:300px;text-align:left">
                            QUALIFICATION
                        </th>
                        <th style="width:300px;text-align:left">
                            CONSITUENCY
                        </th>
                        <th style="width:300px;text-align:left">
                           PARTY
                        </th>
                        <th style="width:300px;text-align:left">
                            SYMBOL
                        </th>
                    </tr>
                    
                </thead>
                <tbody>
                <tr>
                    <td >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Format("~/img/candidate/{0}.png", Eval("c_id"))%>' />
                    </td>
                   
                    <td >
                        &nbsp;<%# Eval("c_name")%></td>
                    <td >
                        &nbsp;<%# Eval("c_description")%></td>
                    <td >
                        &nbsp;<%# Eval("c_qualification")%></td>
                    <td >
                        &nbsp;<%# Eval("cons_name")%></td>
                    <td >
                        &nbsp;<%# Eval("pname")%></td>
                    <td >
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# string.Format("~/img/party/{0}.png", Eval("pid"))%>' />
                    </td>
                     <td style="width: 10%">
                            <asp:LinkButton ID="lnkEdit" runat="server" Text="EDIT" CommandName="Edit" CommandArgument='<%#Eval("c_id") %>'></asp:LinkButton>
                        </td>
                </tr>
                </tbody>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:Panel ID="Panel2" runat="server">
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

                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Height="31px" Width="182px" 
                        Text="ADD NEW CANDIDATE" />
                </td>
            </tr>
        </table>
    </asp:Panel>
               

        </asp:View>
         <asp:View ID="View2" runat="server">

          <table id="Table1" runat="server">
      

           <tr>
         <td>
    <asp:Label ID="Label6" runat="server" Text="Insert Candidate's Profile Picture" CssClass="lab_size" 
                 Width="220px"></asp:Label>
         </td>
         <td>
             <asp:FileUpload ID="FileUploadControl" runat="server" Width="289px" />
         </td>
            <td class="style12">
                <asp:Image ID="Image1" runat="server"  />
            </td>
            
            </tr>
              <tr>
            <td class="style1">
                <asp:Label ID="can_name" runat="server" Text="Candidate Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <br />
                <asp:TextBox ID="C_Name" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="C_Name"
                    ErrorMessage="This field is required" ForeColor="#FF3300" 
                    ValidationGroup="c"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="cons_id" runat="server" Text="Consituency Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:DropDownList ID="C_Cons" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="cons_name" DataValueField="cons_id" CssClass="text_size" Height="25px"
                    Width="200px" 
                    >
                    <%--<asp:ListItem Text="select constituency" Value="" />--%>
                </asp:DropDownList>
            </td>
            <td class="style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="C_Name"
                    ErrorMessage="This field is required" ForeColor="#FF3300" 
                    ValidationGroup="c" Enabled="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="can_desc" runat="server" Text="Candidate Description" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="C_Des" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="can_qua" runat="server" Text="Candidate Qualification" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="C_qual" runat="server" CssClass="text_size" Width="200px"></asp:TextBox>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Labe10" runat="server" Text="Party-Name" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:DropDownList ID="Pname" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="pname" DataValueField="pid" Height="25px" Width="199px" CssClass="text_size"  
                   >
                   <%-- <asp:ListItem Text="select party" Value="" />--%>
                </asp:DropDownList>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Pname"
                    ErrorMessage="This field is required" ForeColor="Red" ValidationGroup="c" 
                    Enabled="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                <asp:Label ID="Label1" runat="server" Text="Candidate Address" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style14">
                <asp:TextBox ID="CAdd" runat="server" TextMode="MultiLine" Width="199px" CssClass="text_size"
                    Height="54px"></asp:TextBox>
            </td>
            <td class="style15">
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Label3" runat="server" Text="Email" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <asp:TextBox ID="Cemail" runat="server" Width="200px" CssClass="text_size"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Cemail"
                    ErrorMessage="Enter valid Email" ForeColor="#FF3300" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="c"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Cemail"
                    ErrorMessage="This Feild is required" ForeColor="#FF3300" 
                    ValidationGroup="c"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style18">
                <asp:Label ID="Label5" runat="server" Text="Phone Number" CssClass="lab_size"></asp:Label>
            </td>
            <td class="style9">
                <br />
                <asp:TextBox ID="CPhno" runat="server" CssClass="text_size" Width="202px"></asp:TextBox>
            </td>
            <td class="style12">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CPhno"
                    ErrorMessage="Enter Valid Phone no" ForeColor="#FF3300" 
                    ValidationExpression="(D-)?\d{10}" ValidationGroup="c"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="CPhno"
                    ErrorMessage="This feild is required" ForeColor="#FF3300" 
                    ValidationGroup="c"></asp:RequiredFieldValidator>
            </td>
        </tr>
     
        <tr>
            <td class="style19">
            </td>
            <td class="style17">
                <asp:Button ID="Button1" runat="server" Style="margin-left: 4px" CssClass="text_size"
                    Text="Add Candidate" Width="129px" OnClick="Button1_Click" 
                    ValidationGroup="c" />
            </td>
            <td class="style16">
                &nbsp;
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Back" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_CONSTITUENCY]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [OVS_PARTY]"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
        </asp:View>
    
    </asp:MultiView>
   
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 199px;
            height: 30px;
        }
        .style9
        {
            width: 268px;
            height: 50px;
        }
        .style10
        {
            width: 283px;
            height: 50px;
        }
        .style12
        {
            height: 50px;
        }
        .style13
        {
            height: 75px;
            width: 199px;
        }
        .style14
        {
            width: 268px;
            height: 75px;
        }
        .style15
        {
            width: 283px;
            height: 75px;
        }
        .style16
        {
            height: 49px;
        }
        .style17
        {
            height: 49px;
            width: 268px;
        }
        .style18
        {
            height: 50px;
            width: 199px;
        }
        .style19
        {
            height: 49px;
            width: 199px;
        }
    </style>
</asp:Content>