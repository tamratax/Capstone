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
            <asp:TableCell ColumnSpan="3">
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
                    OnDataBound="ddlCustomerList_DataBound"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCustomerList_SelectedIndexChanged">
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

    </asp:Table>

    <asp:Table ID="Table4" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <fieldset>
                    <asp:Table ID="Table5" runat="server">

                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblHomePhone"
                                    runat="server"
                                    Text="Home Phone: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="5">
                                <asp:Label ID="LblHomeNumber"
                                    runat="server"
                                    Text=""
                                    Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblCellPhone"
                                    runat="server"
                                    Text="   Cell Phone: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblCellNumber"
                                    runat="server"
                                    Text=""
                                    Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                            </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblWorkPhone"
                                    runat="server"
                                    Text="   Work Phone: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblWorkNumber"
                                    runat="server"
                                    Text=""
                                    Font-Bold="true"></asp:Label>
                            </asp:TableCell>


                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblEmail"
                                    runat="server"
                                    Text="Email:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="10">
                                <asp:Label
                                    ID="LblEmailText"
                                    runat="server"
                                    Text=""
                                    Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>




    <asp:Table ID="Table3" runat="server">
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
    </asp:Table>
    <asp:Table
        ID="Table2"
        runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4">
                <asp:GridView ID="GridAddress"
                    runat="server"
                    DataSourceID="dtasrcAddress"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    DataKeyNames="AddressID"
                    CellPadding="3">

                    <Columns>
                        <asp:BoundField DataField="AddressID" Visible="false" />
                        <asp:BoundField DataField="Street" HeaderText="Street" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="State" HeaderText="State" />
                        <asp:BoundField DataField="Zip" HeaderText="Zip" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />

                    </Columns>
                </asp:GridView>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="LblPCA" runat="server" Text="Primary Contact Address" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblStreet"
                    runat="server"
                    Text="Street: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtStreet"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="TxtStreet"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateAddress"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCity"
                    runat="server"
                    Text="City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCity"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblState"
                    runat="server"
                    Text="State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtState"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblZip"
                    runat="server"
                    Text="Zip Code: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtZip"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblDescription"
                    runat="server"
                    Text="Description: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDescription"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnAddAddress"
                    runat="server"
                    Text="Add Address"
                    OnClick="BtnAddAddress_Click"
                    CausesValidation="false" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table1" runat="server">
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
                    ID="LblDestinationTime"
                    runat="server"
                    Text="Destination Time:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtDestinationTime"
                    runat="server" TextMode="Time"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblAdditionalServices" runat="server" Text="Select Additional Services:" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:CheckBox ID="ChkBxStorage" runat="server" Text="Storage" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox ID="ChkBxCleaning" runat="server" Text="Cleaning" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox ID="ChkBxTrashRemoval" runat="server" Text="Trash Removal" />

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
            <asp:TableCell>
                <asp:Button ID="BtnAuctionInvt" runat="server" Text="Add Auction Inventory ->" OnClick="BtnAuctionInvt_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnMoveInvt" runat="server" Text="Add Move Inventory ->" OnClick="BtnMoveInvt_Click" />
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

    <asp:SqlDataSource ID="dtasrcAddress"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT * from Address join customer on Customer.CustomerID = Address.CustomerID where Customer.CustomerID = @CustomerID"
        DeleteCommand="DELETE ADDRESS where AddressID = @AddressID"
        UpdateCommand="UPDATE ADDRESS set Street = @Street, City = @City, State = @State, Zip = @Zip, Description = @Description where AddressID = @AddressID">
        <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="ddlCustomerList" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
