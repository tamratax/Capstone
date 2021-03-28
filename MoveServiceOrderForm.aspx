<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveServiceOrderForm.aspx.cs" Inherits="Lab3.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
     <h1> Move Service Order</h1>

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
        <label>Origin Street</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder=""
            class="form-control"></asp:TextBox>
    </div>
            <div class="form-row">
         <div class="form-group col-md-6">
            <label for="inputCity">Origin City</label>
            <asp:TextBox ID="TxtCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">Origin State</label>
            <asp:TextBox ID="TxtState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Origin Zip</label>
            <asp:TextBox ID="TxtZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>
     <div class="form-group">
        <label for="inputDescription">Origin Description</label>
        <asp:TextBox ID="TxtDescription"
            runat="server"
            class="form-control"
            placeholder="Description"></asp:TextBox>
    </div>
    <asp:Button ID="BtnAddOrigin" 
        runat="server" 
        Text="Add Another Origin" 
        OnClick="BtnAddOrigin_Click" />
            <div class="form-group">
        <label>Destination Street</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="TxtMoveAddress"
            runat="server"
            Placeholder=""
            class="form-control"></asp:TextBox>
    </div>
            <div class="form-row">
         <div class="form-group col-md-6">
            <label for="inputCity">Destination City</label>
            <asp:TextBox ID="TxtMoveCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">Destination State</label>
            <asp:TextBox ID="TxtMoveState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Destination Zip</label>
            <asp:TextBox ID="TxtMoveZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>
     <div class="form-group">
        <label for="inputDescription">Destination Description</label>
        <asp:TextBox ID="TxtMoveDescription"
            runat="server"
            class="form-control"
            placeholder="Description"></asp:TextBox>
    </div>
    <asp:Button ID="BtnAddDestination" 
        runat="server" 
        Text="Add Another Destination" 
        OnClick="BtnAddDestination_Click" />
    <br />
    <br />
    <h4>Assign Crew</h4>
     <div class="form-group">
        <label>Employees:</label>
        <asp:DropDownList
            ID="DdlInitiatingEmp"
            runat="server"
            DataSourceID="dtasrcEmployeeContact"
            DataTextField="EmployeeName"
            DataValueField="EmployeeID"
            OnDataBound="DdlInitiatingEmp_DataBound" Width="100%">
        </asp:DropDownList>
         <asp:Button ID="BtnAddEmployee" 
             runat="server" 
             Text="Add Employee" 
             OnClick="BtnAddEmployee_Click" />
    </div>
    <asp:GridView ID="GridEmployees" 
        runat="server"
        AutoGenerateColumns="false" 
        CellPadding="3" 
        AutoGenerateDeleteButton="true" 
        DataKeyNames="MoveID"
        Visible="true"
        DataSourceID="datasrcMoveemployees">
         <Columns>
                    <asp:BoundField DataField="MoveID" Visible="false" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                </Columns>
    </asp:GridView>
    <div class="form-group">
        <label>Is ther Packing?: </label>
        <asp:CheckBox
            ID="ChkBoxCompleted"
            runat="server" />
    </div>
   

    <div class="form-group">
        <label>Is there Trash Removal/Donations?: </label>
        <asp:CheckBox
            ID="CheckBoxTrash"
            runat="server" />
    </div>
    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Type of Home</label>
            <asp:TextBox
                ID="TypeHome"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Truck Accessibility</label>
            <asp:TextBox
                ID="TruckAccess"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Walking Distance</label>
            <asp:TextBox
                ID="WalkingDistance"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
    </div>

     <div class="form-row">
        <div class="form-group col-md-4">
            <label>Number of Steps</label>
            <asp:TextBox
                ID="Txtsteps"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Special Equipment</label>
            <asp:TextBox
                ID="Txtequp"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Trucks We Are Taking</label>
            <asp:TextBox
                ID="txttrucks"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
    </div>
 

     <asp:SqlDataSource
        ID="dtasrcEmployeeContact"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from Employee Order By EmpLastName ASC">
     </asp:SqlDataSource>

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
