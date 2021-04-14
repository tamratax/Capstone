<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="PreAuctionAssessment.aspx.cs" Inherits="Lab3.PreAuctionAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <div class="row justify-content-center">
    <h1 class="display-4">Pre-Auction Assessment</h1>
    </div>

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
    <div class="float-right">
    <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
        </div>
    <br />
    <div class="form-group">
        <asp:Label ID="lblInitiating" runat="server" Text="Initiating Employee:"></asp:Label>
        <asp:DropDownList
            ID="ddlInitiating"
            runat="server"
            DataSourceID="dtasrcInitiating"
            DataTextField="EmployeeName"
            DataValueField="EmployeeID"
            OnDataBound="ddlInitiating_DataBound"
            Width="100%">
        </asp:DropDownList>
        <asp:RequiredFieldValidator
        ID="RfvCompletedByEmp"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="ddlInitiating"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:Label ID="lblSell"
            runat="server"
            Text="What do you have to sell?"></asp:Label>
        <asp:TextBox ID="txtWhatToSell"
            runat="server"
            TextMode="MultiLine"
            Rows="5" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtWhatToSell" Text="Required" ForeColor="Red" ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <%--   <asp:Label ID="lblWhy" runat="server" Text="Why are you considering Auction services?"></asp:Label>--%>
            <label>Why are you considering Auction services?</label>
            <asp:DropDownList ID="ddlWhy" runat="server" CssClass="form-control">
                <asp:ListItem Value="-1">Select</asp:ListItem>
                <asp:ListItem>Settling an estate</asp:ListItem>
                <asp:ListItem>Moving and need to downsize</asp:ListItem>
                <asp:ListItem>Getting rid of some stuff</asp:ListItem>
            </asp:DropDownList>
                    <asp:RequiredFieldValidator
        ID="RequiredFieldValidator2"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="ddlWhy"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"
        Display="Dynamic"
        InitialValue="-1"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="form-group col-md-6">
            <%-- <asp:Label ID="lblDeadline" runat="server" Text="Do you have a deadline?"></asp:Label>--%>
            <label>Do you have a deadline?</label>
            <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <asp:Label ID="lblWhatToSchedule" runat="server" Text="What needs to be scheduled?"></asp:Label>
    <br />
    <div>
        <asp:Label ID="Label1" runat="server" Text="Bring-in: "></asp:Label>
        <asp:CheckBox ID="ChkbxBringin" runat="server" />
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Auction Walkthrough: "></asp:Label>
        <asp:CheckBox ID="ChkbxAuctionWalkthrough"
            runat="server"
            OnCheckedChanged="ChkbxAuctionWalkthrough_CheckedChanged"
            AutoPostBack="true" />
    </div>
    <asp:RadioButtonList ID="rblLookat"
        runat="server"
        Visible="false">
        <asp:ListItem>Customer Requests Auction Look-at</asp:ListItem>
        <asp:ListItem>Green Valley Required Auction Look-at</asp:ListItem>
    </asp:RadioButtonList>
    <div>
        <asp:Label ID="Label3" runat="server" Text="Pick-up: "></asp:Label>
        <asp:CheckBox ID="ChkbxPickup" runat="server" />
    </div>
    <div>
        <asp:Label ID="Label4" runat="server" Text="Trash Removal/Donation Hauling: "></asp:Label>
        <asp:CheckBox ID="ChkbxTrash"
            runat="server"
            OnCheckedChanged="ChkbxTrash_CheckedChanged"
            AutoPostBack="true" />
    </div>
    <div class="form-group">
        <asp:Label ID="lblTrashDescription"
            runat="server"
            Text="Trash/Donation Description"
            Visible="false"></asp:Label>

        <asp:TextBox ID="txtTrashDescription"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            Visible="false" CssClass="form-control"></asp:TextBox>
    </div>

    <br />
    <div>
        <asp:Label ID="lblPhotos" runat="server" Text="Have we asked for photos?"></asp:Label>
        <asp:CheckBox ID="ChkbxPhotos" runat="server" />
    </div>
    <div>
        <asp:Label ID="lblItems" runat="server" Text="Have we asked for a list of items?"></asp:Label>
        <asp:CheckBox ID="ChkbxItems" runat="server" />
    </div>
    <br />
    <div class="text-center">
    <asp:Button ID="btnClear" runat="server" class="btn btn-danger" Text="Clear" OnClick="btnClear_Click" />

    <asp:Button ID="btnSave" runat="server" class="btn btn-success" Text="Save" OnClick="btnSave_Click" ValidationGroup="SaveGroup"/>

    <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
        </div>



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
