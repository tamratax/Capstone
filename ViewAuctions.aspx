<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewAuctions.aspx.cs" Inherits="Lab3.ViewAuctions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Auctions</h1>
    <div>
       



         <asp:Label ID="SearchCustomerLbl" runat="server" Text="Searh for a Customer:"></asp:Label>
            <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />

        <asp:GridView ID="GridviewAuction"
            runat="server"           
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="OpenDate" HeaderText="Open Date" />
                    <asp:BoundField DataField="InitiatingEmployee" HeaderText="Initiating Employee" />
                   
            </Columns>
        </asp:GridView>

    </div>






    <%--<asp:SqlDataSource ID="dtasrcAuctions"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select Firstname +' '+ Lastname 'Name', 
        TicketOpenDate 'Open Date',
        EmpFirstName + ' ' + EmpLastName 'Initiating Employee'
        from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID 
        join employee on employee.employeeID = ServiceTicket.InitiatingEmp
        where ServiceType = 'Auction' order by TicketOpenDate DESC">
        
     </asp:SqlDataSource>--%>
</asp:Content>
