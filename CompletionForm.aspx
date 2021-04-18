<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.CompletionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
        <h1 class="display-4">Moving Completion Form</h1>
    </div>
    <asp:Label ID="LblSelected" runat="server" Text="" Visible="false"></asp:Label>

    <asp:Label ID="LblID" runat="server" Text="" Visible="false"></asp:Label>

    <asp:Label ID="LblType" runat="server" Text="Select Service:"></asp:Label>

    <asp:DropDownList
        ID="DDLType"
        runat="server"
        OnDataBound="DDLType_DataBound"
        AutoPostBack="true"
        OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLType" Text="Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>

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
            <asp:TemplateField HeaderText="Home" ConvertEmptyStringToNull="true">
                        <ItemTemplate>
                            <asp:Label ID="home" runat="server" Text='<%# FormatPhoneNumber(Eval("homephone").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Work" ConvertEmptyStringToNull="true">
                        <ItemTemplate>
                            <asp:Label ID="work" runat="server" Text='<%# FormatPhoneNumber(Eval("Workphone").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cell" ConvertEmptyStringToNull="true">
                        <ItemTemplate>
                            <asp:Label ID="cell" runat="server" Text='<%# FormatPhoneNumber(Eval("Cellphone").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" />


        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridAddress"
        runat="server"
        DataSourceID="dtasrcAddresses"
        CausesValidation="false"
        AutoGenerateColumns="false"
        DataKeyNames="AddressID"
        CellPadding="3"
        Visible="false">

        <Columns>
            <asp:BoundField DataField="AddressID" Visible="false" />
            <asp:BoundField DataField="Street" HeaderText="Street" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="State" HeaderText="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" />
            <asp:BoundField DataField="Description" HeaderText="Description" />


        </Columns>
    </asp:GridView>

    <asp:Button ID="BtnPop" runat="server" Text="Populate" OnClick="BtnPop_Click" />
    <br />
    <br />
    <div class="text-center">
    <asp:Button ID="btnAddEmp" runat="server" Text="Add Employees" OnClick="btnAddEmp_Click" />
    <asp:Button ID="btnPay" runat="server" Text="Payment Info" OnClick="btnPay_Click" />
    <asp:Button ID="btnAddress" runat="server" Text="Address Info" OnClick="btnAddress_Click" />
    <asp:Button ID="btnVehicle" runat="server" Text="Vehicle Info" OnClick="btnVehicle_Click" />
    <asp:Button ID="btnTravel1" runat="server" Text="Travel Info" OnClick="btnTravel1_Click" />
        </div>
    <br />
    <div runat="server" id="divEmp">
        <h2>Add Employees</h2>

        <div class="form-group">
            <label>Move Employees</label>
            <asp:DropDownList ID="Drplst"
                runat="server"
                OnDataBound="Drplst_DataBound"
                DataSourceID="dtasrcEmployeeList"
                DataTextField="EmployeeName"
                DataValueField="EmployeeID"
                class="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Drplst" ErrorMessage="RequiredFieldValidator" InitialValue="-1" Text="Please select an Employee" ForeColor="Red" ValidationGroup="EmpValid"></asp:RequiredFieldValidator>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Amount of Hours Worked</label>
                    <asp:TextBox
                        ID="TxtAmount"
                        runat="server"
                        Placeholder="Hours worked"
                        class="form-control">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtAmount" Text="Required" ForeColor="Red" ValidationGroup="EmpValid"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TxtAmount" Text="Please only Enter Numbers" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ValidationGroup="EmpValid"></asp:CompareValidator>
                </div>
                <div class="form-group col-md-6">
                    <label>Wage per Hour</label>
                    <asp:TextBox
                        ID="TxtCharge"
                        runat="server"
                        Placeholder="Per hour"
                        class="form-control">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtCharge" Text="Required" ForeColor="Red" ValidationGroup="EmpValid"></asp:RequiredFieldValidator>

                </div>
            </div>
        </div>
        <asp:Button ID="BtnAddEmployee" runat="server" Text="Add Employee" OnClick="BtnAddEmployee_Click" ValidationGroup="EmpValid" />
        <fieldset>
            <legend>Employees Added:</legend>
            <asp:GridView ID="GridEmployee"
                runat="server"
                AutoGenerateColumns="false"
                CellPadding="3"
                AutoGenerateDeleteButton="true"
                DataSourceID="dtasrcMoveEmployees"
                DataKeyNames="EmployeeID"
                Visible="true"
                EmptyDataText="No Employees Added Yet!">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" />
                    <asp:BoundField DataField="Amount" HeaderText="Wage per hour" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                </Columns>

            </asp:GridView>
        </fieldset>
    </div>
    <div runat="server" id="divPayment">

        <h2>Payment Information</h2>

        <asp:GridView ID="GridPayment"
            runat="server"
            AutoGenerateColumns="false"
            CellPadding="3"
            AutoGenerateDeleteButton="true"
            AutoGenerateEditButton="true"
            Visible="true"
            DataSourceID="dtasrcPayment"
            DataKeyNames="PaymentID">
            <Columns>
                <asp:BoundField DataField="PaymentID" Visible="false" />
                <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" />
                <asp:BoundField DataField="Cost" HeaderText="Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="AdditionalExpenses" HeaderText="Add. Expenses" DataFormatString="{0:C}" />
                <asp:BoundField DataField="CompleteStatus" HeaderText="Completed Status" />
            </Columns>

        </asp:GridView>

        <asp:Label ID="LblPaymentType" runat="server" Text="Type of Payment:"></asp:Label>

        <div class="form-group">
            <asp:DropDownList
                ID="DDLPaymentType"
                runat="server"
                AutoPostBack="true"
                class="form-control">

                <asp:ListItem Value="-1">Select</asp:ListItem>
                <asp:ListItem Value="Credit Card"> Credit Card</asp:ListItem>
                <asp:ListItem Value="Check"> Check </asp:ListItem>
                <asp:ListItem Value="Cash"> Cash</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLPaymentType" Text="Required" ForeColor="Red" InitialValue="-1" ValidationGroup="payment"></asp:RequiredFieldValidator>

        </div>

        <asp:Label ID="LblFinalCost" runat="server" Text="Amount: "></asp:Label>

        <div class="form-group">
            <asp:TextBox ID="TxtFinalCost" runat="server" Placeholder="Amount" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtFinalCost" Text="Required" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>

        </div>
        <br />

        <asp:Label ID="LblPayment" runat="server" Text="Payment Recieved:"></asp:Label>

        <asp:CheckBox ID="ChkBoxPayment" runat="server" />

        <br />
        <br />
        <asp:Label ID="LblAdditionalExpense" runat="server" Text="Additional Expense:"></asp:Label>

        <div class="form-group">
            <asp:TextBox ID="TxtAdditionalExpense" runat="server" Placeholder="Add Additional Expenses" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>

        <asp:Button ID="btnPayment" runat="server" Text="Add Payment" OnClick="btnPayment_Click" ValidationGroup="payment" />

    </div>
    <div runat="server" id="divAddress">
        <fieldset>
            <legend>Addresses:</legend>
            <asp:GridView ID="GridAddresses"
                runat="server"
                AutoGenerateColumns="false"
                CellPadding="3"
                AutoGenerateDeleteButton="true"
                Visible="true"
                DataSourceID="dtasrcAddresses"
                DataKeyNames="AddressID">
                <Columns>
                    <asp:BoundField DataField="AddressID" Visible="false" />
                    <asp:BoundField DataField="Description" HeaderText="Type" />
                    <asp:BoundField DataField="Street" HeaderText="Street" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip" />

                </Columns>

            </asp:GridView>
        </fieldset>

        <h1>Add Address:</h1>

        <div class="form-group">
            <label>Type of Address</label>
            <asp:TextBox ID="TxtDescription" Placeholder="Origin, Destination, Primary, etc." CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtDescription" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label>Street</label>
            <asp:TextBox ID="TxtStreet" Placeholder="Street" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtStreet" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <label>City</label>
            <asp:TextBox ID="TxtCity"
                Placeholder="City"
                CssClasss="form-control"
                runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtCity" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <label>State</label>
            <asp:TextBox ID="TxtState"
                Placeholder="State"
                CssClass="form-control"
                runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtState" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <label>Zip</label>
            <asp:TextBox ID="TxtZip"
                Placeholder="Zip"
                CssClass="form-control"
                runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtZip" Text="Required" ForeColor="Red" ValidationGroup="addy"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator" ValidationGroup="addy" ControlToValidate="TxtZip" Text="Invalid Zip" ForeColor="Red" operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
        </div>
        <asp:Button ID="BtnAddAddress" runat="server" Text="Add Address ->" OnClick="BtnAddAddress_Click" ValidationGroup="addy" />
    </div>
    <div runat="server" id="divVehicle">
        <h2>Vehicle Information</h2>
        <div class="form-group">
            <label>Mileage</label>
            <asp:TextBox ID="TxtMileage" Placeholder="Mileage" CssClass="form-control" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtMileage" Text="Required" ForeColor="Red" ValidationGroup="equipment"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TxtMileage" Text="Must be a Number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ValidationGroup="equipment"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <label>Trucks Used</label>
            <asp:DropDownList
                ID="DDLVehicle"
                runat="server"
                class="form-control"
                OnDataBound="DDLVehicle_DataBound"
                DataSourceID="datasrcVehicle"
                DataTextField="EquipmentType"
                DataValueField="EquipmentID">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLVehicle" Text="Required" ForeColor="Red" InitialValue="-1" ValidationGroup="equipment"></asp:RequiredFieldValidator>
        </div>
        <asp:Button ID="BtnAddVehicle" runat="server" Text="Add Vehicle ->" OnClick="BtnAddVehicle_Click" ValidationGroup="equipment" />

        <fieldset>
            <legend>Vehicles Used</legend>
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
                    <asp:BoundField DataField="Mileage" HeaderText="Mileage" />
                </Columns>

            </asp:GridView>
        </fieldset>
        <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label> 

    </div>
    <div runat="server" id="divTravel">
        <h2>Travel Information</h2>
        <div class="form-group">
            <label>Select an Option Below</label>
            <asp:DropDownList
                ID="DDLTravel"
                class="form-control"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="DDLTravel_SelectedIndexChanged">

                <asp:ListItem Value="-1"> Select </asp:ListItem>
                <asp:ListItem Value="TravelTime"> Travel Time </asp:ListItem>
                <asp:ListItem Value="LoadTime"> Load Time </asp:ListItem>
                <asp:ListItem Value="UnloadTime"> Unload Time </asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DDLTravel" ForeColor="Red" Text="Required" InitialValue="-1" ValidationGroup="travel"></asp:RequiredFieldValidator>
        </div>
        <asp:Table ID="tbltravel" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStart" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TxtStart" runat="server" Visible="false" TextMode="Time"></asp:TextBox>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEnd" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Txtend" runat="server" Visible="false" TextMode="Time"></asp:TextBox>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblhrs" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txthrs" runat="server" Visible="false"></asp:TextBox>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btntravel" runat="server" Text="Add Travel Time ->" OnClick="btntravel_Click" ValidationGroup="travel" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <fieldset>
                        <legend>Travel Log</legend>
                        <asp:GridView ID="GridTravel"
                            runat="server"
                            AutoGenerateColumns="false"
                            CellPadding="3"
                            AutoGenerateDeleteButton="true"
                            Visible="false"
                            DataSourceID="grdsrcTravel"
                            DataKeyNames="TravelID"
                            OnDataBound="GridTravel_DataBound">
                            <Columns>
                                <asp:BoundField DataField="TravelID" Visible="false" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                                <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" />

                            </Columns>

                        </asp:GridView>
                    </fieldset>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbltotalhrs" runat="server" Text="Total Hours: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblcalculatehrs" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>
    </div>

    <br />
    <br />
    <div id="divClearSave" runat="server" class="text-center">
        <asp:Button ID="BtnClear" runat="server" class="btn btn-danger" Text="Clear" OnClick="BtnClear_Click" />
        <asp:Button ID="btnComplete" runat="server" class="btn btn-success" Text="Complete Service Ticket" OnClick="btnComplete_Click" ValidationGroup="Save" />
        <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>
    </div>

    <asp:SqlDataSource ID="dtasrcCustGrid"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName, CellPhone, HomePhone, WorkPhone, Email FROM CUSTOMER WHERE customerID = @CustomerID">
        <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="LblID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcAddresses"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select AddressID, Description, Street, City, State, Zip FROM ADDRESS WHERE CustomerID = @CustomerID"
        DeleteCommand="DELETE ADDRESS Where AddressID = @AddressID">
        <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="LblID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcEmployeeList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from EMPLOYEE Order By EmpLastName ASC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcMoveEmployees"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select e.EmployeeID, EmpFirstName + ' ' + EmpLastName EmployeeName, Hours, Amount, Total FROM ServiceTicketEmployee ste join Employee e on ste.Employeeid = e.Employeeid WHERE ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE ServiceTicketEmployee where EmployeeID = @EmployeeID AND ServiceTicketID = @ServiceID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcCharges"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, Hours, Amount, Total FROM ServiceTicketEmployee WHERE ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE ServiceTicketEmployee where ChargeID = @ChargeID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="datasrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EquipmentID, EquipmentType FROM equipment"></asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcVehicle"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select e.EquipmentID, EquipmentType, Mileage FROM equipment e join ServiceTicketEquipment ste on e.EquipmentID = ste.EquipmentID WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE ServiceTicketEquipment where EquipmentID = @EquipmentID AND ServiceTicketID = @ServiceTicketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="grdsrcTravel"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select TravelID, Description, StartTime, EndTime, Hours FROM Travel WHERE ServiceTicketID = @ServiceTicketID"
        DeleteCommand="DELETE TRAVEL where TravelID = @TravelID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcPayment"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select PaymentID, PaymentType, Cost, AdditionalExpenses, CompleteStatus FROM Payment WHERE ServiceTicketID = @ServiceTicketID"
        UpdateCommand="Update Payment SET PaymentType = @PaymentType, Cost = @Cost, AdditionalExpenses = @AdditionalExpenses, CompleteStatus = @CompleteStatus WHERE PaymentID = @PaymentID "
        DeleteCommand="DELETE PAYMENT where PaymentID = @PaymentID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
