<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceOrder.aspx.cs" Inherits="WalkerS_Lab1Part3.AddService" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <h1>Service Order</h1>

    <h4>Customer Info:</h4>
    <div class="groupCust">
        <asp:Label ID="LblCust" runat="server" Text="Customer Name: "></asp:Label>
        &nbsp;
    <asp:Label ID="LblCustName" runat="server" Text=""></asp:Label>

        <div>
            <asp:Label
                ID="LblHomePhone"
                runat="server"
                Text="Home Phone: "></asp:Label>

            <asp:Label ID="LblHomeNumber"
                runat="server"
                Text=""
                Font-Bold="true"></asp:Label>
            <br />
            <asp:Label
                ID="LblCellPhone"
                runat="server"
                Text="   Cell Phone: "></asp:Label>

            <asp:Label
                ID="LblCellNumber"
                runat="server"
                Text=""
                Font-Bold="true"></asp:Label>
            <br />
            <asp:Label
                ID="LblWorkPhone"
                runat="server"
                Text="   Work Phone: "></asp:Label>

            <asp:Label
                ID="LblWorkNumber"
                runat="server"
                Text=""
                Font-Bold="true"></asp:Label>
            <br />
            <asp:Label
                ID="LblEmail"
                runat="server"
                Text="Email:"></asp:Label>

            <asp:Label
                ID="LblEmailText"
                runat="server"
                Text=""
                Font-Bold="true"></asp:Label>
        </div>
           <div>
                <asp:GridView ID="GridAddress"
                    runat="server"
                    DataSourceID="dtasrcAddress"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    DataKeyNames="AddressID"
                    CsssClass="table justify-content-center">
                    <Columns>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />
                        <asp:BoundField DataField="AddressID" Visible="false" />
                        <asp:BoundField DataField="Street" HeaderText="Street" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="State" HeaderText="State" />
                        <asp:BoundField DataField="Zip" HeaderText="Zip" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <br />
    </div>
     <h5>Additional Address for Service</h5>
    <div class="form-group">
        <label for="inputAddress">Street</label>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder="1234 Main St"
            class="form-control"></asp:TextBox>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <asp:TextBox ID="TxtCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <asp:TextBox ID="TxtState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <asp:TextBox ID="TxtZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label for="inputDescription">Description</label>
        <asp:TextBox ID="TxtDescription"
            runat="server"
            class="form-control"
            placeholder="Description"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="BtnAddAddress"
            runat="server"
            Text="Add Address"
            OnClick="BtnAddAddress_Click"
            CausesValidation="false" />
    </div>
    <br />
    <div class="form-group">
        <label>Initiating Employee:</label>
        <asp:DropDownList
            ID="DdlInitiatingEmp"
            runat="server"
            DataSourceID="dtasrcEmployeeContact"
            DataTextField="EmployeeName"
            DataValueField="EmployeeID"
            OnDataBound="DdlInitiatingEmp_DataBound" Width="100%">
        </asp:DropDownList>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label>Potential Date</label>
            <asp:TextBox ID="TxtPotentialDate"
                runat="server"
                TextMode="Date"
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label>Potential Time</label>
            <asp:TextBox ID="TxtPotentialTime"
                runat="server"
                TextMode="Time"
                class="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <label>Service Date</label>
            <asp:TextBox
                ID="TxtServiceDate"
                runat="server"
                Text=""
                TextMode="Date"
                class="form-control">
            </asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label>Completion Date</label>
            <asp:TextBox
                ID="TxtCompletionDate"
                runat="server"
                Text=""
                TextMode="Date"
                class="form-control">
            </asp:TextBox>
        </div>
    </div>


    <div class="form-group">
        <label>Service Type</label>
        <asp:DropDownList
            ID="DdlServiceType"
            runat="server"
            OnSelectedIndexChanged="DdlServiceType_SelectedIndexChanged"
            AutoPostBack="true"
            class="form-control">
        </asp:DropDownList>
    </div>
    <div>
        <div class="form-group col-md-6"></div>
        <asp:Label
            ID="LblDestinationTime"
            runat="server"
            Text="Destination Time:"></asp:Label>

        <asp:TextBox
            ID="TxtDestinationTime"
            runat="server" TextMode="Time"></asp:TextBox>
    </div>


    <asp:CheckBox
        ID="ChkBoxLookAt"
        runat="server"
        Text=" Require A Look At?"
        AutoPostBack="true"
        OnCheckedChanged="ChkBoxLookAt_CheckedChanged" />

    <asp:TextBox
        ID="TxtLookAtSchedule"
        runat="server"
        Visible="false"
        TextMode="Date"
        AutoPostBack="true"></asp:TextBox>

    <asp:TextBox
        ID="TxtLookatScheduleTime"
        Visible="false"
        AutoPostBack="true"
        TextMode="Time"
        runat="server"></asp:TextBox>
    <div>
        <asp:Label ID="LblAdditionalServices" runat="server" Text="Select Additional Services:" Font-Bold="true"></asp:Label>

        <asp:CheckBox ID="ChkBxStorage" runat="server" Text="Storage" />

        <asp:CheckBox ID="ChkBxCleaning" runat="server" Text="Cleaning" />

        <asp:CheckBox ID="ChkBxTrashRemoval" runat="server" Text="Trash Removal" />
    </div>
    <div>
        <asp:Label
            ID="LblCompleted"
            runat="server"
            Text="Check If Complete:"></asp:Label>

        <asp:CheckBox
            ID="ChkBoxCompleted"
            runat="server" />
    </div>

    <div class="form-row float-left">
        <asp:Button ID="BtnViewServicePage"
            runat="server"
            Text="View Services ->"
            OnClick="BtnViewServicePage_Click" />

        <asp:Button ID="BtnPopulate"
            runat="server"
            Text="Populate"
            OnClick="BtnPopulate_Click"
            AutoPostBack="true" />

        <asp:Button
            ID="BtnClear"
            runat="server"
            Text="Clear"
            OnClick="BtnClear_Click" />

        <asp:Button
            ID="BtnSave"
            runat="server"
            Text="Save"
            OnClick="BtnSave_Click"
            ValidationGroup="SaveGroup" />

        <asp:Button ID="BtnAuctionInvt"
            runat="server"
            Text="Add Auction Inventory ->"
            OnClick="BtnAuctionInvt_Click" />

        <asp:Button ID="BtnMoveInvt"
            runat="server"
            Text="Add Move Inventory ->"
            OnClick="BtnMoveInvt_Click" />
    </div>

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

    <asp:RequiredFieldValidator
        ID="rfvServiceDate"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="TxtServiceDate"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>

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

    <%--<asp:GridView ID="GridAddress"
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
                </asp:GridView>--%>


    <div>
        <asp:Label
            ID="LblRequestDescription"
            runat="server"
            Text=""
            Font-Bold="true"
            BackColor="Yellow"></asp:Label>
    </div>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
        runat="server"
        ControlToValidate="TxtStreet"
        Text="Field Cannot Be Blank"
        ForeColor="Red"
        ValidationGroup="CreateAddress"></asp:RequiredFieldValidator>

    <asp:Label
        ID="LblSaveStatus"
        runat="server"
        Text=""></asp:Label>

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
            <asp:SessionParameter Name="CustomerID" SessionField="SelectedCustomerID" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
