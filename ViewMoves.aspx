<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewMoves.aspx.cs" Inherits="Lab3.ViewMoves" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
    <h1 class="display-4">View Moves</h1>
        </div>
        <div>
            <asp:Label ID="SearchCustomerLbl" runat="server" Text="Searh for a Customer:"></asp:Label>
            <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
            <asp:Button ID="BtnLoadAll" runat="server" Text="Show All" OnClick="BtnLoadAll_Click"/>


        <asp:GridView ID="GridviewMoves" 
            runat="server" 
             Visible="false"
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light"
             DataSourceID="dtasrcMoves">
            <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="OpenDate" HeaderText="Open Date" />
                    <asp:BoundField DataField="InitiatingEmployee" HeaderText="Initiating Employee" />
                   
            </Columns>
        </asp:GridView>

                <asp:GridView ID="GridviewShowAll" 
            runat="server" 
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light"
                     DataSourceID="dsShowAll">
            <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="OpenDate" HeaderText="Open Date" SortExpression="OpenDate" />
                    <asp:BoundField DataField="InitiatingEmployee" HeaderText="Initiating Employee" />
                   
            </Columns>
        </asp:GridView>

    </div>






    <asp:SqlDataSource ID="dtasrcMoves"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select Customer.CustomerID, Firstname +' '+ Lastname as Name, TicketOpenDate as OpenDate, EmpFirstName + ' ' + EmpLastName as InitiatingEmployee 
        from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID join employee on employee.employeeID = ServiceTicket.InitiatingEmp 
        where ServiceType = 'Move' AND Firstname +' '+ Lastname Like '%'+@Name+'%'">
        <SelectParameters>
        <asp:ControlParameter Name="Name" Type="String" ControlID="TxtSearch" />
        </SelectParameters>


     </asp:SqlDataSource>


    
    <asp:SqlDataSource ID="dsShowAll"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select customer.customerID, Firstname +' '+ Lastname 'Name', 
        TicketOpenDate 'OpenDate',
        EmpFirstName + ' ' + EmpLastName 'InitiatingEmployee'
        from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID 
        join employee on employee.employeeID = ServiceTicket.InitiatingEmp
        where ServiceType = 'Move'"
        >
        
     </asp:SqlDataSource>
</asp:Content>
