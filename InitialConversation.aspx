<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialConversation.aspx.cs" Inherits="WalkerS_Lab1Part3.AddCustomer" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1 class="display-4">Initial Conversation</h1>
        <h1 class="display-6">Initial Conversation</h1>
    <asp:Table
        ID="TblAddCustomer"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblFirstName"
                    runat="server"
                    Text="First Name:">
                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtFirstName"
                    runat="server"
                    Text="">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvFirstName"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtFirstName"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>

                <asp:Label
                    ID="LblLastName"
                    runat="server"
                    Text="Last Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtLastName"
                    runat="server"
                    Text="">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvLastName"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtLastName"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblPhoneNumber"
                    runat="server"
                    Text="Home Phone: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="5">
                <asp:TextBox
                    ID="TxtPhoneNumber"
                    runat="server"
                    Text=""></asp:TextBox>

                <asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text=" Cell Phone: "></asp:Label>

                <asp:TextBox
                    ID="TxtCellPhone"
                    runat="server"
                    Text=""></asp:TextBox>

                <asp:Label
                    ID="LblWorkPhone"
                    runat="server"
                    Text=" Work Phone: "></asp:Label>

                <asp:TextBox
                    ID="TxtWorkPhone"
                    runat="server"
                    Text=""></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblEmail"
                    runat="server"
                    Text="Email:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtEmail"
                    runat="server"
                    Text=""
                    TextMode="Email">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvEmail"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtEmail"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>

    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="LblPCA" runat="server" Text="Primary Contact Address" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblStreet" runat="server" Text="Street Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtStreet" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCity" runat="server" Text="City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblState" runat="server" Text="State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblZip" runat="server" Text="Zip Code: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>
    
    <asp:Table
        ID="Table1"
        runat="server">
          <asp:TableRow>
            <asp:TableCell ColumnSpan="10">
                <asp:Label
                    ID="LblInstructions"
                    runat="server"
                    Text="Please Select The Service(s) You Are Interested In:"
                    Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="100px">
                <asp:CheckBox AutoPostBack="true"
                    ID="ChkBoxMove"
                    runat="server"
                    Text="Move"
                    OnCheckedChanged="ChkBoxMove_CheckedChanged" />
            </asp:TableCell>
            <asp:TableCell Width="100px">
                <asp:CheckBox AutoPostBack="true"
                    ID="ChkBoxAuction"
                    runat="server"
                    Text="Auction"
                    OnCheckedChanged="ChkBoxAuction_CheckedChanged" />
            </asp:TableCell>
           
         
        </asp:TableRow>
        <asp:TableRow >
            <asp:TableCell Width="200px">
                <asp:CheckBox
                    ID="ChkBoxConsignment"
                    runat="server"
                    Text="Consignment" />
            </asp:TableCell>
            <asp:TableCell Width="100px">
                <asp:CheckBox
                    ID="ChkBoxAppraisal"
                    runat="server"
                    Text="Appraisal" />
            </asp:TableCell>
           
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label 
                    ID="LblHowMany"
                    runat="server"
                    Text="How Many Items For Sale?" 
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox 
                    ID="TxtHowMany" 
                    runat="server"
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label 
                    ID="LblDescriptions" 
                    runat="server" 
                    Text="What Do You Have To Sell?" 
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDescriptions" 
                    runat="server"
                    TextMode="MultiLine"
                    Rows="5" 
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label 
                    ID="LblDownsizing" 
                    runat="server" 
                    Text="Are You Downsizing?"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxDownsizing" 
                    runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblEstate" 
                    runat="server" 
                    Text="Are You Settling An Estate?"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxEstate"
                    runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblItemTransport"
                    runat="server"
                    Text="Item Transport Options?"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlItemTransport"
                    runat="server">
                    <asp:ListItem Value="Select">Select</asp:ListItem>
                    <asp:ListItem>We Pick-Up Your Item(s)</asp:ListItem>
                    <asp:ListItem>You Drop-Off Your Item(s)</asp:ListItem>
                    <asp:ListItem>Unsure</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    
    <asp:Table
        ID="Table3"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
                         <asp:Label 
                             runat="server"
                             Text="Prefered Contact:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlInitialContact"
                    runat="server"
                    OnSelectedIndexChanged="DdlInitialContact_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label
                    ID="LblOther"
                    runat="server"
                    Text="Other: "></asp:Label>
                <asp:TextBox
                    ID="TxtOther"
                    runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RfvInitialContact"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlInitialContact"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblReferral"
                    runat="server"
                    Text="Referral:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtReferral"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvReferral"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtReferral"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDeadline"
                    runat="server"
                    Text="Deadline:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDeadline"
                    runat="server"
                    TextMode="Date"></asp:TextBox>
            </asp:TableCell>
          <%--  <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvDeadline"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtDeadline"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </asp:TableCell>--%>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDeadlineEnd"
                    runat="server"
                    Text="Deadline End:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDeadlineEnd"
                    runat="server"
                    TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        <%--    <asp:TableCell>
                <asp:CompareValidator
                    ID="CvDeadlineCompare"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Display="Dynamic"
                    ControlToValidate="TxtDeadlineEnd"
                    ControlToCompare="TxtDeadline"
                    Type="Date"
                    Operator="GreaterThanEqual"
                    Text="Deadline End Must Be After Deadline Start"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:CompareValidator>
            </asp:TableCell>--%>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblCompletedByEmp"
                    runat="server"
                    Text="Completed By:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlCompletedByEmp"
                    runat="server"
                    DataSourceID="dtasrcEmpList"
                    DataTextField="EmpName"
                    DataValueField="EmployeeID"
                    OnDataBound="DdlCompletedByEmp_DataBound"></asp:DropDownList>
            </asp:TableCell>
               <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvCompletedByEmp"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlCompletedByEmp"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
             <asp:TableCell>
                <asp:Label 
                    ID="LblCustomerNotes"
                    runat="server" 
                    Text="Customer Notes:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                 <asp:TextBox
                    ID="TxtCustomerNotes" 
                    runat="server"
                    TextMode="MultiLine"
                    Rows="5"
                     ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblCompleted"
                    runat="server"
                    Text="Check If Complete:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox
                    ID="ChkBoxCompleted"
                    runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table
        ID="TblAddCustomerBtns"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnViewCustomerPage"
                    runat="server"
                    Text="View Customers ->"
                    OnClick="BtnViewCustomerPage_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnPopulate"
                    runat="server"
                    Text="Populate"
                    OnClick="BtnPopulate_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button
                    ID="BtnClear"
                    runat="server"
                    Text="Clear"
                    OnClick="BtnClear_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button
                    ID="BtnSave"
                    runat="server"
                    Text="Save"
                    OnClick="BtnSave_Click"
                    ValidationGroup="SaveGroup" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label
                    ID="LblSaveStatus"
                    runat="server"
                    Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button
                    ID="BtnProceed"
                    runat="server"
                    Text="Proceed to Service Order Form" 
                    OnClick="BtnProceed_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcEmpList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName 'EmpName' from EMPLOYEE Order By EmpLastName Desc"></asp:SqlDataSource>

    
</asp:Content>

