<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceOrder.aspx.cs" Inherits="WalkerS_Lab1Part3.AddService" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1>Service Order</h1>
    <asp:Table ID="TblAddService" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblPotentialDate" runat="server" Text="Potential Date/Time: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtPotentialDate" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtPotentialTime" runat="server" TextMode="Time"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table
        ID="TblAddCustomer"
        runat="server">
        <asp:TableRow>
              <asp:TableCell ColumnSpan ="3">
                <asp:Label 
                    ID="LblRequestDescription"
                    runat="server" 
                    Text=""
                    Font-Bold="true"
                    BackColor="Yellow"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label 
                    ID="LblInitiatingEmp" 
                    runat="server" 
                    Text="Initiating Employee:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlInitiatingEmp"
                    runat="server"
                    DataSourceID="dtasrcEmployeeContact"
                    DataTextField="EmployeeName"
                    DataValueField="EmployeeID"
                    OnDataBound="DdlInitiatingEmp_DataBound">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvEmployeeList"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="ddlInitiatingEmp"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblChooseCustomer"
                    runat="server"
                    Text="Choose Customer:">
                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="ddlCustomerList"
                    runat="server"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    OnDataBound="ddlCustomerList_DataBound">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvCustomerList"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="ddlCustomerList"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label 
                    ID="LblTicketStatus"
                    runat="server" 
                    Text="Ticket Status:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtTicketStatus"
                    runat="server">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvTicketStatus"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtTicketStatus"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblServiceDate"
                    runat="server"
                    Text="Service Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtServiceDate"
                    runat="server"
                    Text=""
                    TextMode="Date">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="rfvServiceDate"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtServiceDate"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblCompletionDate"
                    runat="server"
                    Text="Completion Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtCompletionDate"
                    runat="server"
                    Text=""
                    TextMode="Date">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="rfvCompletionDate"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtCompletionDate"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator 
                    ID="CvDateComapare" 
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Display="Dynamic"
                    ControlToValidate="TxtCompletionDate"
                    ControlToCompare="TxtServiceDate"
                    Type="Date"
                    Operator="GreaterThanEqual"
                    Text="Completion Date Must Be After Service Date"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:CompareValidator>
            </asp:TableCell>
            
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblServiceCost"
                    runat="server"
                    Text="Service Cost:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtServiceCost"
                    runat="server"
                    Text="">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="rfvServiceCost"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtServiceCost"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="CvServiceCost"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Text="Invalid Number"
                    ForeColor="Red"
                    ControlToValidate="TxtServiceCost"
                    Operator="DataTypeCheck"
                    Type="Double"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblServiceType"
                    runat="server"
                    Text="Service Type:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlServiceType"
                    runat="server"
                    OnSelectedIndexChanged="DdlServiceType_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvServiceType"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlServiceType"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:CheckBox
                    ID="ChkBoxLookAt" 
                    runat="server" 
                    Text=" Require A Look At?"
                    AutoPostBack="true"
                    OnCheckedChanged="ChkBoxLookAt_CheckedChanged" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtLookAtSchedule"
                    runat="server" 
                    Visible="false" 
                    TextMode="Date" 
                    AutoPostBack="true"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox 
                    ID="TxtLookatScheduleTime" 
                    Visible="false" 
                    AutoPostBack="true"
                    TextMode="Time" 
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblEmployeeContact"
                    runat="server"
                    Text="Employee Contact:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlEmployeeContact"
                    runat="server"
                    DataSourceID="dtasrcEmployeeContact"
                    DataTextField="EmployeeName"
                    DataValueField="EmployeeID"
                    OnDataBound="DdlEmployeeContact_DataBound">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvEmployeeContact"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlEmployeeContact"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDestinationTime"
                    runat="server"
                    Text="Destination Time:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDestinationTime"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvDestinationTime"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtDestinationTime"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblGasExpense"
                    runat="server"
                    Text="Gas Expense:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtGasExpense"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvGasExpense"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtGasExpense"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="CvGasExpense"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Text="Invalid Number"
                    ForeColor="Red"
                    ControlToValidate="TxtGasExpense"
                    Operator="DataTypeCheck"
                    Type="Double"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblMiscExpense"
                    runat="server"
                    Text="Misc Expense:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtMiscExpense"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvMiscExpense"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtMiscExpense"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="CvMiscExpense"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Text="Invalid Number"
                    ForeColor="Red"
                    ControlToValidate="TxtMiscExpense"
                    Operator="DataTypeCheck"
                    Type="Double"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:CompareValidator>
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
                <asp:Button ID="BtnViewServicePage"
                    runat="server"
                    Text="View Services ->"
                    OnClick="BtnViewServicePage_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnPopulate"
                    runat="server"
                    Text="Populate"
                    OnClick="BtnPopulate_Click"
                    AutoPostBack="true" />
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
        </asp:TableRow>

    </asp:Table>

    <asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dtasrcEmployeeContact"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName
                    from Employee Order By EmpLastName ASC"></asp:SqlDataSource>

</asp:Content>
