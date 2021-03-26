<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="WarehouseInventory.aspx.cs" Inherits="Lab3.WarehouseInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <h1>Warehouse Inventory</h1>
    <br />
    <asp:GridView ID="GrdEquip" 
        runat="server"
        AutoGenerateColumns="false" 
         DataKeyNames="WarehouseID"
         DataSourceID="DSWarehouse"        
         EmptyDataText="No Inventory">
        <Columns>
            <asp:BoundField DataField="WarehouseID" HeaderText=" WarehouseID" Visible="false" />
            <asp:BoundField DataField="CustomerID" HeaderText=" CustomerID" Visible="false" />
            <asp:BoundField DataField="Date" HeaderText=" Date" />
            <asp:BoundField DataField="Location" HeaderText="Location"  />
            <asp:BoundField DataField="Description" HeaderText=" Description" />
            <asp:BoundField DataField="Name" HeaderText=" Customer" />
        </Columns>
    </asp:GridView>
    <br />



     <asp:SqlDataSource ID="DSWarehouse"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT warehouse.warehouseID, customer.customerID, warehouse.Date, warehouse.Location,  warehouse.Description, customer.FirstName + customer.LastName as Name from warehouse, customer order by customer.customerid desc" >     
    </asp:SqlDataSource>
    
</asp:Content>
