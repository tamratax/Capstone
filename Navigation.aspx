<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navigation.aspx.cs" Inherits="WalkerS_Lab1Part3.Navigation" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: Stuart Walker & Aaron Walsh --%>


<asp:Content ID="test" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <div id="layoutSidenav_content">
        <%--   <asp:Table
        ID="Table2"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>--%>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Customer Search: "></asp:Label>
            <asp:TextBox
                ID="TxtSearch"
                runat="server"></asp:TextBox>
            <asp:Button
                ID="BtnSearch"
                runat="server" Text="Search"
                OnClick="BtnSearch_Click" />

        </div>
        <div>
            <asp:GridView ID="GridViewCustomers"
                runat="server"
                EmptyDataText="No Customers Found"
                DataKeyNames="CustomerID"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="homephone" HeaderText="Home" />
                    <asp:BoundField DataField="Workphone" HeaderText="Work" />
                    <asp:BoundField DataField="Cellphone" HeaderText="Cell" />
                </Columns>

            </asp:GridView>
        </div>
        <fieldset>
            <legend>Navigation</legend>
            <asp:Button ID="BtnCustomerPage"
                runat="server"
                Text="View Customer"
                OnClick="BtnCustomerPage_Click" />

            <asp:Button ID="BtnServicePage"
                runat="server"
                Text="View Services"
                OnClick="BtnServicePage_Click" />

            <asp:Button ID="BtnViewNotes"
                runat="server"
                Text="View Notes"
                OnClick="BtnViewNotes_Click" />

            <%--<asp:Button ID="BtnAddCustomerPage"
                        runat="server"
                        Text="Add Customer"
                        OnClick="BtnAddCustomerPage_Click" />--%>

            <%--                    <asp:Button ID="btnAddServicePage"
                        runat="server"
                        Text="Add Service"
                        OnClick="BtnAddServicePage_Click" />--%>

            <%--                    <asp:Button ID="BtnAddNote"
                        runat="server"
                        Text="Add Note"
                        OnClick="BtnAddNote_Click" />--%>





            <%--                    <asp:Button ID="BtnWarehouse" 
                        runat="server" 
                        Text="Add Items to Warehouse" 
                        OnClick="BtnWarehouse_Click" />--%>

            <%--                    <asp:Button ID="BtnAuctionInvt" 
                        runat="server" 
                        Text="Auction Inventory"
                        onclick="BtnAUctionInvt_Click"/>--%>

            <asp:Button ID="BtnMoveInvt"
                runat="server"
                Text="Move Inventory"
                OnClick="BtnMoveInvt_Click" />

            <%--                    <asp:Button ID="BtnCompletion" 
                        runat="server" 
                        Text="Completion Form"
                        OnClick="BtnCompletion_Click"/>--%>
        </fieldset>
        <%-- <div>
            <asp:Label ID="Label1" runat="server" Text="Customer Search: "></asp:Label>
            <asp:TextBox
                ID="TxtSearch"
                runat="server"></asp:TextBox>
            <asp:Button
                ID="BtnSearch"
                runat="server" Text="Search"
                OnClick="BtnSearch_Click" />
            
        </div>
        <div>
            <asp:GridView ID="GridViewCustomers" 
                runat="server" 
                EmptyDataText="No Customers Found"
                DataKeyNames="CustomerID"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="homephone" HeaderText="Home" />
                    <asp:BoundField DataField="Workphone" HeaderText="Work" />
                    <asp:BoundField DataField="Cellphone" HeaderText="Cell" />
                </Columns>

            </asp:GridView>
        </div>--%>
        <%-- <fieldset>
            <legend>Navigation</legend>
            <asp:Button ID="BtnCustomerPage"
                runat="server"
                Text="View Customer"
                OnClick="BtnCustomerPage_Click" />

            <asp:Button ID="BtnServicePage"
                runat="server"
                Text="View Services"
                OnClick="BtnServicePage_Click" />

            <asp:Button ID="BtnViewNotes"
                runat="server"
                Text="View Notes"
                OnClick="BtnViewNotes_Click" />

            <asp:Button ID="BtnAddCustomerPage"
                runat="server"
                Text="Add Customer"
                OnClick="BtnAddCustomerPage_Click" />

            <asp:Button ID="btnAddServicePage"
                runat="server"
                Text="Add Service"
                OnClick="BtnAddServicePage_Click" />

            <asp:Button ID="BtnAddNote"
                runat="server"
                Text="Add Note"
                OnClick="BtnAddNote_Click" />





            <asp:Button ID="BtnWarehouse"
                runat="server"
                Text="Add Items to Warehouse"
                OnClick="BtnWarehouse_Click" />

            <asp:Button ID="BtnAuctionInvt"
                runat="server"
                Text="Auction Inventory"
                OnClick="BtnAUctionInvt_Click" />

            <asp:Button ID="BtnMoveInvt"
                runat="server"
                Text="Move Inventory"
                OnClick="BtnMoveInvt_Click" />

            <asp:Button ID="BtnCompletion"
                runat="server"
                Text="Completion Form"
                OnClick="BtnCompletion_Click" />

        </fieldset>--%>
        <%--           </asp:TableCell>
