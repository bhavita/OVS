<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DataBase.aspx.cs" Inherits="DataBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="PID" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="PID" HeaderText="PID" ReadOnly="True" 
            SortExpression="PID" />
        <asp:BoundField DataField="PNAME" HeaderText="PNAME" SortExpression="PNAME" />
    </Columns>
   </asp:GridView>
   <br />
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="VID" 
        DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="VID" HeaderText="VID" ReadOnly="True" 
                SortExpression="VID" />
            <asp:BoundField DataField="V_NAME" HeaderText="V_NAME" 
                SortExpression="V_NAME" />
            <asp:BoundField DataField="CONS_ID" HeaderText="CONS_ID" 
                SortExpression="CONS_ID" />
            <asp:BoundField DataField="VADDRESS" HeaderText="VADDRESS" 
                SortExpression="VADDRESS" />
            <asp:BoundField DataField="VEMAILID" HeaderText="VEMAILID" 
                SortExpression="VEMAILID" />
            <asp:BoundField DataField="VPASSWORD" HeaderText="VPASSWORD" 
                SortExpression="VPASSWORD" />
            <asp:BoundField DataField="PHONE_NO" HeaderText="PHONE_NO" 
                SortExpression="PHONE_NO" />
            <asp:BoundField DataField="GENDER" HeaderText="GENDER" 
                SortExpression="GENDER" />
            <asp:BoundField DataField="BIRTHDATE" HeaderText="BIRTHDATE" 
                SortExpression="BIRTHDATE" />
            <asp:BoundField DataField="VAGE" HeaderText="VAGE" SortExpression="VAGE" />
        </Columns>
    </asp:GridView>
    </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="VID" 
        DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            VID:
            <asp:Label ID="VIDLabel1" runat="server" Text='<%# Eval("VID") %>' />
            <br />
            V_NAME:
            <asp:TextBox ID="V_NAMETextBox" runat="server" Text='<%# Bind("V_NAME") %>' />
            <br />
            CONS_ID:
            <asp:TextBox ID="CONS_IDTextBox" runat="server" Text='<%# Bind("CONS_ID") %>' />
            <br />
            VADDRESS:
            <asp:TextBox ID="VADDRESSTextBox" runat="server" 
                Text='<%# Bind("VADDRESS") %>' />
            <br />
            VEMAILID:
            <asp:TextBox ID="VEMAILIDTextBox" runat="server" 
                Text='<%# Bind("VEMAILID") %>' />
            <br />
            VPASSWORD:
            <asp:TextBox ID="VPASSWORDTextBox" runat="server" 
                Text='<%# Bind("VPASSWORD") %>' />
            <br />
            PHONE_NO:
            <asp:TextBox ID="PHONE_NOTextBox" runat="server" 
                Text='<%# Bind("PHONE_NO") %>' />
            <br />
            GENDER:
            <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
            <br />
            BIRTHDATE:
            <asp:TextBox ID="BIRTHDATETextBox" runat="server" 
                Text='<%# Bind("BIRTHDATE") %>' />
            <br />
            VAGE:
            <asp:TextBox ID="VAGETextBox" runat="server" Text='<%# Bind("VAGE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            VID:
            <asp:TextBox ID="VIDTextBox" runat="server" Text='<%# Bind("VID") %>' />
            <br />
            V_NAME:
            <asp:TextBox ID="V_NAMETextBox" runat="server" Text='<%# Bind("V_NAME") %>' />
            <br />
            CONS_ID:
            <asp:TextBox ID="CONS_IDTextBox" runat="server" Text='<%# Bind("CONS_ID") %>' />
            <br />
            VADDRESS:
            <asp:TextBox ID="VADDRESSTextBox" runat="server" 
                Text='<%# Bind("VADDRESS") %>' />
            <br />
            VEMAILID:
            <asp:TextBox ID="VEMAILIDTextBox" runat="server" 
                Text='<%# Bind("VEMAILID") %>' />
            <br />
            VPASSWORD:
            <asp:TextBox ID="VPASSWORDTextBox" runat="server" 
                Text='<%# Bind("VPASSWORD") %>' />
            <br />
            PHONE_NO:
            <asp:TextBox ID="PHONE_NOTextBox" runat="server" 
                Text='<%# Bind("PHONE_NO") %>' />
            <br />
            GENDER:
            <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
            <br />
            BIRTHDATE:
            <asp:TextBox ID="BIRTHDATETextBox" runat="server" 
                Text='<%# Bind("BIRTHDATE") %>' />
            <br />
            VAGE:
            <asp:TextBox ID="VAGETextBox" runat="server" Text='<%# Bind("VAGE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            VID:
            <asp:Label ID="VIDLabel" runat="server" Text='<%# Eval("VID") %>' />
            <br />
            V_NAME:
            <asp:Label ID="V_NAMELabel" runat="server" Text='<%# Bind("V_NAME") %>' />
            <br />
            CONS_ID:
            <asp:Label ID="CONS_IDLabel" runat="server" Text='<%# Bind("CONS_ID") %>' />
            <br />
            VADDRESS:
            <asp:Label ID="VADDRESSLabel" runat="server" Text='<%# Bind("VADDRESS") %>' />
            <br />
            VEMAILID:
            <asp:Label ID="VEMAILIDLabel" runat="server" Text='<%# Bind("VEMAILID") %>' />
            <br />
            VPASSWORD:
            <asp:Label ID="VPASSWORDLabel" runat="server" Text='<%# Bind("VPASSWORD") %>' />
            <br />
            PHONE_NO:
            <asp:Label ID="PHONE_NOLabel" runat="server" Text='<%# Bind("PHONE_NO") %>' />
            <br />
            GENDER:
            <asp:Label ID="GENDERLabel" runat="server" Text='<%# Bind("GENDER") %>' />
            <br />
            BIRTHDATE:
            <asp:Label ID="BIRTHDATELabel" runat="server" Text='<%# Bind("BIRTHDATE") %>' />
            <br />
            VAGE:
            <asp:Label ID="VAGELabel" runat="server" Text='<%# Bind("VAGE") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </br>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [VOTERINFO] WHERE [VID] = @original_VID AND [V_NAME] = @original_V_NAME AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND (([VADDRESS] = @original_VADDRESS) OR ([VADDRESS] IS NULL AND @original_VADDRESS IS NULL)) AND [VEMAILID] = @original_VEMAILID AND (([VPASSWORD] = @original_VPASSWORD) OR ([VPASSWORD] IS NULL AND @original_VPASSWORD IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND [BIRTHDATE] = @original_BIRTHDATE AND (([VAGE] = @original_VAGE) OR ([VAGE] IS NULL AND @original_VAGE IS NULL))" 
        InsertCommand="INSERT INTO [VOTERINFO] ([VID], [V_NAME], [CONS_ID], [VADDRESS], [VEMAILID], [VPASSWORD], [PHONE_NO], [GENDER], [BIRTHDATE], [VAGE]) VALUES (@VID, @V_NAME, @CONS_ID, @VADDRESS, @VEMAILID, @VPASSWORD, @PHONE_NO, @GENDER, @BIRTHDATE, @VAGE)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [VOTERINFO]" 
        UpdateCommand="UPDATE [VOTERINFO] SET [V_NAME] = @V_NAME, [CONS_ID] = @CONS_ID, [VADDRESS] = @VADDRESS, [VEMAILID] = @VEMAILID, [VPASSWORD] = @VPASSWORD, [PHONE_NO] = @PHONE_NO, [GENDER] = @GENDER, [BIRTHDATE] = @BIRTHDATE, [VAGE] = @VAGE WHERE [VID] = @original_VID AND [V_NAME] = @original_V_NAME AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND (([VADDRESS] = @original_VADDRESS) OR ([VADDRESS] IS NULL AND @original_VADDRESS IS NULL)) AND [VEMAILID] = @original_VEMAILID AND (([VPASSWORD] = @original_VPASSWORD) OR ([VPASSWORD] IS NULL AND @original_VPASSWORD IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND [BIRTHDATE] = @original_BIRTHDATE AND (([VAGE] = @original_VAGE) OR ([VAGE] IS NULL AND @original_VAGE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_VID" Type="Decimal" />
            <asp:Parameter Name="original_V_NAME" Type="String" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_VADDRESS" Type="String" />
            <asp:Parameter Name="original_VEMAILID" Type="String" />
            <asp:Parameter Name="original_VPASSWORD" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_VAGE" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VID" Type="Decimal" />
            <asp:Parameter Name="V_NAME" Type="String" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="VADDRESS" Type="String" />
            <asp:Parameter Name="VEMAILID" Type="String" />
            <asp:Parameter Name="VPASSWORD" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="VAGE" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="V_NAME" Type="String" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="VADDRESS" Type="String" />
            <asp:Parameter Name="VEMAILID" Type="String" />
            <asp:Parameter Name="VPASSWORD" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="VAGE" Type="Decimal" />
            <asp:Parameter Name="original_VID" Type="Decimal" />
            <asp:Parameter Name="original_V_NAME" Type="String" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_VADDRESS" Type="String" />
            <asp:Parameter Name="original_VEMAILID" Type="String" />
            <asp:Parameter Name="original_VPASSWORD" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_VAGE" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </br>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="CONS_ID" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="CONS_ID" HeaderText="CONS_ID" ReadOnly="True" 
                SortExpression="CONS_ID" />
            <asp:BoundField DataField="CONS_NAME" HeaderText="CONS_NAME" 
                SortExpression="CONS_NAME" />
        </Columns>
    </asp:GridView>
    </br>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [CONSTITUENCY] WHERE [CONS_ID] = @original_CONS_ID AND [CONS_NAME] = @original_CONS_NAME" 
        InsertCommand="INSERT INTO [CONSTITUENCY] ([CONS_ID], [CONS_NAME]) VALUES (@CONS_ID, @CONS_NAME)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [CONSTITUENCY]" 
        UpdateCommand="UPDATE [CONSTITUENCY] SET [CONS_NAME] = @CONS_NAME WHERE [CONS_ID] = @original_CONS_ID AND [CONS_NAME] = @original_CONS_NAME">
        <DeleteParameters>
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_CONS_NAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="CONS_NAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CONS_NAME" Type="String" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_CONS_NAME" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </br>
    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="C_ID" DataSourceID="candidate_info">
        <Columns>
            <asp:BoundField DataField="C_ID" HeaderText="C_ID" ReadOnly="True" 
                SortExpression="C_ID" />
            <asp:BoundField DataField="CONS_ID" HeaderText="CONS_ID" 
                SortExpression="CONS_ID" />
            <asp:BoundField DataField="C_NAME" HeaderText="C_NAME" 
                SortExpression="C_NAME" />
            <asp:BoundField DataField="C_AGE" HeaderText="C_AGE" SortExpression="C_AGE" />
            <asp:BoundField DataField="C_QUALIFICATION" HeaderText="C_QUALIFICATION" 
                SortExpression="C_QUALIFICATION" />
            <asp:BoundField DataField="C_DESCRIPTION" HeaderText="C_DESCRIPTION" 
                SortExpression="C_DESCRIPTION" />
            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" />
            <asp:BoundField DataField="BIRTHDATE" HeaderText="BIRTHDATE" 
                SortExpression="BIRTHDATE" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="GENDER" HeaderText="GENDER" 
                SortExpression="GENDER" />
            <asp:BoundField DataField="PHONE_NO" HeaderText="PHONE_NO" 
                SortExpression="PHONE_NO" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" 
                SortExpression="ADDRESS" />
        </Columns>
    </asp:GridView>
    </br>
    <asp:SqlDataSource ID="candidate_info" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [CANDIDATE] WHERE [C_ID] = @original_C_ID AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND [C_NAME] = @original_C_NAME AND (([C_AGE] = @original_C_AGE) OR ([C_AGE] IS NULL AND @original_C_AGE IS NULL)) AND [C_QUALIFICATION] = @original_C_QUALIFICATION AND (([C_DESCRIPTION] = @original_C_DESCRIPTION) OR ([C_DESCRIPTION] IS NULL AND @original_C_DESCRIPTION IS NULL)) AND (([PID] = @original_PID) OR ([PID] IS NULL AND @original_PID IS NULL)) AND (([PROFILE_PIC] = @original_PROFILE_PIC) OR ([PROFILE_PIC] IS NULL AND @original_PROFILE_PIC IS NULL)) AND (([BIRTHDATE] = @original_BIRTHDATE) OR ([BIRTHDATE] IS NULL AND @original_BIRTHDATE IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([ADDRESS] = @original_ADDRESS) OR ([ADDRESS] IS NULL AND @original_ADDRESS IS NULL))" 
        InsertCommand="INSERT INTO [CANDIDATE] ([C_ID], [CONS_ID], [C_NAME], [C_AGE], [C_QUALIFICATION], [C_DESCRIPTION], [PID], [PROFILE_PIC], [BIRTHDATE], [EMAIL], [GENDER], [PHONE_NO], [ADDRESS]) VALUES (@C_ID, @CONS_ID, @C_NAME, @C_AGE, @C_QUALIFICATION, @C_DESCRIPTION, @PID, @PROFILE_PIC, @BIRTHDATE, @EMAIL, @GENDER, @PHONE_NO, @ADDRESS)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [CANDIDATE]" 
        UpdateCommand="UPDATE [CANDIDATE] SET [CONS_ID] = @CONS_ID, [C_NAME] = @C_NAME, [C_AGE] = @C_AGE, [C_QUALIFICATION] = @C_QUALIFICATION, [C_DESCRIPTION] = @C_DESCRIPTION, [PID] = @PID, [PROFILE_PIC] = @PROFILE_PIC, [BIRTHDATE] = @BIRTHDATE, [EMAIL] = @EMAIL, [GENDER] = @GENDER, [PHONE_NO] = @PHONE_NO, [ADDRESS] = @ADDRESS WHERE [C_ID] = @original_C_ID AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND [C_NAME] = @original_C_NAME AND (([C_AGE] = @original_C_AGE) OR ([C_AGE] IS NULL AND @original_C_AGE IS NULL)) AND [C_QUALIFICATION] = @original_C_QUALIFICATION AND (([C_DESCRIPTION] = @original_C_DESCRIPTION) OR ([C_DESCRIPTION] IS NULL AND @original_C_DESCRIPTION IS NULL)) AND (([PID] = @original_PID) OR ([PID] IS NULL AND @original_PID IS NULL)) AND (([PROFILE_PIC] = @original_PROFILE_PIC) OR ([PROFILE_PIC] IS NULL AND @original_PROFILE_PIC IS NULL)) AND (([BIRTHDATE] = @original_BIRTHDATE) OR ([BIRTHDATE] IS NULL AND @original_BIRTHDATE IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([ADDRESS] = @original_ADDRESS) OR ([ADDRESS] IS NULL AND @original_ADDRESS IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_C_ID" Type="Decimal" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_C_NAME" Type="String" />
            <asp:Parameter Name="original_C_AGE" Type="Decimal" />
            <asp:Parameter Name="original_C_QUALIFICATION" Type="String" />
            <asp:Parameter Name="original_C_DESCRIPTION" Type="String" />
            <asp:Parameter Name="original_PID" Type="Decimal" />
            <asp:Parameter Name="original_PROFILE_PIC" Type="Object" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_ADDRESS" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="C_ID" Type="Decimal" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="C_NAME" Type="String" />
            <asp:Parameter Name="C_AGE" Type="Decimal" />
            <asp:Parameter Name="C_QUALIFICATION" Type="String" />
            <asp:Parameter Name="C_DESCRIPTION" Type="String" />
            <asp:Parameter Name="PID" Type="Decimal" />
            <asp:Parameter Name="PROFILE_PIC" Type="Object" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="C_NAME" Type="String" />
            <asp:Parameter Name="C_AGE" Type="Decimal" />
            <asp:Parameter Name="C_QUALIFICATION" Type="String" />
            <asp:Parameter Name="C_DESCRIPTION" Type="String" />
            <asp:Parameter Name="PID" Type="Decimal" />
            <asp:Parameter Name="PROFILE_PIC" Type="Object" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="original_C_ID" Type="Decimal" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_C_NAME" Type="String" />
            <asp:Parameter Name="original_C_AGE" Type="Decimal" />
            <asp:Parameter Name="original_C_QUALIFICATION" Type="String" />
            <asp:Parameter Name="original_C_DESCRIPTION" Type="String" />
            <asp:Parameter Name="original_PID" Type="Decimal" />
            <asp:Parameter Name="original_PROFILE_PIC" Type="Object" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_ADDRESS" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </br>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [PARTY] WHERE [PID] = @original_PID AND [PNAME] = @original_PNAME AND (([PSYMBOL] = @original_PSYMBOL) OR ([PSYMBOL] IS NULL AND @original_PSYMBOL IS NULL))" 
    InsertCommand="INSERT INTO [PARTY] ([PID], [PNAME], [PSYMBOL]) VALUES (@PID, @PNAME, @PSYMBOL)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [PARTY]" 
    UpdateCommand="UPDATE [PARTY] SET [PNAME] = @PNAME, [PSYMBOL] = @PSYMBOL WHERE [PID] = @original_PID AND [PNAME] = @original_PNAME AND (([PSYMBOL] = @original_PSYMBOL) OR ([PSYMBOL] IS NULL AND @original_PSYMBOL IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_PID" Type="Decimal" />
        <asp:Parameter Name="original_PNAME" Type="String" />
        <asp:Parameter Name="original_PSYMBOL" Type="Object" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="PID" Type="Decimal" />
        <asp:Parameter Name="PNAME" Type="String" />
        <asp:Parameter Name="PSYMBOL" Type="Object" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="PNAME" Type="String" />
        <asp:Parameter Name="PSYMBOL" Type="Object" />
        <asp:Parameter Name="original_PID" Type="Decimal" />
        <asp:Parameter Name="original_PNAME" Type="String" />
        <asp:Parameter Name="original_PSYMBOL" Type="Object" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="VID" DataSourceID="voter_info">
        <Columns>
            <asp:BoundField DataField="VID" HeaderText="VID" ReadOnly="True" 
                SortExpression="VID" />
            <asp:BoundField DataField="V_NAME" HeaderText="V_NAME" 
                SortExpression="V_NAME" />
            <asp:BoundField DataField="CONS_ID" HeaderText="CONS_ID" 
                SortExpression="CONS_ID" />
            <asp:BoundField DataField="VADDRESS" HeaderText="VADDRESS" 
                SortExpression="VADDRESS" />
            <asp:BoundField DataField="VEMAILID" HeaderText="VEMAILID" 
                SortExpression="VEMAILID" />
            <asp:BoundField DataField="VPASSWORD" HeaderText="VPASSWORD" 
                SortExpression="VPASSWORD" />
            <asp:BoundField DataField="PHONE_NO" HeaderText="PHONE_NO" 
                SortExpression="PHONE_NO" />
            <asp:BoundField DataField="GENDER" HeaderText="GENDER" 
                SortExpression="GENDER" />
            <asp:BoundField DataField="BIRTHDATE" HeaderText="BIRTHDATE" 
                SortExpression="BIRTHDATE" />
            <asp:BoundField DataField="VAGE" HeaderText="VAGE" SortExpression="VAGE" />
        </Columns>
    </asp:GridView>
    </br>
    <asp:SqlDataSource ID="voter_info" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [VOTERINFO] WHERE [VID] = @original_VID AND [V_NAME] = @original_V_NAME AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND (([VADDRESS] = @original_VADDRESS) OR ([VADDRESS] IS NULL AND @original_VADDRESS IS NULL)) AND [VEMAILID] = @original_VEMAILID AND (([VPASSWORD] = @original_VPASSWORD) OR ([VPASSWORD] IS NULL AND @original_VPASSWORD IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND (([BIRTHDATE] = @original_BIRTHDATE) OR ([BIRTHDATE] IS NULL AND @original_BIRTHDATE IS NULL)) AND (([VAGE] = @original_VAGE) OR ([VAGE] IS NULL AND @original_VAGE IS NULL)) AND (([PROFILE_PIC] = @original_PROFILE_PIC) OR ([PROFILE_PIC] IS NULL AND @original_PROFILE_PIC IS NULL))" 
        InsertCommand="INSERT INTO [VOTERINFO] ([VID], [V_NAME], [CONS_ID], [VADDRESS], [VEMAILID], [VPASSWORD], [PHONE_NO], [GENDER], [BIRTHDATE], [VAGE], [PROFILE_PIC]) VALUES (@VID, @V_NAME, @CONS_ID, @VADDRESS, @VEMAILID, @VPASSWORD, @PHONE_NO, @GENDER, @BIRTHDATE, @VAGE, @PROFILE_PIC)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [VOTERINFO]" 
        UpdateCommand="UPDATE [VOTERINFO] SET [V_NAME] = @V_NAME, [CONS_ID] = @CONS_ID, [VADDRESS] = @VADDRESS, [VEMAILID] = @VEMAILID, [VPASSWORD] = @VPASSWORD, [PHONE_NO] = @PHONE_NO, [GENDER] = @GENDER, [BIRTHDATE] = @BIRTHDATE, [VAGE] = @VAGE, [PROFILE_PIC] = @PROFILE_PIC WHERE [VID] = @original_VID AND [V_NAME] = @original_V_NAME AND (([CONS_ID] = @original_CONS_ID) OR ([CONS_ID] IS NULL AND @original_CONS_ID IS NULL)) AND (([VADDRESS] = @original_VADDRESS) OR ([VADDRESS] IS NULL AND @original_VADDRESS IS NULL)) AND [VEMAILID] = @original_VEMAILID AND (([VPASSWORD] = @original_VPASSWORD) OR ([VPASSWORD] IS NULL AND @original_VPASSWORD IS NULL)) AND (([PHONE_NO] = @original_PHONE_NO) OR ([PHONE_NO] IS NULL AND @original_PHONE_NO IS NULL)) AND (([GENDER] = @original_GENDER) OR ([GENDER] IS NULL AND @original_GENDER IS NULL)) AND (([BIRTHDATE] = @original_BIRTHDATE) OR ([BIRTHDATE] IS NULL AND @original_BIRTHDATE IS NULL)) AND (([VAGE] = @original_VAGE) OR ([VAGE] IS NULL AND @original_VAGE IS NULL)) AND (([PROFILE_PIC] = @original_PROFILE_PIC) OR ([PROFILE_PIC] IS NULL AND @original_PROFILE_PIC IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_VID" Type="Decimal" />
            <asp:Parameter Name="original_V_NAME" Type="String" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_VADDRESS" Type="String" />
            <asp:Parameter Name="original_VEMAILID" Type="String" />
            <asp:Parameter Name="original_VPASSWORD" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_VAGE" Type="Decimal" />
            <asp:Parameter Name="original_PROFILE_PIC" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VID" Type="Decimal" />
            <asp:Parameter Name="V_NAME" Type="String" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="VADDRESS" Type="String" />
            <asp:Parameter Name="VEMAILID" Type="String" />
            <asp:Parameter Name="VPASSWORD" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="VAGE" Type="Decimal" />
            <asp:Parameter Name="PROFILE_PIC" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="V_NAME" Type="String" />
            <asp:Parameter Name="CONS_ID" Type="Decimal" />
            <asp:Parameter Name="VADDRESS" Type="String" />
            <asp:Parameter Name="VEMAILID" Type="String" />
            <asp:Parameter Name="VPASSWORD" Type="String" />
            <asp:Parameter Name="PHONE_NO" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="VAGE" Type="Decimal" />
            <asp:Parameter Name="PROFILE_PIC" Type="Object" />
            <asp:Parameter Name="original_VID" Type="Decimal" />
            <asp:Parameter Name="original_V_NAME" Type="String" />
            <asp:Parameter Name="original_CONS_ID" Type="Decimal" />
            <asp:Parameter Name="original_VADDRESS" Type="String" />
            <asp:Parameter Name="original_VEMAILID" Type="String" />
            <asp:Parameter Name="original_VPASSWORD" Type="String" />
            <asp:Parameter Name="original_PHONE_NO" Type="String" />
            <asp:Parameter Name="original_GENDER" Type="String" />
            <asp:Parameter Name="original_BIRTHDATE" Type="DateTime" />
            <asp:Parameter Name="original_VAGE" Type="Decimal" />
            <asp:Parameter Name="original_PROFILE_PIC" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </br>
</asp:Content>

