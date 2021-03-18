<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="Auction.aspx.cs" Inherits="Lab3.Auction" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Auctions</h1>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <fieldset>
                    <legend>Only Completed Auction Servive Tickets Are Shown Below</legend>
                    <asp:Table
                        ID="TblTicketSelection"
                        runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblCustomerDropDown"
                                    runat="server"
                                    Text="Select Customer:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
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
                                <asp:RequiredFieldValidator
                                    ID="RfvCustomerList"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlCustomerList"
                                    Text="This Field Is Required"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    Display="Dynamic"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblServiceSelect"
                                    runat="server"
                                    Text="Select Service:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList
                                    ID="DdlServiceList"
                                    runat="server"
                                    AutoPostBack="true"
                                    OnDataBound="DdlServiceList_DataBound">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator
                                    ID="RfvServiceList"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlServiceList"
                                    Text="This Field Is Required"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    Display="Dynamic"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblSelectAuction"
                                    runat="server"
                                    Text="Select Auction:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList
                                    ID="DdlSelectAuction"
                                    runat="server"
                                    DataSourceID="dtasrcAuctionList"
                                    DataTextField="AuctionDate"
                                    DataValueField="AuctionID"
                                    AutoPostBack="true"
                                    OnDataBound="DdlSelectAuction_DataBound">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator
                                    ID="RfvSelectAuction"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlSelectAuction"
                                    Text="This Field Is Required"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    Display="Dynamic"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Button
                                    ID="BtnSaveAuction"
                                    runat="server"
                                    Text="Assign To Auction"
                                    OnClick="BtnSave_Click"
                                    ValidationGroup="SaveGroup"/>

                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button
                                    ID="BtnClear"
                                    runat="server"
                                    Text="Clear"
                                    OnClick="BtnClear_Click" />
                            </asp:TableCell>
                            <asp:TableCell>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right" ColumnSpan ="3">
                                <asp:Label
                                    ID="LblSaveStatus"
                                    runat="server"
                                    Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


    <asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select Customer.CustomerID, FirstName + ' ' + LastName as CustomerName 
           from Customer join SERVICETICKET on Customer.CustomerID = SERVICETICKET.CustomerID 
           where ServiceType = 'Auction' AND serviceTicket.completed = 'True' 
           order by lastName desc"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dtasrcAuctionList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select AuctionID, AuctionDate
                    from Auction Order By AuctionDate ASC"></asp:SqlDataSource>

</asp:Content>