>>>>>>> 3a077e1b24ac9b7373b5b4925a31aefde9c6cfeb
        </asp:TableRow>
    </asp:Table>
        <br />
        <%--  <asp:Table
        ID="TblNotifications"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>--%>
        <fieldset>
            <legend>Notifications</legend>
            <%--<asp:Table
                        ID="Table1"
                        runat="server">
                        <asp:TableRow>
                            <asp:TableCell>--%>
            <asp:Label
                ID="LblNewCustomer"
                runat="server"
                Text="Incomplete Customer (Date Last Contacted):"></asp:Label>
            <br />
            <%-- </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>--%>
            <asp:ListBox
                ID="LstBoxCustomerRequests"
                runat="server"
                OnSelectedIndexChanged="LstBoxCustomerRequests_SelectedIndexChanged"
                AutoPostBack="true"></asp:ListBox>
            <br />
            <br />
            <%-- </asp:TableCell>
=======
            <asp:Label
                ID="LblNewCustomer"
                runat="server"
                Text="Incomplete Customer (Date Last Contacted):"></asp:Label>
            <%-- </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>--%>
            <%--            <asp:ListBox
                ID="LstBoxCustomerRequests"
                runat="server"
                OnSelectedIndexChanged="LstBoxCustomerRequests_SelectedIndexChanged"
                AutoPostBack="true"></asp:ListBox>--%>
            <%-- </asp:TableCell>
>>>>>>> 3a077e1b24ac9b7373b5b4925a31aefde9c6cfeb
                        </asp:TableRow>--%>
            <%-- <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblServicerequests"
                                    runat="server"
                                    Text="New Customer Service Requests:"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:ListBox
                                    ID="LstBoxServiceRequests"
                                    runat="server"
                                    OnSelectedIndexChanged="LstBoxServiceRequests_SelectedIndexChanged"
                                    AutoPostBack="true"></asp:ListBox>
                            </asp:TableCell>
                        </asp:TableRow>--%>
            <%-- <asp:TableRow>
                            <asp:TableCell>--%>
            <asp:Label
                ID="LblIncompleteServiceTickets"
                runat="server"
                Text="Incomplete Service Tickets:"></asp:Label>
            <br />
            <%-- </asp:TableCell>
=======
            <asp:Label
                ID="LblIncompleteServiceTickets"
                runat="server"
                Text="Incomplete Service Tickets:"></asp:Label>
            <%-- </asp:TableCell>
>>>>>>> 3a077e1b24ac9b7373b5b4925a31aefde9c6cfeb
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>--%>
            <asp:ListBox
                ID="LstBoxIncompleteServiceTickets"
                runat="server"
                OnSelectedIndexChanged="LstBoxIncompleteServiceTickets_SelectedIndexChanged"
                AutoPostBack="true"></asp:ListBox>
            <%-- </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>--%>
        </fieldset>
        <%--</asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>
    </div>
</asp:Content>
