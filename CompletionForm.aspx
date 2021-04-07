<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.CompletionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Moving Completion Form:</h1>
    <%-- <asp:Table ID="TblSelection" runat="server">--%>
    <%-- <asp:TableRow>
            <asp:TableCell>--%>
    <asp:Label ID="LblCustomer" runat="server" Text="Select Customer:"></asp:Label>
    <%--</asp:TableCell>
            <asp:TableCell>--%>
    <asp:Label ID="LblSelected" runat="server" Text=""></asp:Label>
    <%--</asp:TableCell>
            <asp:TableCell>--%>
    <asp:Label ID="LblID" runat="server" Text="" Visible="false"></asp:Label>
    <%-- </asp:TableCell>--%>

    <%-- <asp:TableCell>
                <asp:DropDownList ID="DDLCust"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    runat="server"
                    OnSelectedIndexChanged="DDLCust_SelectedIndexChanged"
                    OnDataBound="DDLCust_DataBound"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>--%>
    <%-- </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>--%>
    <asp:Label ID="LblType" runat="server" Text="Select Service:"></asp:Label>
    <%--</asp:TableCell>
            <asp:TableCell>--%>
    <asp:DropDownList
        ID="DDLType"
        runat="server"
        OnDataBound="DDLType_DataBound"
        AutoPostBack="true"
        OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
    </asp:DropDownList>
    <%-- </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3">--%>
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
    <%--</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>--%>
    <%--<asp:TableCell ColumnSpan="3">--%>
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
    <%--</asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>
    <asp:Button ID="btnAddEmp" runat="server" Text="Add Employees" OnClick="btnAddEmp_Click" />
    <asp:Button ID="btnCharges" runat="server" Text="Charges" OnClick="btnCharges_Click" />
    <asp:Button ID="btnPay" runat="server" Text="Payment Info" OnClick="btnPay_Click" />
    <asp:Button ID="btnAddress" runat="server" Text="Address Info" OnClick="btnAddress_Click" />
    <asp:Button ID="btnVehicle" runat="server" Text="Vehicle Info" OnClick="btnVehicle_Click" />
    <asp:Button ID="btnTravel1" runat="server" Text="Travel Info" OnClick="btnTravel1_Click" />
    <br />
    <div runat="server" id="divEmp">
        <h2>Add Employees</h2>
        <%--<asp:Label ID="LblMoveEmployees" runat="server" Text="Move Employees:"></asp:Label>--%>
        <div class="form-group">
            <label>Move Employees</label>
            <asp:DropDownList ID="Drplst"
                runat="server"
                OnSelectedIndexChanged="Drplst_SelectedIndexChanged"
                OnDataBound="Drplst_DataBound"
                DataSourceID="dtasrcEmployeeList"
                DataTextField="EmployeeName"
                DataValueField="EmployeeID"
                class="form-control">
            </asp:DropDownList>
        </div>
        <asp:Button ID="BtnAddEmployee" runat="server" Text="Add Employee ->" OnClick="BtnAddEmployee_Click" />
        <fieldset>
            <legend>Employees Added!</legend>
            <asp:GridView ID="GridEmployee"
                runat="server"
                AutoGenerateColumns="false"
                CellPadding="3"
                AutoGenerateDeleteButton="true"
                DataSourceID="dtasrcMoveEmployees"
                DataKeyNames="EmployeeID"
                Visible="true">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                </Columns>

            </asp:GridView>
        </fieldset>
    </div>
    <br />
    <div runat="server" id="divCharge">
        <h2>Charges</h2>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Amount of Hours Worked</label>
                <asp:TextBox
                    ID="TxtAmount"
                    runat="server"
                    Placeholder="Hours worked"
                    class="form-control">
                </asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <label>$ Per Hour $</label>
                <asp:TextBox
                    ID="TxtCharge"
                    runat="server"
                    Placeholder="Per hour"
                    class="form-control">
                </asp:TextBox>
            </div>
        </div>
        <asp:Button ID="BtnCalculate" runat="server" Text="Add Charge" OnClick="BtnCalculate_Click" />

        <fieldset>
            <legend>Total Charges</legend>
            <asp:GridView ID="GridCharges"
                runat="server"
                AutoGenerateColumns="false"
                CellPadding="3"
                AutoGenerateDeleteButton="true"
                Visible="true"
                DataSourceID="dtasrcCharges"
                DataKeyNames="ChargeID">
                <Columns>
                    <asp:BoundField DataField="ChargeID" Visible="false" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount Per Hour" />
                    <asp:BoundField DataField="Total" HeaderText="Total" />
                </Columns>

            </asp:GridView>
        </fieldset>
        <div class="form-group">
            <label>Supplies $</label>
            <asp:TextBox
                ID="TxtSupplies"
                runat="server"
                class="form-control"
                Placeholder="Supplies"></asp:TextBox>
        </div>
        <%--<asp:Label ID="lblsupplies" runat="server" Text="Supplies: $"></asp:Label>--%>
        <%--<asp:TextBox ID="TxtSupplies" runat="server"></asp:TextBox>--%>
        <asp:Button ID="BtnSupplies" runat="server" Text="Calculate Charges" OnClick="BtnSupplies_Click" />
        <asp:Label ID="LblTotal" runat="server" Text="Total Charges: "></asp:Label>
        <asp:Label ID="LblCalculate" runat="server" Text="" Font-Underline="true" Font-Bold="true"></asp:Label>


    </div>

    <br />
    <div runat="server" id="divPayment">
        <%--<asp:Table ID="paymenttable" runat="server">
            <asp:TableRow>
                <asp:TableCell>--%>
        <h2>Payment Information</h2>
        <%--  </asp:TableCell>
            </asp:TableRow>--%>


        <%--  <asp:TableRow>
                <asp:TableCell>--%>


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
                <asp:BoundField DataField="Cost" HeaderText="Amount" />
                <asp:BoundField DataField="AdditionalExpenses" HeaderText="Add. Expenses" />
                <asp:BoundField DataField="CompleteStatus" HeaderText="Completed Status" />


            </Columns>

        </asp:GridView>
        <%-- </asp:TableCell>
            </asp:TableRow>--%>

        <%--<asp:TableRow>
                <asp:TableCell>--%>
        <asp:Label ID="LblPaymentType" runat="server" Text="Type of Payment:"></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <asp:DropDownList
                ID="DDLPaymentType"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="DDLPaynentType_SelectedIndexChanged"
                class="form-control"
                OnDataBound="DDLPaynentType_DataBound">

                <asp:ListItem Value="CreditCard"> Credit Card</asp:ListItem>
                <asp:ListItem Value="Check"> Check </asp:ListItem>
                <asp:ListItem Value="Cash"> Cash</asp:ListItem>
            </asp:DropDownList>
        </div>
        <%--  </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Label ID="LblFinalCost" runat="server" Text="Amount: "></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <asp:TextBox ID="TxtFinalCost" runat="server" Placeholder="Amount" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <%-- </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Label ID="LblPayment" runat="server" Text="Payment Recieved:"></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <asp:CheckBox ID="ChkBoxPayment" runat="server" />
        <%-- </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <br />
        <br />
        <asp:Label ID="LblAdditionalExpense" runat="server" Text="Additional Expense:"></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <asp:TextBox ID="TxtAdditionalExpense" runat="server" Placeholder="Add Additional Expenses" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
        <%-- </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Button ID="btnPayment" runat="server" Text="Add Payment" OnClick="btnPayment_Click" />
        <%-- </asp:TableCell>

            </asp:TableRow>
        </asp:Table>--%>
    </div>
    <br />
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

        <%-- <asp:Table ID="tbladdress" runat="server">

            <asp:TableRow>
                <asp:TableCell>--%>
        <h1>Add Address:</h1>
        <%-- </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDescription" runat="server" Text="Type of Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <label>Type of Address</label>
            <asp:TextBox ID="TxtDescription" Placeholder="Origin, Destination, Primary, etc." CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <%-- </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <%--                    <asp:Label ID="LblStreet" runat="server" Text="Street:"></asp:Label>--%>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <label>Street</label>
            <asp:TextBox ID="TxtStreet" Placeholder="Street" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <%-- </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <%--                    <asp:Label ID="LblCity" runat="server" Text="City:"></asp:Label>--%>
        <%--</asp:TableCell>
                <asp:TableCell>--%>
        <div class="form-group">
            <label>City</label>
            <asp:TextBox ID="TxtCity" Placeholder="City" CssClasss="form-control" runat="server"></asp:TextBox>
        </div>
        <%-- </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Label ID="LblState" runat="server" Text="State:"></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
        <%--</asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Label ID="LblZip" runat="server" Text="Zip: "></asp:Label>
        <%-- </asp:TableCell>
                <asp:TableCell>--%>
        <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox>
        <%--</asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>--%>
        <asp:Button ID="BtnAddAddress" runat="server" Text="Add Address ->" OnClick="BtnAddAddress_Click" />
        <%-- </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>
    </div>
    <br />

    <div runat="server" id="divVehicle">
        <asp:Table ID="tblvehicle" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                <h2>Vehicle Information</h2>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LblMileage" runat="server" Text="Mileage:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TxtMileage" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="LblTrucks" runat="server" Text="Trucks Used:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList
                        ID="DDLVehicle"
                        runat="server"
                        OnDataBound="DDLVehicle_DataBound"
                        DataSourceID="datasrcVehicle"
                        DataTextField="EquipmentType"
                        DataValueField="EquipmentID">
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="BtnAddVehicle" runat="server" Text="Add Vehicle ->" OnClick="BtnAddVehicle_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
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
        <br />

        <%--  <asp:Table ID="TblCompletion4" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblAdditionalNotes" runat="server" Text="Additional Notes:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtAdditionalNotes" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnClear" runat="server" Text="Clear Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnSave" runat="server" Text="Save Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>
        <br />
    </div>
    <div runat="server" id="divTravel">
        <asp:Table ID="tbltravel" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                <h2>Travel Information</h2>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList
                        ID="DDLTravel"
                        runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="DDLTravel_SelectedIndexChanged"
                        OnDataBound="DDLTravel_DataBound">

                        <asp:ListItem Value="TravelTime"> Travel Time </asp:ListItem>
                        <asp:ListItem Value="LoadTime"> Load Time </asp:ListItem>
                        <asp:ListItem Value="UnloadTime"> Unload Time </asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStart" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TxtStart" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEnd" runat="server" Text="" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Txtend" runat="server" Visible="false"></asp:TextBox>
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
                    <asp:Button ID="btntravel" runat="server" Text="Add Travel Time ->" OnClick="btntravel_Click" />
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
    <div class="float-right">
        <asp:Button ID="btnComplete" runat="server" Text="Complete Service Ticket->" OnClick="btnComplete_Click" />
        <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>
        <%-- <asp:Button ID="BtnPop" runat="server" Text="Populate" OnClick="BtnPop_Click" />--%>
        <asp:Button ID="BtnClear" runat="server" Text="Clear" OnClick="BtnClear_Click" />
    </div>
    <%--<asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label3" runat="server" Text="Additional Notes:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Button2" runat="server" Text="Clear Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="Button3" runat="server" Text="Save Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="Button4" runat="server" Text="Submit Form ->" OnClick="SubmitButton_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>

    <%--<asp:SqlDataSource ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName from Customer Order By LastName ASC"></asp:SqlDataSource>--%>

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
        SelectCommand="Select e.EmployeeID, EmpFirstName + ' ' + EmpLastName EmployeeName FROM ServiceTicketEmployee ste join Employee e on ste.Employeeid = e.Employeeid WHERE ServiceTicketID = @ServiceID"
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
        SelectCommand="Select ChargeID, Hours, Amount, Total FROM CHARGES WHERE ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE CHARGES where ChargeID = @ChargeID">
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
