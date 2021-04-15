﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveAssessment.aspx.cs" Inherits="Lab3.MoveAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <link href="Content/AddService.css" rel="stylesheet" />

    <div>
        <div class="row justify-content-center">
            <h1 class="display-4">Move Assessment Form</h1>
        </div>
        <h4>Customer Info:</h4>
        <fieldset>
            <div class="groupCust">
                <asp:Label ID="Label1" runat="server" Text="Customer Name: "></asp:Label>
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
            </div>
        </fieldset>



        <br />
        <div class="float-right">
            <asp:Button ID="PopBtn" runat="server" Text="Populate" OnClick="PopBtn_Click" />
        </div>
        <br />
        <div class="text-center">
            <asp:Label ID="lblCust" runat="server" Text="Customer Name: "></asp:Label>
            <asp:Label ID="lblselected" runat="server" />
            <asp:Label ID="LblID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="LblMoveID" runat="server" Visible="false"></asp:Label>
            <br />
            <asp:DropDownList
                ID="DDLType"
                runat="server"
                OnDataBound="DDLType_DataBound"
                AutoPostBack="true"
                OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLType" InitialValue="-1" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </div>
        <br />


        <asp:Button ID="BtnMoveInfo" runat="server" Text="Add Move Assessment" OnClick="LblMoveInfo_Click" Visible="false" />
        <asp:Label ID="LblMoveInfo" runat="server" Text="Move Assessment Not Yet Added!" ForeColor="Red" Visible="false"></asp:Label>

        <div id="divbuttons" runat="server" class="text-center">
            <asp:Button ID="BtnGeneralInfo" runat="server" Text="General Assessment" OnClick="BtnGeneralInfo_Click" />
            <asp:Button ID="BtnVehicles" runat="server" Text="Vehicles" OnClick="BtnVehicles_Click" />
            <asp:Button ID="BtnSpecialEquipment" runat="server" Text="Special Equipment" OnClick="BtnSpecialEquipment_Click" />
            <asp:Button ID="BtnCharge" runat="server" Text="Charges" OnClick="BtnCharge_Click" />
            <asp:Button ID="BtnAddRoom" runat="server" Text="Proceed to Add Room" OnClick="BtnAddRoom_Click" />
            <br />
            <br />

        </div>




        <asp:GridView ID="GridCust"
            runat="server"
            DataSourceID="dtasrcCustGrid"
            CausesValidation="false"
            AutoGenerateColumns="false"
            DataKeyNames="CustomerID"
            CellPadding="3"
            Visible="false">

            <Columns>
                <asp:BoundField DataField="CustomerID" Visible="false" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                <asp:BoundField DataField="CellPhone" HeaderText="CellPhone" />
                <asp:BoundField DataField="WorkPhone" HeaderText="WorkPhone" />
                <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" />
                <asp:BoundField DataField="Email" HeaderText="Email" />


            </Columns>
        </asp:GridView>

        <br />

        <div runat="server" id="moveinfodiv">
            <div id="divgeneralinfo" runat="server">
                <div class="form-group">
                    <asp:Label ID="LblHomeType" runat="server" Text="Type of Home: "></asp:Label>
                    <asp:DropDownList ID="DDLTypeofHome" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLTypeofHome_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem>Apartment</asp:ListItem>
                        <asp:ListItem>House</asp:ListItem>
                        <asp:ListItem>Storage Unit</asp:ListItem>
                        <asp:ListItem>Place of Business</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLTypeofHome" Text="Required" ForeColor="Red" ValidationGroup="Save" InitialValue="-1"></asp:RequiredFieldValidator>
                </div>
                <div id="divapartment" runat="server">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <asp:Label ID="LblNumberofStories" runat="server" Text="Which floor?: "></asp:Label>
                            <asp:TextBox ID="TxtNumberofStories" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <asp:Label ID="LblElevator" runat="server" Text="Is there an Elevator?: "></asp:Label>
                            <asp:TextBox ID="TxtElevator" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-4">
                            <asp:Label ID="LblElevatorWalk" runat="server" Text="Distance from elevator to apartment?: "></asp:Label>
                            <asp:TextBox ID="TxtElevatorWalk" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div id="divstorageinfo" runat="server">
                    <asp:Label ID="LblStorage" runat="server" Text="What Type of Unit?: "></asp:Label>
                    <asp:TextBox ID="TxtStorage" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                </div>

                <div id="divbusiness" runat="server">
                    <asp:Label ID="LblBusiness" runat="server" Text="Name of Business: "></asp:Label>
                    <asp:TextBox ID="TxtBusiness" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="LblDistance" runat="server" Text="Distance From Truck: "></asp:Label>
                        <asp:TextBox ID="TxtDistance" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group col-md-6">
                        <asp:Label ID="LblAccessibility" runat="server" Text="Driveway Accessibility: "></asp:Label>
                        <asp:TextBox ID="TxtAccessibility" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="LblSteps" runat="server" Text="Steps To House: "></asp:Label>
                        <asp:TextBox ID="TxtSteps" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label ID="LblConditions" runat="server" Text="Loading Conditions:  "></asp:Label>
                        <asp:TextBox ID="TxtConditions" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <br />

            <div id="divsave" runat="server">
                <br />
                <br />
                <asp:DetailsView ID="DTLMoveInfo" runat="server" DataSourceID="dtasrcMoveInfo"
                    AutoGenerateEditButton="true"
                    EmptyDataText="No Info"
                    AutoGenerateRows="false"
                    DataKeyNames="MoveAssessmentID">

                    <Fields>
                        <asp:BoundField DataField="MoveAssessmentID" Visible="false" />
                        <asp:BoundField DataField="NumberOfStories" NullDisplayText="N/A" HeaderText="Number of Stories:" />
                        <asp:BoundField DataField="DistanceFromTruck" NullDisplayText="N/A" HeaderText="Distance From Truck:" />
                        <asp:BoundField DataField="TypeOfHome" NullDisplayText="N/A" HeaderText="Type Of Home:" />
                        <asp:BoundField DataField="TypeofHomeAdd" NullDisplayText="N/A" HeaderText="Additional Home Notes:" />
                        <asp:BoundField DataField="TruckAccessibility" NullDisplayText="N/A" HeaderText="Truck Accessibility:" />
                        <asp:BoundField DataField="LoadingDoorWalk" NullDisplayText="N/A" HeaderText="Loading Conditions:" />
                        <asp:BoundField DataField="StepsToHouse" NullDisplayText="N/A" HeaderText="Steps to House:" />
                    </Fields>
                </asp:DetailsView>
            </div>

            <div id="divspecial" runat="server">
                <asp:Label ID="LblSpecial" runat="server" Text="Special Equipment Needed: " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="DDLSpecial" runat="server" OnDataBound="DDLSpecial_DataBound">
                    <asp:ListItem>Appliance Cart</asp:ListItem>
                    <asp:ListItem>Piano Dolly</asp:ListItem>
                    <asp:ListItem>Piano Board</asp:ListItem>
                    <asp:ListItem>Gun Safe Cart</asp:ListItem>
                    <asp:ListItem>Extra Blankets</asp:ListItem>
                </asp:DropDownList>
                &nbsp
        <asp:Label ID="LblQuantitySpecial" runat="server" Text="Quantity: " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="TxtQuantitySpecial" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ValidationGroup="quantity" ControlToValidate="TxtQuantitySpecial" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="BtnSpecial" runat="server" Text="Add Equipment" ValidationGroup="quantity" OnClick="BtnSpecial_Click" />
                <br />
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
                        <asp:BoundField DataField="EquipmentType" NullDisplayText="N/A" HeaderText="Type of Equipment" />
                        <asp:BoundField DataField="Quantity" NullDisplayText="N/A" HeaderText="Quantity" />
                    </Columns>

                </asp:GridView>

            </div>
            <div id="divvehicles" runat="server">
                <asp:Label ID="LblTrucks" runat="server" Text="Trucks Needed: "></asp:Label>
                <asp:DropDownList
                    ID="DDLVehicle"
                    runat="server"
                    OnDataBound="DDLVehicle_DataBound"
                    DataSourceID="datasrcVehicle"
                    DataTextField="EquipmentType"
                    DataValueField="EquipmentID">
                </asp:DropDownList>

                &nbsp;
            <asp:Button ID="BtnAddCar" runat="server" Text="Add Vehicle" OnClick="BtnAddCar_Click" ValidationGroup="AddVehicle" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLVehicle" Text="Required" ForeColor="Red" ValidationGroup="AddVehicle" InitialValue="-1"></asp:RequiredFieldValidator>
                <br />
                <fieldset>
                    <legend><b>Vehicles Used</b></legend>
                    <asp:GridView ID="grdvwvehicles"
                        runat="server"
                        AutoGenerateColumns="false"
                        CellPadding="3"
                        AutoGenerateDeleteButton="true"
                        Visible="true"
                        DataSourceID="grdsrcVehicle"
                        DataKeyNames="EquipmentID">
                        <Columns>
                            <asp:BoundField DataField="EquipmentID" Visible="false" />
                            <asp:BoundField DataField="EquipmentType" HeaderText="Equipment" />
                        </Columns>

                    </asp:GridView>
                </fieldset>
                <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
            </div>

            <div id="divcharges" runat="server">
                <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="LblMoveEstimate" runat="server" Text="Move Estimate: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TxtMoveEstimate" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="BtnMoveEstimate" runat="server" Text="Add Charge" OnClick="BtnMoveEstimate_Click" ValidationGroup="Move" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtMoveEstimate" Text="Required" ForeColor="Red" ValidationGroup="Move"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    <asp:Label ID="LblFixedRate" runat="server" Text="Fixed Rate "></asp:Label>
                            </asp:TableCell>
                        <asp:TableCell>
                <asp:TextBox ID="TxtFixedRate" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                <asp:Button ID="BtnFixedRate" runat="server" Text="Add Charge" OnClick="BtnFixedRate_Click" ValidationGroup="Fixed" />
                        </asp:TableCell>
                        <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtFixedRate" Text="Required" ForeColor="Red" ValidationGroup="Fixed"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    <asp:Label ID="LblPackingFee" runat="server" Text="Packing Fee: "></asp:Label>
                    </asp:TableCell>
                   <asp:TableCell>
                <asp:TextBox ID="TxtPackingFee" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
                    </asp:TableCell>
                        <asp:TableCell>
                <asp:Button ID="BtnPackingFee" runat="server" Text="Add Charge" OnClick="BtnPackingFee_Click" ValidationGroup="Packing" />
                    </asp:TableCell>
                        <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtPackingFee" Text="Required" ForeColor="Red" ValidationGroup="Packing"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                    <asp:Label ID="LblStorageFee" runat="server" Text="Storage Fee: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                <asp:TextBox ID="TxtStorageFee" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                <asp:Button ID="BtnStorageFee" runat="server" Text="Add Charge" OnClick="BtnStorageFee_Click" ValidationGroup="Storage" />
                    </asp:TableCell>
                        <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtStorageFee" Text="Required" ForeColor="Red" ValidationGroup="Storage"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                    <asp:Label ID="LblTrashRemoval" runat="server" Text="Trash Removal: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                <asp:TextBox ID="TxtTrashRemoval" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                <asp:Button ID="BtnTrashRemoval" runat="server" Text="Add Charge" OnClick="BtnTrashRemoval_Click" ValidationGroup="Trash" />
                    </asp:TableCell>
                            <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtTrashRemoval" Text="Required" ForeColor="Red" ValidationGroup="Trash"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                            </asp:TableRow>
                </asp:Table>
                    <br />
                <br />


                <h2><b>Charges Added:</b></h2>
                <asp:GridView ID="grdCharges"
                    runat="server"
                    AutoGenerateColumns="false"
                    CellPadding="3"
                    Visible="true"
                    DataSourceID="dtasrcCharges"
                    DataKeyNames="MOVECHARGEID">
                    <Columns>
                        <asp:BoundField DataField="MOVECHARGEID" Visible="false" />
                        <asp:BoundField DataField="MoveEstimate" NullDisplayText="N/A" HeaderText="Move Estimate" />
                        <asp:BoundField DataField="FixedRate" NullDisplayText="N/A" HeaderText="Fixed Rate" />
                        <asp:BoundField DataField="PackingFees" NullDisplayText="N/A" HeaderText="Packing Fees" />
                        <asp:BoundField DataField="StorageFees" NullDisplayText="N/A" HeaderText="Storage Fees" />
                        <asp:BoundField DataField="TrashRemovalFee" NullDisplayText="N/A" HeaderText="Trash Removal" />
                        <asp:BoundField DataField="TotalCharges" NullDisplayText="N/A" HeaderText="Total Charges" />
                    </Columns>

                </asp:GridView>




            </div>

        </div>
    </div>
    <div id="divClearSave" runat="server" class="text-center">
        <asp:Button ID="ClearBtn" runat="server" class="btn btn-danger" Text="Clear" OnClick="ClearBtn_Click" />
        <asp:Button ID="BtnSave" runat="server" class="btn btn-success" Text="Save Move Form" OnClick="BtnSave_Click" ValidationGroup="Save" />
        <asp:Label ID="LblSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
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

    <asp:SqlDataSource ID="dtasrcCustGrid"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName, CellPhone, HomePhone, WorkPhone, Email FROM CUSTOMER WHERE customerID = @CustomerID">
        <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="LblID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="datasrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EquipmentID, EquipmentType FROM equipment"></asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select equipment.EquipmentID, EquipmentType FROM ServiceTicketEquipment join equipment On equipment.equipmentID = ServiceTicketEquipment.equipmentId where ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE ServiceTicketEquipment where equipmentID = @equipmentID AND ServiceticketID = @ServiceTicketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcEquipment"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select SpecialEquipmentID, EquipmentType, Quantity FROM SPECIALEQUIPMENT WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE SpecialEquipment where SpecialEquipmentID = @SpecialEquipmentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcCharges"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select MOVECHARGEID, MoveEstimate, FixedRate, PackingFees, StorageFees, TrashRemovalFee, TotalCharges FROM MOVECHARGES WHERE ServiceTicketID = @ServiceTIcketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcMoveInfo"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select MoveAssessment.MoveAssessmentID, NumberOfStories, DistanceFromTruck, TypeOfHome, TypeOfHomeAdd, TruckAccessibility, LoadingDoorWalk, StepsToHouse FROM MoveAssessment join serviceTicket On serviceticket.MoveAssessmentID = MoveAssessment.MoveAssessmentID WHERE ServiceTicketID = @ServiceTIcketID"
        UpdateCommand="UPDATE MoveAssessment Set NumberOfStories = @NumberOfStories, DistanceFromTruck = @DistanceFromTruck, TypeofHome = @TypeofHome, TypeOfHomeAdd = @TypeOfHomeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse WHERE MoveAssessmentID = @MoveAssessmentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NumberOfStories" Type="String" />
            <asp:Parameter Name="DistanceFromTruck" Type="String" />
            <asp:Parameter Name="TypeOfHome" Type="String" />
            <asp:Parameter Name="TypeOfHomeAdd" Type="String" />
            <asp:Parameter Name="TruckAccessibility" Type="String" />
            <asp:Parameter Name="LoadingDoorWalk" Type="String" />
            <asp:Parameter Name="StepsToHouse" Type="String" />
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

