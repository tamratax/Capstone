<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AuctionServiceOrder.aspx.cs" Inherits="Lab3.AuctionServiceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <h1>Auction Service Order</h1>

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
            <br />
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
    <div class="form-group">
        <label>Street</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder=""
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
    <asp:Button ID="BtnAddOrigin"
        runat="server"
        Text="Add Address"
        OnClick="BtnAddOrigin_Click" />

    <div>
        <h5>Boxes</h5>
        <asp:GridView ID="grvRoomBoxes"
            runat="server"
            AutoGenerateColumns="false"
            CellPadding="3"
            AutoGenerateDeleteButton="true"
            Visible="true"
            DataSourceID="grdsrcRoomBoxes"
            DataKeyNames="BoxesID"
            AutoGenerateEditButton="true"
            EmptyDataText="No Boxes Added to this Room!">
            <Columns>
                <asp:BoundField DataField="BoxesID" Visible="false" />
                <asp:BoundField DataField="BoxType" HeaderText="Type" />
                <asp:BoundField DataField="BoxQuantity" HeaderText="Quantity" />
            </Columns>
        </asp:GridView>

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
            <asp:Button ID="BtnAddEmployee"
                runat="server"
                Text="Add Employee"
                OnClick="BtnAddEmployee_Click" />
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
        <asp:DetailsView ID="DTLAuctionInfo" runat="server"
            DataSourceID="dtasrcAuctionInfo"
            AutoGenerateEditButton="true"
            AutoGenerateRows="false"
            DataKeyNames="AuctionAssessmentID">

            <Fields>
                <asp:BoundField DataField="AuctionAssessmentID" Visible="false" />
                <asp:BoundField DataField="TypeOfHome" HeaderText="Type Of Home:" />
                <asp:BoundField DataField="TypeofHomeAdd" HeaderText="Additional Home Notes:" />
                <asp:BoundField DataField="NumberOfStories" HeaderText="Number of Stories:" />
                <asp:BoundField DataField="DistanceFromTruck" HeaderText="Distance From Truck:" />
                <asp:BoundField DataField="TruckAccessibility" HeaderText="Truck Accessibility:" />
                <asp:BoundField DataField="LoadingDoorWalk" HeaderText="Loading Conditions:" />
                <asp:BoundField DataField="StepsToHouse" HeaderText="Steps to House:" />
            </Fields>
        </asp:DetailsView>
    </div>
    <div>


        <h2><b>Charges Added:</b></h2>
        <asp:GridView ID="grdCharges"
            runat="server"
            AutoGenerateColumns="false"
            CellPadding="3"
            Visible="true"
            DataSourceID="dtasrcCharges"
            DataKeyNames="AUCTIONCHARGEID">
            <Columns>
                <asp:BoundField DataField="AUCTIONCHARGEID" Visible="false" />
                <asp:BoundField DataField="PickupFee" HeaderText="Pickup Fee" DataFormatString="{0:C}" />
                <asp:BoundField DataField="ConsignmentRate" HeaderText="Consignment Rate" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TrashRemovalFee" HeaderText="Trash Removal" DataFormatString="{0:C}" />
                <asp:BoundField DataField="AdditionalFees" HeaderText="Additional Fees" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalCharges" HeaderText="Total Charges" DataFormatString="{0:C}" ReadOnly="true" />
            </Columns>

        </asp:GridView>
    </div>
    <div>
        <b>Special Equipment Used</b>
        <asp:GridView ID="grvEquip"
            runat="server"
            AutoGenerateColumns="false"
            CellPadding="3"
            AutoGenerateDeleteButton="true"
            Visible="true"
            DataSourceID="grdsrcEquipment"
            DataKeyNames="SpecialEquipmentID">
            <Columns>
                <asp:BoundField DataField="SpecialEquipmentID" Visible="false" />
                <asp:BoundField DataField="EquipmentType" HeaderText="Type of Equipment" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            </Columns>

        </asp:GridView>
    </div>
    <div>
        <b>Vehicles Used</b>
    </div>
    <asp:Label ID="LblAuctionDate" runat="server" Text="Final Auction Date:"></asp:Label>
    <asp:TextBox ID="TxtAuctionDate" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <asp:Label ID="lblAuctionTime" runat="server" Text="Final Auction Time:"></asp:Label>
    <asp:TextBox ID="txtAuctionTime" runat="server" TextMode="Time"></asp:TextBox>
    <br />
    <div class="text-center">
        <asp:Button ID="btnSave" runat="server" class="btn btn-success" Text="Save" OnClick="btnSave_Click" />
        <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
    </div>








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


    <asp:SqlDataSource ID="grdsrcRoomBoxes"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT BoxesID, BoxType, BoxQuantity from AuctionBoxes where ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE AuctionBoxes where BoxesID = @BoxesID"
        UpdateCommand="UPDATE AuctionBoxes SET BoxType = @BoxType, BoxQuantity = @BoxQuantity WHERE BoxesID = @BoxesID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dtasrcEmployee"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from Employee Order By EmpLastName ASC"></asp:SqlDataSource>
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

    <asp:SqlDataSource ID="dtasrcAuctionInfo"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select AuctionAssessment.AuctionAssessmentID, NumberOfStories, DistanceFromTruck, TypeOfHome, TypeOfHomeAdd, TruckAccessibility, LoadingDoorWalk, StepsToHouse FROM AuctionAssessment join serviceTicket On serviceticket.AuctionAssessmentID = AuctionAssessment.AuctionAssessmentID WHERE ServiceTicketID = @ServiceTicketID"
        UpdateCommand="UPDATE AuctionAssessment Set NumberOfStories = @NumberOfStories, DistanceFromTruck = @DistanceFromTruck, TypeofHome = @TypeofHome, TypeOfHomeAdd = @TypeOfHomeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse WHERE AuctionAssessmentID = @AuctionAssessmentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumberOfStories" Type="String" />
            <asp:Parameter Name="DistanceFromTruck" Type="String" />
            <asp:Parameter Name="TypeOfHome" Type="String" />
            <asp:Parameter Name="TypeOfHomeAdd" Type="String" />
            <asp:Parameter Name="TruckAccessibility" Type="String" />
            <asp:Parameter Name="LoadingDoorWalk" Type="String" />
            <asp:Parameter Name="StepsToHouse" Type="String" />
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcCharges"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select AuctionChargeID, PickupFee, ConsignmentRate, AdditionalFees, TrashRemovalFee, TotalCharges FROM AUCTIONCHARGES WHERE ServiceTicketID = @ServiceTIcketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcEquipment"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select SpecialEquipmentID, EquipmentType, Quantity FROM SPECIALEQUIPMENT WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE SpecialEquipment where SpecialEquipmentID = @SpecialEquipmentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </DeleteParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select equipment.EquipmentID, EquipmentType FROM ServiceTicketEquipment join equipment On equipment.equipmentID = ServiceTicketEquipment.equipmentId where ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE ServiceTicketEquipment where equipmentID = @equipmentID AND ServiceticketID = @ServiceTicketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="ddlService" PropertyName="selectedvalue" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
