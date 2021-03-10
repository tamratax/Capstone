<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="WalkerS_Lab1Part3.AddCustomer" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1>Add Customer</h1>
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
            <asp:TableCell ColumnSpan ="5">
                <asp:TextBox
                    ID="TxtPhoneNumber"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
           
                <asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text=" Cell Phone: "></asp:Label>
           
                <asp:TextBox
                    ID="TxtCellPhone"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
        
                <asp:Label
                    ID="LblWorkPhone"
                    runat="server"
                    Text=" Work Phone: "></asp:Label>
         
                <asp:TextBox
                    ID="TxtWorkPhone"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
            </asp:TableCell>
        
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblPhoneType"
                    runat="server"
                    Text="Phone Type:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlPhoneType"
                    runat="server">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvPhoneType"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlPhoneType"
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
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblInterestedIn"
                    runat="server"
                    Text="Interested In:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlInterestedIn"
                    runat="server"
                    OnSelectedIndexChanged="DdlInterestedIn_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvInterestedIn"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlInterestedIn"
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
                    ID="LblOriginStreet"
                    runat="server"
                    Text="Origin Street:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtOriginStreet"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvOriginStreet"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtOriginStreet"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblOriginCity"
                    runat="server"
                    Text="Origin City:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtOriginCity"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvOriginCity"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtOriginCity"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblOriginState"
                    runat="server"
                    Text="Origin State:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtOriginState"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvOriginState"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtOriginState"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDestinationStreet"
                    runat="server"
                    Text="Destination Street:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDestinationStreet"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDestinationCity"
                    runat="server"
                    Text="Destination City:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDestinationCity"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblDestinationState"
                    runat="server"
                    Text="Destination State:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDestinationState"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                         <asp:Label 
                             runat="server"
                             Text="Initial Contact:"></asp:Label>
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
                    ID="LblTotalEarnings"
                    runat="server"
                    Text="Total Earnings:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtTotalEarnings"
                    runat="server"
                    Text="">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvTotalEarnings"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtTotalEarnings"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    ID="CvTotalEarnings"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Text="Invalid Number"
                    ForeColor="Red"
                    ControlToValidate="TxtTotalEarnings"
                    Operator="DataTypeCheck"
                    Type="Double"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"></asp:CompareValidator>
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
            <asp:TableCell>
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
            </asp:TableCell>
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
            <asp:TableCell>
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
        </asp:TableRow>

    </asp:Table>
</asp:Content>
