<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewAuctions.aspx.cs" Inherits="Lab3.ViewAuctions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Auctions</h1>
    <div>
        <asp:GridView ID="GridviewAuctions" 
            runat="server" 
            DataSourceID="dtasrcAuctions"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light"></asp:GridView>

    </div>






    <asp:SqlDataSource ID="dtasrcAuctions"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select Firstname +' '+ Lastname 'Name', 
        TicketOpenDate 'Open Date',
        EmpFirstName + ' ' + EmpLastName 'Initiating Employee'
        from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID 
        join employee on employee.employeeID = ServiceTicket.InitiatingEmp
        where ServiceType = 'Auction' order by TicketOpenDate DESC">
        
     </asp:SqlDataSource>
</asp:Content>
