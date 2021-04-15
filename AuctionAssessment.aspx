<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AuctionAssessment.aspx.cs" Inherits="Lab3.AuctionAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <div class="row justify-content-center">
    <h1 class="display-4">Auction Assessment</h1>
        </div>
    <h4>Customer Info:</h4>
    <fieldset>
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
        </div>
    </fieldset>
    <br />
    <asp:Label ID="lblSelectService" runat="server" Text="Select Service:"></asp:Label>
    <asp:DropDownList
        ID="DDLType"
        runat="server"
        OnDataBound="DDLType_DataBound"
        AutoPostBack="true"
        OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:Button ID="BtnMoveInfo" runat="server" Text="Add Auction Assessment" OnClick="BtnMoveInfo_Click" Visible="false" />
    <asp:Label ID="LblMoveInfo" runat="server" Text="Auction Assessment Not Yet Added!" ForeColor="Red" Visible="false"></asp:Label>
    <br />
    <br />


    <div id="divbuttons" runat="server">
        <asp:Button ID="btnInventory" runat="server" Text="Inventory" OnClick="btnInventory_Click" />
        <asp:Button ID="BtnGeneralInfo" runat="server" Text="General Assessment" OnClick="BtnGeneralInfo_Click" />&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnVehicles" runat="server" Text="Vehicles" OnClick="BtnVehicles_Click" />&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnSpecialEquipment" runat="server" Text="Special Equipment" OnClick="BtnSpecialEquipment_Click" />&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnCharge" runat="server" Text="Charges" OnClick="BtnCharge_Click" />&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnAddRoom" runat="server" Text="Boxes" OnClick="BtnAddRoom_Click" />
        <br />
        <br />

    </div>



    <br />
    <div id="divInventory" runat="server" visible="false">
        <h5>Inventory</h5>
        <asp:GridView ID="gridInventory"
            runat="server"
            DataSourceID="dtasrcInventory"
            DataKeyNames="ItemID"
            EmptyDataText="No Items Added"
            AutoGenerateColumns="false"
            AutoGenerateEditButton="true"
            AutoGenerateDeleteButton="true">
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" Visible="false" />
                <asp:BoundField DataField="ItemName" HeaderText=" Item Name " />
                <asp:BoundField DataField="ItemDescription" HeaderText=" Item Description " />
                <asp:BoundField DataField="ItemCost" HeaderText=" Item Cost " />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblItemName" runat="server" Text="Item Name:"></asp:Label>
        <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemName" Text="Required" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblItemDescription" runat="server" Text="Item Description: "></asp:Label>
        <asp:TextBox ID="txtItemDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemDescription" Text="Required" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblItemCost" runat="server" Text="Item Cost: "></asp:Label>
        <asp:TextBox ID="txtItemCost" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must be a number" ControlToValidate="txtItemCost" ForeColor="Red" ValidationGroup="ItemGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemCost" Text="Required" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" ValidationGroup="ItemGroup"/>
        <asp:Label ID="lblItemStatus" runat="server" Text=""></asp:Label>

    </div>


    <div runat="server" id="moveinfodiv">
        <div id="divgeneralinfo" runat="server">
            <div class="form-group">
            <asp:Label ID="LblHomeType" runat="server" Text="Type of Home: "></asp:Label>
            <asp:DropDownList ID="DDLTypeofHome" runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="DDLTypeofHome_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem>Apartment</asp:ListItem>
                <asp:ListItem>House</asp:ListItem>
                <asp:ListItem>Storage Unit</asp:ListItem>
                <asp:ListItem>Place of Business</asp:ListItem>
            </asp:DropDownList>
       <asp:RequiredFieldValidator
        ID="RfvCompletedByEmp"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="DDLTypeofHome"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="MoveGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
            

            <div id="divapartment" runat="server">
                <div class="form-row">
                     <div class="form-group col-md-4">
                <asp:Label ID="lblWhichFloor" runat="server" Text="Which floor?: "></asp:Label>
                <asp:TextBox ID="txtWhichFloor" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                    
                        <div class="form-group col-md-4">
                <asp:Label ID="LblElevator" runat="server" Text="Is there an Elevator?: "></asp:Label>
                <asp:TextBox ID="TxtElevator" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                <br />
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
                <asp:TextBox ID="TxtBusiness" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                <br />
            </div>


            <div class="form-row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblStories" runat="server" Text="How Many Stories?: "></asp:Label>
            <asp:TextBox ID="txtStories" runat="server" CssClass="form-control"></asp:TextBox>                            
        <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="txtStories" ForeColor="Red" ValidationGroup="MoveGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStories" Text="Required" ForeColor="Red" ValidationGroup="MoveGroup"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-6">
            <asp:Label ID="LblDistance" runat="server" Text="Distance From Truck: "></asp:Label>
            <asp:TextBox ID="TxtDistance" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtDistance" Text="Required" ForeColor="Red" ValidationGroup="MoveGroup"></asp:RequiredFieldValidator>
            </div>
                <div class="form-group col-md-6">
            <asp:Label ID="LblAccessibility" runat="server" Text="Driveway Accessibility: "></asp:Label>
            <asp:TextBox ID="TxtAccessibility" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtAccessibility" Text="Required" ForeColor="Red" ValidationGroup="MoveGroup"></asp:RequiredFieldValidator>
            </div>
                    
                <div class="form-group col-md-6">
            <asp:Label ID="LblSteps" runat="server" Text="Steps To House: "></asp:Label>
            <asp:TextBox ID="TxtSteps" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="TxtSteps" ForeColor="Red" ValidationGroup="MoveGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtSteps" Text="Required" ForeColor="Red" ValidationGroup="MoveGroup"></asp:RequiredFieldValidator>
            </div>                   
            <asp:Label ID="LblConditions" runat="server" Text="Loading Conditions:  "></asp:Label>
            <asp:TextBox ID="TxtConditions" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtConditions" Text="Required" ForeColor="Red" ValidationGroup="MoveGroup"></asp:RequiredFieldValidator>
            
                </div>
        </div>
        <div id="divsave" runat="server">

            <asp:Button ID="BtnSave" runat="server" Text="Save Move Form" OnClick="BtnSave_Click" ValidationGroup="MoveGroup" />
            <asp:Label ID="LblSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
            <br />
            <br />
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

        <div id="divspecial" runat="server">
            <asp:Label ID="LblSpecial" runat="server" Text="Special Equipment Needed: " Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="DDLSpecial" runat="server" OnDataBound="DDLSpecial_DataBound">
                <asp:ListItem Value="-1">Select</asp:ListItem>
                <asp:ListItem>Appliance Cart</asp:ListItem>
                <asp:ListItem>Piano Dolly</asp:ListItem>
                <asp:ListItem>Piano Board</asp:ListItem>
                <asp:ListItem>Gun Safe Cart</asp:ListItem>
                <asp:ListItem>Extra Blankets</asp:ListItem>
            </asp:DropDownList>
                               <asp:RequiredFieldValidator
        ID="RequiredFieldValidator10"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="DDLSpecial"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="specGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>
            &nbsp
        <asp:Label ID="LblQuantitySpecial" runat="server" Text="Quantity: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="TxtQuantitySpecial" runat="server" TextMode="Number"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtQuantitySpecial" Text="Required" ForeColor="Red" ValidationGroup="specGroup"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="BtnSpecial" runat="server" Text="Add Equipment" OnClick="BtnSpecial_Click" ValidationGroup="specGroup" />
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
                    <asp:BoundField DataField="EquipmentType" HeaderText="Type of Equipment" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
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
                   <asp:RequiredFieldValidator
        ID="RequiredFieldValidator9"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="DDLVehicle"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="ValueGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>
            &nbsp;
            <asp:Button ID="BtnAddCar" runat="server" Text="Add Vehicle" OnClick="BtnAddCar_Click" ValidationGroup="ValueGroup" />
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
            <asp:Label ID="lblPickupFee" runat="server" Text="Pickup Fee: "></asp:Label>
            &nbsp; &nbsp;
                <asp:TextBox ID="txtPickupFee" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
       <asp:CompareValidator ID="CompareValidator4" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="txtPickupFee" ForeColor="Red" ValidationGroup="CharGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPickupFee" Text="Required" ForeColor="Red" ValidationGroup="CharGroup"></asp:RequiredFieldValidator>
            &nbsp;
                
                <br />
            <asp:Label ID="lblConsignmentRate" runat="server" Text="Consignment Rate: "></asp:Label>
            &nbsp; &nbsp;
                <asp:TextBox ID="txtConsignmentRate" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
       <asp:CompareValidator ID="CompareValidator5" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="txtConsignmentRate" ForeColor="Red" ValidationGroup="CharGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtConsignmentRate" Text="Required" ForeColor="Red" ValidationGroup="CharGroup"></asp:RequiredFieldValidator>
            &nbsp;
                
                <br />
            <asp:Label ID="LblTrashRemoval" runat="server" Text="Trash Removal Fee: "></asp:Label>
            &nbsp; &nbsp;
                <asp:TextBox ID="TxtTrashRemoval" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
       <asp:CompareValidator ID="CompareValidator6" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="TxtTrashRemoval" ForeColor="Red" ValidationGroup="CharGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtTrashRemoval" Text="Required" ForeColor="Red" ValidationGroup="CharGroup"></asp:RequiredFieldValidator>
            &nbsp;
                <br />

            <asp:Label ID="lblAdditionalFees" runat="server" Text="Additional Fees: "></asp:Label>
            &nbsp; &nbsp;
                <asp:TextBox ID="txtAdditionalFees" runat="server" PlaceHolder="Enter without $"></asp:TextBox>
       <asp:CompareValidator ID="CompareValidator7" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="txtAdditionalFees" ForeColor="Red" ValidationGroup="CharGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAdditionalFees" Text="Required" ForeColor="Red" ValidationGroup="CharGroup"></asp:RequiredFieldValidator>
            &nbsp;
                
                
                <br />

            <asp:Button ID="btnChargesSave" runat="server" Text="Save Charges" ForeColor="ForestGreen" OnClick="btnChargesSave_Click" ValidationGroup="CharGroup" />
            <br />
            <br />


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
                    <asp:BoundField DataField="ConsignmentRate" HeaderText="Consignment Rate" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="TrashRemovalFee" HeaderText="Trash Removal" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="AdditionalFees" HeaderText="Additional Fees" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="TotalCharges" HeaderText="Total Charges" DataFormatString="{0:C}" ReadOnly="true"/>
                </Columns>

            </asp:GridView>




        </div>
        <div id="divBoxes" runat="server" visible="false">
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

            <label>Type</label>
            <asp:DropDownList
                ID="ddlBoxType"
                runat="server"
                class="form-control">
                <asp:ListItem Value="-1">Select</asp:ListItem>
                <asp:ListItem Value="Small">Small</asp:ListItem>
                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                <asp:ListItem Value="Large">Large</asp:ListItem>
                <asp:ListItem Value="Wardrobe">Wardrobe</asp:ListItem>
                <asp:ListItem Value="Art">Art</asp:ListItem>
                <asp:ListItem Value="Small Pads">Small Pads</asp:ListItem>
                <asp:ListItem Value="Large Pads">Large Pads</asp:ListItem>
            </asp:DropDownList>
                               <asp:RequiredFieldValidator
        ID="RequiredFieldValidator17"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="ddlBoxType"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="BoxGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>

            <div class="form-group">
                <label>Quantity</label>
                <asp:TextBox
                    ID="TxtQty"
                    runat="server"
                    class="form-control"
                    Placeholder="1, 2, 3"></asp:TextBox>
            </div>
        <asp:CompareValidator ID="CompareValidator8" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must Be Number" ControlToValidate="TxtQty" ForeColor="Red" ValidationGroup="BoxGroup"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtQty" Text="Required" ForeColor="Red" ValidationGroup="BoxGroup"></asp:RequiredFieldValidator>
            <div>
                <asp:Button ID="btnAddBox" runat="server" Text="Add box" OnClick="btnAddBox_Click" ValidationGroup="BoxGroup" />
                <asp:Label ID="lblBoxSaveStatus" runat="server" Text=""></asp:Label>
            </div>

        </div>

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

    <asp:SqlDataSource ID="dtasrcInventory"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT ItemID, ItemName, ItemDescription, ItemCost from Inventory where ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE Inventory where ItemID = @ItemID"
        UpdateCommand="UPDATE Inventory set ItemName = @ItemName, ItemDescription = @ItemDescription, ItemCost = @ItemCost where ItemID = @ItemID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="DDLType" PropertyName="selectedvalue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcCustGrid"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName, CellPhone, HomePhone, WorkPhone, Email FROM CUSTOMER WHERE customerID = @CustomerID">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="SelectedCustomerID" />
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
        SelectCommand="Select AuctionChargeID, PickupFee, ConsignmentRate, AdditionalFees, TrashRemovalFee, TotalCharges FROM AUCTIONCHARGES WHERE ServiceTicketID = @ServiceTIcketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcAuctionInfo"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select AuctionAssessment.AuctionAssessmentID, NumberOfStories, DistanceFromTruck, TypeOfHome, TypeOfHomeAdd, TruckAccessibility, LoadingDoorWalk, StepsToHouse FROM AuctionAssessment join serviceTicket On serviceticket.AuctionAssessmentID = AuctionAssessment.AuctionAssessmentID WHERE ServiceTicketID = @ServiceTicketID"
        UpdateCommand="UPDATE AuctionAssessment Set NumberOfStories = @NumberOfStories, DistanceFromTruck = @DistanceFromTruck, TypeofHome = @TypeofHome, TypeOfHomeAdd = @TypeOfHomeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse WHERE AuctionAssessmentID = @AuctionAssessmentID">
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

    <asp:SqlDataSource ID="grdsrcRoomBoxes"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT BoxesID, BoxType, BoxQuantity from AuctionBoxes where ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE AuctionBoxes where BoxesID = @BoxesID"
        UpdateCommand="UPDATE AuctionBoxes SET BoxType = @BoxType, BoxQuantity = @BoxQuantity WHERE BoxesID = @BoxesID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
