<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveAssessment.aspx.cs" Inherits="Lab3.MoveAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
    <h2><b>Move Assessment Form</b></h2>
       
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
         <br />

        
        <asp:Button ID="BtnMoveInfo" runat="server" Text="Add Move Assessment" OnClick="LblMoveInfo_Click" Visible="false"/>
        <asp:Label ID="LblMoveInfo" runat="server" Text="Move Assessment Not Yet Added!" ForeColor="Red" Visible="false"></asp:Label>

        <div id="divbuttons" runat="server">
        <asp:Button ID="BtnGeneralInfo" runat="server" Text="Add General Assessment" OnClick="BtnGeneralInfo_Click"/>&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnVehicles" runat="server" Text="Add Vehicles"  OnClick="BtnVehicles_Click"/>&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="BtnSpecialEquipment" runat="server" Text="Add Special Equipment"  OnClick="BtnSpecialEquipment_Click"/>&nbsp&nbsp&nbsp&nbsp
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
                        <asp:BoundField DataField="CustomerName"  HeaderText="Customer Name" />  
                        <asp:BoundField DataField="CellPhone" HeaderText="CellPhone" />
                        <asp:BoundField DataField="WorkPhone" HeaderText="WorkPhone" />
                        <asp:BoundField DataField="HomePhone"  HeaderText="HomePhone" />  
                        <asp:BoundField DataField="Email"  HeaderText="Email"/>
              
                        
                    </Columns>
                    </asp:GridView>

        <br />

        <div runat="server" id="moveinfodiv" >
        <div id="divgeneralinfo" runat="server">
        <asp:Label ID="LblHomeType" runat="server" Text="Type of Home: "></asp:Label>
        <asp:DropDownList ID="DDLTypeofHome" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLTypeofHome_SelectedIndexChanged">
            <asp:ListItem>Apartment</asp:ListItem>
            <asp:ListItem>House</asp:ListItem>
            <asp:ListItem>Storage Unit</asp:ListItem>
            <asp:ListItem>Place of Business</asp:ListItem>
            </asp:DropDownList>

        <div id ="divapartment" runat="server">
           <asp:Label ID="LblNumberofStories" runat="server" Text="# of Stories: "></asp:Label>
        <asp:TextBox ID="TxtNumberofStories" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblElevator" runat="server" Text="Is there an Elevator?: "></asp:Label>
        <asp:TextBox ID="TxtElevator" runat="server"></asp:TextBox>
         <br />
        <asp:Label ID="LblElevatorWalk" runat="server" Text="How Far is walk from elevator to apartment?: "></asp:Label>
        <asp:TextBox ID="TxtElevatorWalk" runat="server" TextMode="MultiLine"></asp:TextBox>
         <br />
        </div>

        <div id="divstorageinfo" runat="server">
           <asp:Label ID="LblStorage" runat="server" Text="What Type of Unit?: "></asp:Label>
        <asp:TextBox ID="TxtStorage" runat="server"></asp:TextBox>
        <br />
        </div>

        <div id="divbusiness" runat="server">
            <asp:Label ID="LblBusiness" runat="server" Text="Name of Business: "></asp:Label>
        <asp:TextBox ID="TxtBusiness" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        </div>


        
        <asp:Label ID="LblDistance" runat="server" Text="Distance From Truck: "></asp:Label>
        <asp:TextBox ID="TxtDistance" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblAccessibility" runat="server" Text="Driveway Accessibility: "></asp:Label>
        <asp:TextBox ID="TxtAccessibility" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblSteps" runat="server" Text="Steps To House: "></asp:Label>
        <asp:TextBox ID="TxtSteps" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblConditions" runat="server" Text="Loading Conditions:  "></asp:Label>
        <asp:TextBox ID="TxtConditions" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        </div>
          <div id="divsave" runat="server">
              <asp:Button ID="BtnAddRoom" runat="server" Text="Proceed to Add Room" OnClick="BtnAddRoom_Click" />
            <asp:Button ID="BtnSave" runat="server" Text="Save Move Form"  OnClick="BtnSave_Click"/>
        <asp:Label ID="LblSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
        </div>

        <div id="divspecial" runat="server">
         <asp:Label ID="LblSpecial" runat="server"  Text="Special Equipment Needed: " Font-Bold="true"></asp:Label>
         <asp:DropDownList ID="DDLSpecial" runat="server" OnDataBound="DDLSpecial_DataBound">
             <asp:ListItem>Appliance Cart</asp:ListItem>
             <asp:ListItem>Piano Dolly</asp:ListItem>
             <asp:ListItem>Piano Board</asp:ListItem>
             <asp:ListItem>Gun Safe Cart</asp:ListItem>
             <asp:ListItem>Extra Blankets</asp:ListItem>
         </asp:DropDownList>
            &nbsp
        <asp:Label ID="LblQuantitySpecial" runat="server"  Text="Quantity: " Font-Bold="true"></asp:Label>
        <asp:TextBox ID="TxtQuantitySpecial" runat="server" TextMode="Number"></asp:TextBox>
        <br />
         <asp:Button ID="BtnSpecial" runat="server" Text="Add Equipment" OnClick="BtnSpecial_Click" />
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
                <asp:BoundField DataField="EquipmentType"  HeaderText="Type of Equipment" />
                <asp:BoundField DataField="Quantity"  HeaderText="Quantity" />
            </Columns>
                    
                    </asp:GridView>

            </div>
       <div id ="divvehicles" runat="server">
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
            <asp:Button ID="BtnAddCar" runat="server" Text="Add Vehicle"  OnClick="BtnAddCar_Click"/>
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
             DataKeyNames="MoveEquipmentID">
            <Columns>
                <asp:BoundField DataField="MoveEquipmentID" Visible="false" />
                <asp:BoundField DataField="EquipmentType"  HeaderText="Equipment" />
            </Columns>
                    
                    </asp:GridView>
    </fieldset>
           <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
           </div>
            
            <br />
            <br />
      
            
             



       
          



        




    
    
    
    

    </div>
    </div>
    
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
        SelectCommand="Select EquipmentID, EquipmentType FROM equipment">
     </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select MoveEquipmentID, EquipmentType FROM MOVEEQUIPMENT WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE MOVEEQUIPMENT where MoveEquipmentID = @MoveEquipmentID">
         <SelectParameters>
             <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
     </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcEquipment"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select SpecialEquipmentID, EquipmentType, Quantity FROM SPECIALEQUIPMENT WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE SpecialEquipment where SpecialEquipmentID = @SpecialEquipmentID">
         <SelectParameters>
             <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>

