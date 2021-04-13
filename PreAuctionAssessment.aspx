<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="PreAuctionAssessment.aspx.cs" Inherits="Lab3.PreAuctionAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <h1>Pre-Auction Assessment</h1>

    <h4>Customer Info:</h4>
    <fieldset>
        <div class="groupCust">
            <asp:Label ID="LblCust" runat="server" Text="Customer Name: "></asp:Label>
            &nbsp;
    <asp:Label ID="LblCustName" runat="server" Text=""></asp:Label>

            <div>
                <asp:Label
                    ID="LblHomePhone"
                    runat="server"
                    Text="Home Phone: "></asp:Label>

                <asp:Label ID="LblHomeNumber"
                    runat="server"
                    Text=""
                    Font-Bold="true"></asp:Label>
                <br />
                <asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text="   Cell Phone: "></asp:Label>

                <asp:Label
                    ID="LblCellNumber"
                    runat="server"
                    Text=""
                    Font-Bold="true"></asp:Label>
                <br />
                <asp:Label
                    ID="LblWorkPhone"
                    runat="server"
                    Text="   Work Phone: "></asp:Label>

                <asp:Label
                    ID="LblWorkNumber"
                    runat="server"
                    Text=""
                    Font-Bold="true"></asp:Label>
                <br />
                <asp:Label
                    ID="LblEmail"
                    runat="server"
                    Text="Email:"></asp:Label>

                <asp:Label
                    ID="LblEmailText"
                    runat="server"
                    Text=""
                    Font-Bold="true"></asp:Label>
            </div>

            <div>
                <asp:GridView ID="GridAddress"
                    runat="server"
                    DataSourceID="dtasrcAddress"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    DataKeyNames="AddressID"
                    CsssClass="table justify-content-center">
                    <Columns>
                        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />
                        <asp:BoundField DataField="AddressID" Visible="false" />
                        <asp:BoundField DataField="Street" HeaderText="Street" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="State" HeaderText="State" />
                        <asp:BoundField DataField="Zip" HeaderText="Zip" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </fieldset>
    <br />
    <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
    <br />
    <asp:Label ID="lblInitiating" runat="server" Text="Initiating Employee:"></asp:Label>
    <asp:DropDownList
        ID="ddlInitiating"
        runat="server"
        DataSourceID="dtasrcInitiating"
        DataTextField="EmployeeName"
        DataValueField="EmployeeID"
        OnDataBound="ddlInitiating_DataBound">
    </asp:DropDownList>

    <asp:Label ID="lblSell"
        runat="server"
        Text="What do you have to sell?"></asp:Label>
    <asp:TextBox ID="txtWhatToSell"
        runat="server"
        TextMode="MultiLine"
        Rows="5"></asp:TextBox>

    <br />

    <asp:Label ID="lblWhy" runat="server" Text="Why are you considering Auction services?"></asp:Label>
    <asp:DropDownList ID="ddlWhy" runat="server">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Settling an estate</asp:ListItem>
        <asp:ListItem>Moving and need to downsize</asp:ListItem>
        <asp:ListItem>Getting rid of some stuff</asp:ListItem>
    </asp:DropDownList>

    <br />

    <asp:Label ID="lblDeadline" runat="server" Text="Do you have a deadline?"></asp:Label>
    <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date"></asp:TextBox>

    <br />
    <asp:Label ID="lblWhatToSchedule" runat="server" Text="What needs to be scheduled?"></asp:Label>

    <asp:Label ID="Label1" runat="server" Text="Bring-in"></asp:Label>
    <asp:CheckBox ID="ChkbxBringin" runat="server" />

    <asp:Label ID="Label2" runat="server" Text="Auction Walkthrough"></asp:Label>
    <asp:CheckBox ID="ChkbxAuctionWalkthrough"
        runat="server"
        OnCheckedChanged="ChkbxAuctionWalkthrough_CheckedChanged"
        AutoPostBack="true" />

    <asp:RadioButtonList ID="rblLookat"
        runat="server"
        Visible="false">
        <asp:ListItem>Customer Requests Auction Look-at</asp:ListItem>
        <asp:ListItem>Green Valley Required Auction Look-at</asp:ListItem>
    </asp:RadioButtonList>

    <asp:Label ID="Label3" runat="server" Text="Pick-up"></asp:Label>
    <asp:CheckBox ID="ChkbxPickup" runat="server" />

    <asp:Label ID="Label4" runat="server" Text="Trash Removal/Donation Hauling"></asp:Label>
    <asp:CheckBox ID="ChkbxTrash"
        runat="server"
        OnCheckedChanged="ChkbxTrash_CheckedChanged"
        AutoPostBack="true" />

    <asp:Label ID="lblTrashDescription"
        runat="server"
        Text="Trash/Donation Description"
        Visible="false"></asp:Label>

    <asp:TextBox ID="txtTrashDescription"
        runat="server"
        TextMode="MultiLine"
        Rows="5"
        Visible="false"></asp:TextBox>

    <br />


    <br />


    <br />

    <asp:Label ID="lblPhotos" runat="server" Text="Have we asked for photos?"></asp:Label>
    <asp:CheckBox ID="ChkbxPhotos" runat="server" />

    <br />

    <asp:Label ID="lblItems" runat="server" Text="Have we asked for a list of items?"></asp:Label>
    <asp:CheckBox ID="ChkbxItems" runat="server" />

    <br />
    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-danger" OnClick="btnClear_Click" />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>



    <asp:SqlDataSource ID="dtasrcAddress"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT * from Address join customer on Customer.CustomerID = Address.CustomerID where Customer.CustomerID = @CustomerID"
        DeleteCommand="DELETE ADDRESS where AddressID = @AddressID"
        UpdateCommand="UPDATE ADDRESS set Street = @Street, City = @City, State = @State, Zip = @Zip, Description = @Description where AddressID = @AddressID">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="SelectedCustomerID" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dtasrcInitiating"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName
                    from Employee Order By EmpLastName ASC"></asp:SqlDataSource>
</asp:Content>
