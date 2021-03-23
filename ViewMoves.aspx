<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewMoves.aspx.cs" Inherits="Lab3.ViewMoves" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Moves</h1>
        <div>
        <asp:GridView ID="GridviewMoves" 
            runat="server" 
            DataSourceID="dtasrcMoves"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light"></asp:GridView>

    </div>






    <asp:SqlDataSource ID="dtasrcMoves"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select Firstname +' '+ Lastname 'Name', 
        TicketOpenDate 'Open Date',
        EmpFirstName + ' ' + EmpLastName 'Initiating Employee'
        from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID 
        join employee on employee.employeeID = ServiceTicket.InitiatingEmp
        where ServiceType = 'Move' order by TicketOpenDate DESC"
        >
        
     </asp:SqlDataSource>
</asp:Content>
