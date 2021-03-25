<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="PreMoveAssessment.aspx.cs" Inherits="Lab3.PreMoveAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Preliminary Move Assessment</h1>
     <div class="form-group">
        <label>What day do you have to be out by?</label>
         <asp:TextBox ID="DateOutTxt" runat="server" TextMode="Date"
             class="form-control"></asp:TextBox>
         </div>
    <div class="form-row">
    <div class="form-group col-md-6">
        <label>Range of Days (Start)</label>
 <asp:TextBox ID="TxtRange1" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label>Finish</label>
    <asp:TextBox ID="TxtRange2" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
        </div>
        </div>
    <%--<asp:Label ID="DateOutLbl" runat="server" Text="What Day do you have to be Out By:"></asp:Label>--%>
    <%--<asp:TextBox ID="DateOutTxt" runat="server" TextMode="Date"></asp:TextBox>--%>
    <%--<asp:Label ID="RangeLbl" runat="server" Text="Range of Days"></asp:Label>--%>
   <%-- <asp:TextBox ID="TxtRange1" runat="server" TextMode="Date"></asp:TextBox>--%>
<%--    <asp:TextBox ID="TxtRange2" runat="server" TextMode="Date"></asp:TextBox>--%>
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
         </div>
     <div class="form-row">
        <div class="form-group col-md-6">
            <label>City</label>
            <asp:TextBox ID="DestCityTxt"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>State</label>
            <asp:TextBox ID="DestStateTxt"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label>Zip</label>
            <asp:TextBox ID="DestZipTxt"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>


<%--    <asp:Label ID="DestinationLbl" runat="server" Text="Destination Address:"></asp:Label>--%>
<%--    <asp:TextBox ID="DestCityTxt" runat="server"></asp:TextBox>
    <asp:TextBox ID="DestStateTxt" runat="server"></asp:TextBox>
    <asp:TextBox ID="DestZipTxt" runat="server"></asp:TextBox>--%>
<%--    <asp:TextBox ID="DestAddress" runat="server"></asp:TextBox> --%>

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
            <asp:CheckBox ID="TrashChk" runat="server" />
    </div>
      <div>
        <label>Donation Hauling: </label>
            <asp:CheckBox ID="DonationChk" runat="server" />
    </div>
      <div>
        <label>Auction Service: </label>
            <asp:CheckBox ID="AuctionChk" runat="server" />
    </div>
<%--    <asp:CheckBox ID="PackingChk" runat="server" />--%>
<%--    <br />
    <asp:CheckBox ID="TrashChk" runat="server" Text="Trash Removal" />
    <br />
    <asp:CheckBox ID="DonationChk" runat="server" Text="Donation Hauling" />
    <br />
    <asp:Label ID="AuctionLbl" runat="server" Text="Auction Service:"></asp:Label>
    <br />
    <asp:CheckBox ID="AuctionChk" runat="server" />--%>
    <br />
    <div class="form-group float-right">
    <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" />
        </div>
    <br />
    <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>







</asp:Content>
