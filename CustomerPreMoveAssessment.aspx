<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerPreMoveAssessment.aspx.cs" Inherits="Lab3.CustomerPreMoveAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
   <div class="groupAuction">
    <div class="row justify-content-center">
    <h1 class="display-4">Pre-Move Assessment</h1>
    </div>
<div>
    <div class="float-right">
        <asp:Button ID="PopBtn" runat="server" Text="Populate" OnClick="PopBtn_Click"/>
        </div>
    <div class="float-left">
        <asp:Button ID="BackBtn" runat="server" Text="Home" OnClick="BackBtn_Click" />
    </div>

    <br />
    <div class="form-group">
    </div>
     <div class="form-group">
        <label>What day do you have to be out by?</label>
         <asp:TextBox ID="DateOutTxt" runat="server" TextMode="Date"
             class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DateOutTxt" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

         </div>
    <div class="form-row">
    <div class="form-group col-md-6">
        <label>Range of Days (Start)</label>
        <asp:TextBox ID="TxtRange1" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtRange1" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group col-md-6">
            <label>Finish</label>
    <asp:TextBox ID="TxtRange2" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtRange2" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

        </div>
        </div>

    <asp:CompareValidator 
        ID="CvRangeCompare" 
        runat="server" 
        ErrorMessage="CompareValidator"
        ControlToValidate="TxtRange2"
        ControlToCompare="TxtRange1"
        Type="Date"
        Operator="GreaterThanEqual"
        Text="Deadline End Must Be After Deadline Start"
        ForeColor="Red"
        SetFocusOnError="true"></asp:CompareValidator>
     <div class="form-group">
        <label>Address</label>
    <asp:TextBox ID="DestAddressTxt" runat="server"
        Placeholder="1234 Main St"
        class="form-control"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DestAddressTxt" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

         </div>
     <div class="form-row">
        <div class="form-group col-md-6">
            <label>City</label>
            <asp:TextBox ID="DestCityTxt"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DestCityTxt" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group col-md-4">
            <label>State</label>
            <asp:TextBox ID="DestStateTxt"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DestStateTxt" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group col-md-2">
            <label>Zip</label>
            <asp:TextBox ID="DestZipTxt"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DestZipTxt" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ValidationGroup="Save" ControlToValidate="DestZipTxt" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text="Please only use numbers"></asp:CompareValidator>
     
        </div>
    </div>


    <br />
    <asp:Label ID="MlsLbl" runat="server" Text="Is there a MLS listing? "></asp:Label>
    <asp:RadioButtonList ID="MLSBTN" runat="server">
        <asp:ListItem Text="Yes"> </asp:ListItem>
        <asp:ListItem Text="No"></asp:ListItem>
    </asp:RadioButtonList>
     <br />
     <asp:Label ID="PhotosLbl" runat="server" Text="Can you send Photos? "></asp:Label>
    <asp:RadioButtonList ID="PhotosBtn" runat="server">
        <asp:ListItem Text="Yes"> </asp:ListItem>
        <asp:ListItem Text="No"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="AddOnLbl" runat="server" Text="Add on Services"></asp:Label>
    <br />
    <div>
        <label>Packing: </label>
            <asp:CheckBox ID="PackingChk" runat="server" />
    </div>
      <div>
        <label>Trash Removal: </label>
            <asp:CheckBox ID="TrashChk" runat="server"  AutoPostBack="true" OnCheckedChanged="TrashChk_CheckedChanged" />
            <asp:TextBox ID="TrashDescriptionTxt" runat="server" AutoPostBack="true" TextMode="MultiLine" Visible="false" CssClass="form-control"></asp:TextBox>
    </div>
      <div>
        <label>Donation Hauling: </label>
            <asp:CheckBox ID="DonationChk" runat="server" />
    </div>
      <div>
        <label>Auction Service: </label>
            <asp:CheckBox ID="AuctionChk" runat="server" />
    </div>

    <br />
    <div class="text-center">
        <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" CssClass="btn-danger" />
    <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" CssClass="btn-success" ValidationGroup="Save"/>
        </div>
    <br />
    <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>





    </div>

</div>
        
</asp:Content>
