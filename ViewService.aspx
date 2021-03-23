<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewService.aspx.cs" Inherits="Lab2.ViewService" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Services</h1>
    <fieldset>
        <legend>Select Customer to View Services:</legend>
        <asp:Label ID="LblCustomerName" runat="server" Text="Customer Name: "></asp:Label>
        <asp:DropDownList
            ID="DdlCustomerList"
            runat="server"
            DataSourceID="dtasrcCustomerList"
            DataTextField="CustomerName"
            DataValueField="CustomerID"
            AutoPostBack="true"
            OnDataBound="DdlCustomerList_DataBound"
            OnSelectedIndexChanged="DdlCustomerList_SelectedIndexChanged">
        </asp:DropDownList>
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
        <asp:Button ID="btnLoadAllServices"
            runat="server"
            Text="Show all Services"
            OnClick="btnLoadAllServices_Click" />

        <asp:Button ID="BtnAddService"
            runat="server"
            Text="Add Service ->"
            OnClick="BtnAddService_Click" />
    </fieldset>
    <br />
    <fieldset>
        <legend>Orders for selected customer: </legend>
        <asp:Label
            ID="LblMoveResults"
            runat="server"
            Text="Moves"
            Font-Bold="true"></asp:Label>
        <asp:GridView
            ID="GrdMoveResults"
            runat="server"
            AlternatingRowStyle-BackColor="#ebebeb"
            AutoGenerateSelectButton="true"
            EmptyDataText="This Customer Has No Move Services!">
        </asp:GridView>
        <br />
        <asp:Label
            ID="LblAuctionResults"
            runat="server"
            Text="Auctions"
            Font-Bold="true"></asp:Label>
        <asp:GridView
            ID="GrdAuctionResults"
            runat="server"
            AlternatingRowStyle-BackColor="#ebebeb"
            EmptyDataText="This Customer Has No Auction Services!">
        </asp:GridView>
        <br />
    </fieldset>
    <br />
    <fieldset>
        <legend>Select Service For More Details: </legend>
        <asp:Label ID="LblService" runat="server" Text="Service: "></asp:Label>
        <asp:DropDownList
            ID="DdlServiceList"
            runat="server"
            OnSelectedIndexChanged="DdlServiceList_SelectedIndexChanged"
            AutoPostBack="true"
            OnDataBound="DdlServiceList_DataBound">
        </asp:DropDownList>
        <asp:Label 
            ID="LblCustomerError"
            runat="server" 
            Text="    Choose Customer To Populate List"
            Font-Italic="true"></asp:Label>
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label
                        ID="LblWorkflow" 
                        runat="server"
                        Text="Workflow"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                    <asp:Label
                        ID="LblEquipment" 
                        runat="server"
                        Text="Equipment"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="LblInventory" 
                        runat="server"
                        Text="Inventory"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView
                        ID="GrdEmployeeResults"
                        runat="server"
                        AlternatingRowStyle-BackColor="#ebebeb"
                        EmptyDataText="No employees assigned to this service.">
                    </asp:GridView>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="lblSpacing"
                        runat="server"
                        Text="---------"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:GridView
                        ID="GrdEquipmentResults"
                        runat="server"
                        AlternatingRowStyle-BackColor="#ebebeb"
                        EmptyDataText="No equipment assigned to this service.">
                    </asp:GridView>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="LblSpacing2"
                        runat="server"
                        Text="---------"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:GridView
                        ID="GrdInventory"
                        runat="server"
                        AlternatingRowStyle-BackColor="#ebebeb"
                        EmptyDataText="No Inventory assigned to this service.">
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </fieldset>
    <fieldset>
    <script>

                    function SetStatus(value) {
                        var divStatus = document.getElementById('divStatus');
                        divStatus.style.width = value + "%";
                    }
                </script>
<asp:Table ID="Table2" runat="server">
    <asp:TableRow>
        <asp:TableCell><asp:Label ID="StatBar" runat="server" Text="Service Status Bar" Font-Bold="true" Font-Size="Larger"></asp:Label></asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="StatusPercent" runat="server" Text="" Font-Bold="true"></asp:Label></asp:TableCell>
    </asp:TableRow>
</asp:Table>
     
     <div style="border:1px solid black;width:40%;">
      <div id="divStatus" runat="server" style="background-color:Green;width:0%;">&nbsp; </div>
     </div>
    <br />
    </fieldset>
    <br />
    <fieldset>
        <legend>Service Ticket Notes</legend>
        <asp:Table
            ID="TblNotes" 
            runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label 
                        ID="LblNoteSelect"
                        runat="server"
                        Text="Select Note To View/Edit:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:ListBox 
                        ID="LstBoxNoteSelect"
                        runat="server"
                        OnSelectedIndexChanged="LstBoxNoteSelect_SelectedIndexChanged"
                        AutoPostBack="true"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button 
                    ID="BtnAddNewNote" 
                    runat="server" 
                    Text="Add New Note ->" 
                    OnClick="BtnAddNewNote_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    </fieldset>



    <asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>
    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Capstone%>"
        SelectCommand="Select Status_Service as Status123
                    from ServiceTicket where ServiceTicketID = @ServID">
        <SelectParameters>
            <asp:ControlParameter Name="ServID" Type="int64" ControlID="DdlServiceList" />
        </SelectParameters>
    </asp:SqlDataSource>
   
</asp:Content>

