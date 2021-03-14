<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navigation.aspx.cs" Inherits="WalkerS_Lab1Part3.Navigation" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <asp:Table
        ID="Table2"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
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

                    <asp:Button ID="BtnAuctions"
                        runat="server"
                        Text="Auction"
                        OnClick="BtnAuctions_Click" />

                    <asp:Button ID="BtnAddItem" 
                        runat="server" 
                        Text="AddItem" 
                        OnClick="BtnAddItem_Click" />

                    <asp:Button ID="BtnWarehouse" 
                        runat="server" 
                        Text="Add Items to Warehouse" 
                        OnClick="BtnWarehouse_Click" />

                    <asp:Button ID="BtnAuctionInvt" 
                        runat="server" 
                        Text="Auction Inventory"
                        onclick="BtnAUctionInvt_Click"/>

                    <asp:Button ID="BtnMoveInvt" 
                        runat="server" 
                        Text="Move Inventory"
                        onclick="BtnMoveInvt_Click"/>

                    <asp:Button ID="BtnCompletion" 
                        runat="server" 
                        Text="Completion Form"
                        OnClick="BtnCompletion_Click"/>

                </fieldset>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table
        ID="TblNotifications"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <fieldset>
                    <legend>Notifications</legend>
                    <asp:Table
                        ID="Table1"
                        runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblNewCustomer"
                                    runat="server"
                                    Text="New Customer Service Requests:"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:ListBox
                                    ID="LstBoxCustomerRequests"
                                    runat="server"
                                    OnSelectedIndexChanged="LstBoxCustomerRequests_SelectedIndexChanged"
                                    AutoPostBack="true"></asp:ListBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblIncompleteServiceTickets"
                                    runat="server"
                                    Text="Incomplete Service Tickets:"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:ListBox
                                    ID="LstBoxIncompleteServiceTickets"
                                    runat="server"
                                    OnSelectedIndexChanged="LstBoxIncompleteServiceTickets_SelectedIndexChanged"
                                    AutoPostBack="true"></asp:ListBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
