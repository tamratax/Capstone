<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AuctionInventory.aspx.cs" Inherits="Lab3.ItemRecieval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">



    <asp:Label ID="LblCustomer" runat="server" Text="Customer Name: "></asp:Label>
    <asp:Label ID="LblCustomerName" runat="server" Font-Underline="true" Text=""></asp:Label>


            <asp:Label ID="LblType"
                runat="server"
                Text="Select Service: ">
            </asp:Label>
            <asp:DropDownList
                ID="DDLType"
                runat="server"
                OnDataBound="DDLType_DataBound"
                AutoPostBack="true"
                DataSourceID="dtasrcServices"
                DataValueField="ServiceTicketID"
                DataTextField="Service">
            </asp:DropDownList>

            <asp:RequiredFieldValidator
                ID="RfvServiceTicket"
                runat="server"
                ErrorMessage="RequiredFieldValidator"
                ControlToValidate="DDLType"
                Text="Please Choose A Valid Option"
                ForeColor="Red"
                SetFocusOnError="true"
                ValidationGroup="SaveGroup"
                InitialValue="-1"></asp:RequiredFieldValidator>


    <asp:TableRow>
        <asp:TableCell>
            <asp:Label ID="NoteLbl" runat="server" Text="Auction Notes:"></asp:Label>
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="TxtNotes" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>

    <br />

    <br />

    <br />
    <asp:Table ID="Table3" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button
                    ID="BtnSave"
                    runat="server"
                    Text="Save"
                    OnClick="BtnSave_Click"
                    ValidationGroup="SaveGroup" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label
                    ID="LblSaveStatus"
                    runat="server"
                    Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcServices"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select ServiceTicketID, ServiceType + ' ' + TicketOpenDate 'Service' from ServiceTicket where CustomerID = @CustomerID"
        >
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="SelectedCustomerID" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
