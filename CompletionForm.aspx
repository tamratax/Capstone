<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.CompletionForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Moving Completion Form:</h1>
    <asp:Table ID="TblSelection" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCustomer" runat="server" Text="Select Customer:"></asp:Label>
            </asp:TableCell>
   
             <asp:TableCell>
                <asp:DropDownList ID="DDLCust"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    runat="server"
                    OnSelectedIndexChanged="DDLCust_SelectedIndexChanged"
                    OnDataBound="DDLCust_DataBound"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblType" runat="server" Text="Select Service:"></asp:Label>  
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DDLType"
                    runat="server"
                    OnDataBound="DDLType_DataBound"
                    AutoPostBack="true" 
                    OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3">
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
                    </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3">
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
                        <asp:BoundField DataField="Street"  HeaderText="Street" />  
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="State" HeaderText="State" />
                        <asp:BoundField DataField="Zip"  HeaderText="Zip" />  
                        <asp:BoundField DataField="Description"  HeaderText="Description"/>
              
                        
                    </Columns>
                    </asp:GridView>
                    </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    <br />
    <asp:Table ID="TblCompletition" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <h2>Add Employees</h2>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblMoveEmployees" runat="server" Text="Move Employees:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="Drplst" 
                    runat="server" 
                    OnSelectedIndexChanged="Drplst_SelectedIndexChanged" 
                    OnDataBound="Drplst_DataBound"
                    DataSourceID="dtasrcEmployeeList"
                    DataTextField="EmployeeName"
                    DataValueField="EmployeeID"></asp:DropDownList>
            </asp:TableCell>   
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnAddEmployee" runat="server" Text="Add Employee ->" OnClick="BtnAddEmployee_Click" />
            </asp:TableCell>
        </asp:TableRow>
   <asp:TableRow>
       <asp:TableCell>
    <fieldset>
        <legend>Employees Added!</legend>
        <asp:GridView ID="GridEmployee"
                    runat="server"
                    AutoGenerateColumns="false"
                     CellPadding="3"
                     AutoGenerateDeleteButton="true"
                     Visible="false"
                DataSourceID="dtasrcMoveEmployees"
             DataKeyNames="MoveID">
            <Columns>
                <asp:BoundField DataField="MoveID" Visible="false" />
                <asp:BoundField DataField="EmployeeName"  HeaderText="Employee Name" />
            </Columns>
                    
                    </asp:GridView>
    </fieldset>
           </asp:TableCell>
       </asp:TableRow>
        </asp:Table>  

    <br />
   
    <asp:Table ID="chargestable" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <h2>Charges</h2>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblAmount" runat="server" Text="Amount of Hours Worked:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtAmount" runat="server"></asp:TextBox>
            </asp:TableCell>
             </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCharge" runat="server" Text="$ Per Hour: $"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCharge" runat="server"></asp:TextBox>
            </asp:TableCell>
            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnCalculate" runat="server" Text="Add Charge" OnClick="BtnCalculate_Click"/>
            </asp:TableCell>
        </asp:TableRow>
            
            
       


        <asp:TableRow>
            <asp:TableCell>
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
                <asp:BoundField DataField="Hours"  HeaderText="Hours" />
                <asp:BoundField DataField="Amount"  HeaderText="Amount Per Hour" />
                <asp:BoundField DataField="Total"  HeaderText="Total" />
            </Columns>
                    
                    </asp:GridView>
    </fieldset>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblsupplies" runat="server" Text="Supplies: $"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtSupplies" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="BtnSupplies" runat="server" Text="Calculate Charges" OnClick="BtnSupplies_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblTotal" runat="server" Text="Total Charges: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblCalculate" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
     </asp:Table>   
    
    <br />

    <asp:Table ID="paymenttable" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <h2>Payment Information</h2>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblPaymentType" runat="server" Text="Type of Payment:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList 
                    ID="DDLPaymentType" 
                    runat="server" 
                    AutoPostBack="true" 
                    OnSelectedIndexChanged="DDLPaynentType_SelectedIndexChanged"
                    OnDataBound="DDLPaynentType_DataBound">

                    <asp:ListItem Value="CreditCard"> Credit Card</asp:ListItem>
                    <asp:ListItem Value="Check"> Check </asp:ListItem>
                    <asp:ListItem Value="Cash"> Cash</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblFinalCost" runat="server" Text="Final Cost:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtFinalCost" runat="server" ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
       <asp:TableRow>
           <asp:TableCell>
               <asp:Label ID="LblPayment" runat="server" Text="Payment Recieved:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
               <asp:CheckBox ID="ChkBoxPayment" runat="server" />
           </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblAdditionalExpense" runat="server" Text="Additional Expense:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtAdditionalExpense" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
       
    <br />
 
    <asp:Table ID="tbladdress" runat="server">

        <asp:TableRow>
            <asp:TableCell>
                <h2>Addresses</h2>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblOrginStreet" runat="server" Text="Orgin Street:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtOrginStreet" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblDestStreet" runat="server" Text="Destination Street:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDestStreet" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblOrginCity" runat="server" Text="Orgin City:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtOrginCity" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblDestCity" runat="server" Text="Destination City:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDestCity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblOrginState" runat="server" Text="Orgin State:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtOrginState" runat="server"></asp:TextBox>
            </asp:TableCell>
             <asp:TableCell>
                <asp:Label ID="LblDestState" runat="server" Text="Destination State:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDestState" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblOrginZip" runat="server" Text="Orgin Zip: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtOrginZip" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblDestZip" runat="server" Text="Destination Zip: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDestZip" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
            <asp:Button ID="BtnAddAddress" runat="server" Text="Add Address ->" />
                </asp:TableCell>
        </asp:TableRow>
       </asp:Table>
    <fieldset>
        <legend>Addresses Added:</legend>
        <asp:GridView ID="grdvwAddresses" runat="server"></asp:GridView>
    </fieldset>
    <br />


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
               <asp:DropDownList ID="DrplstVehicles" runat="server"></asp:DropDownList>
           </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnAddVehicle" runat="server" Text="Add Vehicle ->" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <fieldset>
        <legend>Vehicles Used</legend>
        <asp:GridView ID="grdvwvehicles" runat="server"></asp:GridView>
    </fieldset>
    <br />
    <asp:Table ID="TblCompletion4" runat="server">
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
    </asp:Table>

    <asp:Table ID="tbltravel" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <h2>Travel Information</h2>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStart" runat="server" Text="TimeStart:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtStart" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
       <asp:TableRow>
           <asp:TableCell>
               <asp:Label ID="lblEnd" runat="server" Text="TimeEnd:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
                <asp:TextBox ID="Txtend" runat="server"></asp:TextBox>
            </asp:TableCell>
       </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblloadstart" runat="server" Text="Load Time Start:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtloadstart" runat="server"></asp:TextBox>
            </asp:TableCell>
              <asp:TableCell>
                <asp:Label ID="lblunloadstart" runat="server" Text="Unload Time Start:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtunloadstart" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
       <asp:TableRow>
          <asp:TableCell>
               <asp:Label ID="lblloadend" runat="server" Text="Load Time End:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
                <asp:TextBox ID="txtloadend" runat="server"></asp:TextBox>
            </asp:TableCell>
           <asp:TableCell>
                <asp:Label ID="lblunloadend" runat="server" Text="Unload Time End:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtunloadend" runat="server"></asp:TextBox>
            </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow>
          <asp:TableCell>
               <asp:Label ID="lblhrs" runat="server" Text="Hours:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
                <asp:TextBox ID="txthrs" runat="server"></asp:TextBox>
            </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <fieldset>
            <legend>Travel Log</legend>
            <asp:GridView ID="travelgrid" runat="server"></asp:GridView>
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
   
    <br />
    <br />
    <asp:Table ID="Table2" runat="server">
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
                <asp:Button ID="Button4" runat="server" Text="Submit Form ->" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName from Customer Order By LastName ASC"></asp:SqlDataSource>

     <asp:SqlDataSource ID="dtasrcCustGrid"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName, CellPhone, HomePhone, WorkPhone, Email FROM CUSTOMER WHERE customerID = @CustomerID">
         <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="DDLCust" />
        </SelectParameters>
     </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcAddresses"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select AddressID, Street, City, State, Zip, Description FROM ADDRESS WHERE CustomerID = @CustomerID">
         <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="DDLCust" />
        </SelectParameters>
     </asp:SqlDataSource>

      <asp:SqlDataSource ID="dtasrcEmployeeList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName from EMPLOYEE Order By EmpLastName ASC"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dtasrcMoveEmployees"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select MoveID, EmployeeName FROM MOVEEMPLOYEES WHERE ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE MOVEEMPLOYEES where MoveID = @MoveID">
         <SelectParameters>
             <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
     </asp:SqlDataSource>

      <asp:SqlDataSource ID="dtasrcCharges"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select ChargeID, Hours, Amount, Total FROM CHARGES WHERE ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE CHARGES where ChargeID = @ChargeID">
         <SelectParameters>
             <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
     </asp:SqlDataSource>

</asp:Content>
