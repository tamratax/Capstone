<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerPreActionAssesment.aspx.cs" Inherits="Lab3.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<link href="Content/AddService.css" rel="stylesheet" />
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
   <div class="groupAuction">
    <div class="row justify-content-center">
    <h1 class="display-4">Pre-Auction Assessment</h1>
    </div>
    <br />
    <div class="float-right">
    <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
        </div>
    <br />
    <div class="form-group">
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
            <label>Why are you considering Auction services?</label>
            <asp:DropDownList ID="ddlWhy" runat="server" CssClass="form-control">
                <asp:ListItem Value="-1"> Select</asp:ListItem>
                <asp:ListItem>Settling an estate</asp:ListItem>
                <asp:ListItem>Moving and need to downsize</asp:ListItem>
                <asp:ListItem>Getting rid of some stuff</asp:ListItem>
            </asp:DropDownList>
        <asp:RequiredFieldValidator
        ID="RfvCompletedByEmp"
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
    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-danger" OnClick="btnClear_Click1" />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn-success" ValidationGroup="SaveGroup" />
    <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
    </div>
       </div>

</asp:Content>
