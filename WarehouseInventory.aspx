<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="WarehouseInventory.aspx.cs" Inherits="Lab3.WarehouseInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="LblWarehouse" runat="server" Text="Warehouse Inventory">
    </asp:Label>

    <asp:Table ID="table1" runat="server">
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
    <asp:Table ID="gridtable" runat="server">
         <asp:TableRow>
            <asp:TableCell ColumnSpan="3">
                <asp:GridView ID="GridItem"
                    runat="server"
                    DataSourceID="dtasrcItems"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"                    
                    DataKeyNames="WarehouseID"
                    CellPadding="3"
                    Visible="false">
                    

                    <Columns>
                        <asp:BoundField DataField="WarehouseID" Visible="false" />
                        <asp:BoundField DataField="Date"  HeaderText="Date" />  
                        <asp:BoundField DataField="Lot" HeaderText="Lot" />
                        <asp:BoundField DataField="Control" HeaderText="Control" />
                        <asp:BoundField DataField="Description"  HeaderText="Description" />  
                        <asp:BoundField DataField="ItemName"  HeaderText="Name"/>
                        <asp:BoundField DataField="Quantity"  HeaderText="Quantity"/>
                      <%--  <asp:BoundField DataField="CustomerName"  HeaderText="Customer"/>--%>
                        
                    </Columns>
                </asp:GridView>

            </asp:TableCell>
        </asp:TableRow>
         </asp:Table>
    <br />
    <br />
    <br />
    <asp:Table ID="table2" runat="server">
     <asp:TableRow>
         <asp:TableCell>
             <asp:Label ID="lblItem" runat="server" Text="Select Item to add to the Warehouse: " />
         </asp:TableCell>
         <asp:TableCell>
             <asp:DropDownList
                    ID="DDLItem"
                    runat="server"
                    OnDataBound="DropDownList2_DataBound"
                    AutoPostBack="true" 
                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                </asp:DropDownList>
         </asp:TableCell>
        
     </asp:TableRow>
        <asp:TableRow>
             <asp:TableCell>
                <asp:Label ID="LblQuantity" runat="server" Text="Quantity:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtQuantity" runat="server"></asp:TextBox>
            </asp:TableCell>
          <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                    runat="server"
                    ControlToValidate="TxtQuantity"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblDate" runat="server" Text="Date:" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDate" TextMode="Date" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                    runat="server"
                    ControlToValidate="TxtLot"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblLot" runat="server" Text="Lot:" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtLot" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="TxtLot"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblControl" runat="server" Text="Control:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtControl" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
             <asp:TableCell>
                <asp:Label ID="LblDescription" runat="server" Text="Description:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDescription" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
            </asp:TableCell>
             <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server"
                    ControlToValidate="TxtDescription"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateItem"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Savebtn" runat="server" Text="Save to Database" OnClick="Savebtn_Click" />
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
        SelectCommand="SELECT DISTINCT WAREHOUSE.WarehouseID, WAREHOUSE.Date, WAREHOUSE.Lot, WAREHOUSE.Control, WAREHOUSE.Description, WAREHOUSE.Quantity, INVENTORY.ItemName FROM Inventory, Warehouse, Customer WHERE WAREHOUSE.ItemID = INVENTORY.ItemID AND WAREHOUSE.CustomerID = @CustomerID"
        DeleteCommand="DELETE WAREHOUSE where WarehouseID = @WarehouseID"
        UpdateCommand="UPDATE WAREHOUSE SET Date = @Date, Lot = @Lot, Control = @Control, Description = @Description, Quantity = @Quantity WHERE WarehouseID = @WarehouseID">
        <SelectParameters>
            <asp:ControlParameter Name="CustomerID" Type="Int64" ControlID="DDLCust" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
