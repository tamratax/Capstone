<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveServiceOrderForm.aspx.cs" Inherits="Lab3.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <div class="row justify-content-center">
    <h1 class="display-4">Move Service Order</h1>
    </div>
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
        <div>
            <asp:Label ID="lblServ" runat="server" Text="Select Service: "></asp:Label>
            <asp:DropDownList
                ID="ddlService"
                runat="server"
                OnDataBound="ddlService_DataBound"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <div class="float-right">
        <asp:Button ID="PopBtn" runat="server" Text="Populate" OnClick="PopBtn_Click" />
    </div>
    <br />
    <div class="form-row">
        <div class="form-group col-md-6">
            <label>Potential Date</label>
            <asp:TextBox ID="TxtPotentialDate"
                runat="server"
                TextMode="Date"
                class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtPotentialDate" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group col-md-6">
            <label>Potential Time</label>
            <asp:TextBox ID="TxtPotentialTime"
                runat="server"
                TextMode="Time"
                class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtPotentialTime" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label>Street</label>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder=""
            class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtStreet" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <asp:TextBox ID="TxtCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtCity" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <asp:TextBox ID="TxtState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtState" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <asp:TextBox ID="TxtZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtZip" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>
          <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ValidationGroup="addy" ControlToValidate="TxtZip" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text="Please only use numbers"></asp:CompareValidator>

          
          

        </div>
    </div>
    <div class="form-group">
        <label for="inputDescription">Description</label>
        <asp:TextBox ID="TxtDescription"
            runat="server"
            class="form-control"
            placeholder="Description"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtDescription" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

    </div>
    <asp:Button ID="BtnAddOrigin"
        runat="server"
        Text="Add Address"
        OnClick="BtnAddOrigin_Click"
         ValidationGroup="addy"/>



    <br />
    <br />
    <h4>Assign Crew</h4>
    <div class="form-group">
        <label>Employees:</label>
        <asp:DropDownList
            ID="DdlInitiatingEmp"
            runat="server"
            DataSourceID="dtasrcEmployee"
            DataTextField="EmployeeName"
            DataValueField="EmployeeID"
            OnDataBound="DdlInitiatingEmp_DataBound" Width="100%">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DdlInitiatingEmp" InitialValue="-1" Text="Add Employees" ForeColor="Red" ValidationGroup="Employees"></asp:RequiredFieldValidator>

        <asp:Button ID="BtnAddEmployee"
            runat="server"
            Text="Add Employee"
            OnClick="BtnAddEmployee_Click"
             ValidationGroup="Employees"/>
        <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="GridEmployees"
        runat="server"
        AutoGenerateColumns="false"
        CellPadding="3"
        AutoGenerateDeleteButton="true"
        DataKeyNames="EmployeeID"
        Visible="true"
        DataSourceID="dtasrcEmployeeContact" EmptyDataText="No Employees Assigned">
        <Columns>
            <asp:BoundField DataField="EmployeeID" Visible="false" />
            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
        </Columns>
    </asp:GridView>
    <div class="form-group">
        <label>Is there Packing?: </label>
        <asp:CheckBox
            ID="CheckBoxPacking"
            runat="server" />
    </div>


    <div class="form-group">
        <label>Is there Trash Removal/Donations?: </label>
        <asp:CheckBox
            ID="CheckBoxTrash"
            runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxTrash_CheckedChanged" />
    </div>

    <div id="hiddentext1" runat="server" visible="false">
        <div class="form-row">
            <label>Do we need a dumpster?</label>
            &nbsp;
      <asp:CheckBox
          ID="CheckBoxDumpster"
          runat="server" />
        </div>


        <div class="form-group">
            <label>How many Employees</label>
            <asp:TextBox ID="TxtNumberEmp"
                runat="server"
                class="form-control"
                placeholder=""> </asp:TextBox>
        </div>
        <div class="form-group">
            <label>How much are we charging?</label>
            <asp:TextBox ID="TxtCharging"
                runat="server"
                class="form-control"
                placeholder=""> </asp:TextBox>
        </div>
        <div class="form-group">
            <label>Trash Description</label>
            <asp:TextBox ID="txtdesc"
                runat="server"
                class="form-control"
                placeholder=""> </asp:TextBox>
        </div>

    </div>

    <div>
        <asp:DetailsView ID="DTLMoveInfo" runat="server" DataSourceID="dtasrcMoveInfo"
            AutoGenerateEditButton="true"
            EmptyDataText="No Info"
            AutoGenerateRows="false"
            DataKeyNames="MoveAssessmentID">

            <Fields>
                <asp:BoundField DataField="MoveAssessmentID" Visible="false" />
                <asp:BoundField DataField="NumberOfStories" HeaderText="Number of Stories:" />
                <asp:BoundField DataField="DistanceFromTruck" HeaderText="Distance From Truck:" />
                <asp:BoundField DataField="TypeOfHome" HeaderText="Type Of Home:" />
                <asp:BoundField DataField="TypeofHomeAdd" HeaderText="Additional Home Notes:" />
                <asp:BoundField DataField="TruckAccessibility" HeaderText="Truck Accessibility:" />
                <asp:BoundField DataField="LoadingDoorWalk" HeaderText="Loading Conditions:" />
                <asp:BoundField DataField="StepsToHouse" HeaderText="Steps to House:" />
            </Fields>
        </asp:DetailsView>
    </div>
    <div class="text-center">
        <asp:Button ID="ClearBtn" runat="server" Text="Clear" class="btn btn-danger" OnClick="ClearBtn_Click" />
        <asp:Button ID="btnSave" runat="server" Text="Save Form" class="btn btn-success" OnClick="btnSave_Click" ValidationGroup="Save" />
        <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
    </div>


    <asp:SqlDataSource ID="dtasrcMoveInfo"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select MoveAssessment.MoveAssessmentID, NumberOfStories, DistanceFromTruck, TypeOfHome, TypeOfHomeAdd, TruckAccessibility, LoadingDoorWalk, StepsToHouse FROM MoveAssessment join serviceTicket On serviceticket.MoveAssessmentID = MoveAssessment.MoveAssessmentID WHERE ServiceTicketID = @ServiceTicketID"
        UpdateCommand="UPDATE MoveAssessment Set NumberOfStories = @NumberOfStories, DistanceFromTruck = @DistanceFromTruck, TypeofHome = @TypeofHome, TypeOfHomeAdd = @TypeOfHomeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse WHERE MoveAssessmentID = @MoveAssessmentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumberOfStories" Type="String" />
            <asp:Parameter Name="DistanceFromTruck" Type="String" />
            <asp:Parameter Name="TypeOfHome" Type="String" />
            <asp:Parameter Name="TypeOfHomeAdd" Type="String" />
            <asp:Parameter Name="TruckAccessibility" Type="String" />
            <asp:Parameter Name="LoadingDoorWalk" Type="String" />
            <asp:Parameter Name="StepsToHouse" Type="String" />
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dtasrcEmployeeContact"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select e.EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from ServiceTicketEmployee ste join Employee e on ste.employeeID = e.employeeID where ste.serviceticketID = @ServiceTicketID Order By EmpLastName ASC"
        DeleteCommand="DELETE ServiceTicketEmployee where employeeID = @EmployeeID AND ServiceTicketID = @ServiceTicketID">

        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="ddlService" PropertyName="selectedvalue" />
        </DeleteParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource
        ID="dtasrcEmployee"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from Employee Order By EmpLastName ASC"></asp:SqlDataSource>


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
