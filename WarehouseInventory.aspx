﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="WarehouseInventory.aspx.cs" Inherits="Lab3.WarehouseInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
  <h1 class="display-4">Warehouse Inventory</h1>
        </div>
    <br />
    <div class="row justify-content-center">
       <asp:TextBox 
            ID="TxtSearch"
            runat="server"></asp:TextBox>
        <asp:Button 
            ID="BtnSearch"
            runat="server" Text="Search" 
            OnClick="BtnSearch_Click"/>
        <asp:Label
            ID="LblSearch"
            runat="server"
            Text="Search First And/Or Last Name"
            BackColor="Yellow">
        </asp:Label>
        </div>
        <br />
        <br />

         <div>
            <asp:GridView ID="GridViewCustomers"
                runat="server"
                EmptyDataText="No Customers Found"
                DataKeyNames="CustomerID"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" NullDisplayText="N/A" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" NullDisplayText="N/A" HeaderText="Email" />
                    <asp:BoundField DataField="homephone" NullDisplayText="N/A" HeaderText="Home" />
                    <asp:BoundField DataField="Workphone" NullDisplayText="N/A" HeaderText="Work" />
                    <asp:BoundField DataField="Cellphone" NullDisplayText="N/A" HeaderText="Cell" />
                </Columns>

            </asp:GridView>
        </div>
    <br />
    <h4>Customer Items</h4>
    <asp:GridView ID="GrdEquip" 
        runat="server"
        AutoGenerateColumns="false" 
        AutoGenerateEditButton="false" 
        AutoGenerateDeleteButton="false"
         DataKeyNames="WarehouseID"       
         EmptyDataText="No Inventory">
        <Columns>
            <asp:BoundField DataField="WarehouseID" HeaderText=" WarehouseID" Visible="false" />
            <asp:BoundField DataField="CustomerID" HeaderText=" CustomerID" Visible="false" />
            <asp:BoundField DataField="Date" NullDisplayText="N/A" HeaderText=" Date" />
            <asp:BoundField DataField="Location" NullDisplayText="N/A" HeaderText="Location"  />
            <asp:BoundField DataField="Description" NullDisplayText="N/A" HeaderText=" Description" />
        </Columns>
    </asp:GridView>
    <br />

    
</asp:Content>
