<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="Lab3.AddRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 class="display-6">Room Information</h1>
    <div class="row">
        <div class="form-group col-md-6">
            <label>Select Room</label>
            <asp:DropDownList
                ID="DDLCreateRoom"
                runat="server"
                class="form-control">
                <asp:ListItem Value="Select">Select</asp:ListItem>
                <asp:ListItem Value="Living Room">Living Room</asp:ListItem>
                <asp:ListItem Value="Dining Room">Dining Room</asp:ListItem>
                <asp:ListItem Value="Kitchen">Kitchen</asp:ListItem>
                <asp:ListItem Value="Den">Den</asp:ListItem>
                <asp:ListItem Value="Office">Office</asp:ListItem>
                <asp:ListItem Value="Bedroom">Bedroom</asp:ListItem>
                <asp:ListItem Value="Attic">Attic</asp:ListItem>
                <asp:ListItem Value="Basement">Basement</asp:ListItem>
                <asp:ListItem Value="Garage">Garage</asp:ListItem>
                <asp:ListItem Value="Patio/Porch">Patio/Porch</asp:ListItem>
                <asp:ListItem Value="Outbuilding">Outbuilding</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-6">
            <label>Room Identifier</label>
            <asp:TextBox
                ID="TxtRoomIdentify"
                runat="server"
                class="form-control"
                Placeholder=" Ex: Master, 1, 2, etc."></asp:TextBox>
        </div>
    </div>
            <div runat="server" id="divOtherRoom">
            <div class="form-group">
                <label>Other Room</label>
                <asp:TextBox ID="TxtOtherRoom"
                    runat="server"
                    class="form-control"
                    Placeholder="Other room"></asp:TextBox>
            </div>
        </div>
    <div class="form-group">
        <label>Floor</label>
        <asp:DropDownList
            ID="DDLFloor"
            runat="server"
            class="form-control">
            <asp:ListItem Value="Select" Text="Select"> </asp:ListItem>
            <asp:ListItem Value="Ground Floor" Text="Ground Floor"> </asp:ListItem>
            <asp:ListItem Value="2nd Floor" Text="2nd Floor"></asp:ListItem>
            <asp:ListItem Value="3rd Floor" Text="3rd Floor"> </asp:ListItem>
            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
            <asp:ListItem Value="Other" Text="Other"> </asp:ListItem>
        </asp:DropDownList>
    </div>
    <div runat="server" id="divOtherFloor" class="form-group">
        <label>Other Floor</label>
        <asp:TextBox ID="BoxOther"
            runat="server"
            class="form-control"
            Placeholder="Other floor"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="BoxLbl" runat="server" Text="Need Boxes? "></asp:Label>
        <asp:RadioButtonList ID="RBBtnBox" runat="server">
            <asp:ListItem Text="Yes"> </asp:ListItem>
            <asp:ListItem Text="No"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div runat="server" id="divYesBox">
        <div class="form-group">
            <label>Type</label>
            <asp:DropDownList
                ID="DDLType"
                runat="server"
                class="form-control">
                <asp:ListItem Value="Select">Select</asp:ListItem>
                <asp:ListItem Value="Small">Small</asp:ListItem>
                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                <asp:ListItem Value="Large">Large</asp:ListItem>
                <asp:ListItem Value="Wardrobe">Wardrobe</asp:ListItem>
                <asp:ListItem Value="Art">Art</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Quantity</label>
            <asp:TextBox
                ID="TxtQty"
                runat="server"
                class="form-control"
                Placeholder="1, 2, 3"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="BtnAdd" runat="server" Text="Add" />
        </div>
    </div>
    <div>
        <label>Blankets?</label>
        <asp:RadioButtonList ID="RBBlanket" runat="server">
            <asp:ListItem Text="Yes"> </asp:ListItem>
            <asp:ListItem Text="No"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="form-group">
        <label>Additional Notes</label>
        <asp:TextBox
            ID="TxtAdditional"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
    <br />
    <div class="float-right">
        <asp:Button ID="BtnAddRoom" runat="server" Text="Add Room" />
        <asp:Button ID="BtnSave" runat="server" Text="Save" />
    </div>
</asp:Content>
