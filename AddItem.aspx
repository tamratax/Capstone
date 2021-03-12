﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="Lab3.AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Table ID="AddItemTbl" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="CustLbl" runat="server" Text="Select Customer: "></asp:Label>
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
                <asp:Label ID="LblType"
                    runat="server"
                    Text="Select Service: ">
                </asp:Label>
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
    </asp:Table>
    <br />
    <br />
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4">
                <asp:GridView ID="GridItem"
                    runat="server"
                    DataSourceID="dtasrcItems"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    DataKeyNames="ItemID"
                    CellPadding="3">

                    <Columns>
                        <asp:BoundField DataField="ItemID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Cost" DataFormatString="{0:C}" HeaderText="Cost" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    </Columns>
                </asp:GridView>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblItem"
                    runat="server"
                    Text="Item: "
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtItem"
                    runat="server"
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="TxtItem"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblItemDescription"
                    runat="server"
                    Text="Description: "
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtItemDescription"
                    runat="server"
                    Visible="false"
                    TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCost"
                    runat="server"
                    Text="Item Cost: "
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCost"
                    runat="server"
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CompareValidator ID="CompareValidator1"
                    runat="server"
                    ErrorMessage="CompareValidator"
                    Text="Must be a number! (ex. '18.30')"
                    ControlToValidate="TxtCost"
                    Operator="DataTypeCheck"
                    Type="Currency"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblQuantity"
                    runat="server"
                    Text="Quantity: "
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtQuantity"
                    runat="server"
                    Visible="false"
                    TextMode="Number"
                    Text="1"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnComplete"
                    runat="server"
                    Text="Add Item to Inventory"
                    Visible="false"
                    OnClick="BtnComplete_Click" 
                    ValidationGroup="CreateItem"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblStatus"
                    runat="server"
                    ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName from Customer Order By LastName ASC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcItems"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT ItemID, ItemName 'Name', ItemDescription 'Description', ItemCost 'Cost', Quantity FROM Inventory join ServiceTicket on ServiceTicket.serviceticketID = inventory.ServiceTicketID where inventory.ServiceTicketID = @ServiceID"
        DeleteCommand="DELETE INVENTORY where ItemID = @ItemID"
        UpdateCommand="UPDATE INVENTORY SET ItemName = @Name, ItemDescription = @Description, ItemCost = @Cost, Quantity = @Quantity WHERE ItemID = @ItemID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceID" Type="Int64" ControlID="DDLType" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
