<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="CompletionForm.aspx.cs" Inherits="Lab3.CompletionForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Completion Form:</h1>
    <asp:Table ID="TblCompletition" runat="server">
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
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblMoveEmployees" runat="server" Text="Move Employees:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="Drplst" runat="server"></asp:DropDownList>
            </asp:TableCell>   
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnAddEmployee" runat="server" Text="Add Employee ->" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <fieldset>
        <legend>Employees Added!</legend>
        <asp:GridView ID="grdvwAddEmployees" runat="server"></asp:GridView>
    </fieldset>
    <br />
    <br />
    <asp:Table ID="TblCompletion2" runat="server">
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
    <asp:Table ID="TblCompletion3" runat="server">
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
        <legend>Vehicles Used!</legend>
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
        </asp:TableRow>
    </asp:Table>
</asp:Content>
