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
                class="form-control"
                OnSelectedIndexChanged="DDLCreateRoom_SelectedIndexChanged"
                AutoPostBack="true">
                <asp:ListItem Value="Select">Select</asp:ListItem>
                <asp:ListItem Value="Living Room">Living Room</asp:ListItem>
                <asp:ListItem Value="Dining Room">Dining Room</asp:ListItem>
                <asp:ListItem Value="Kitchen">Kitchen</asp:ListItem>
                <asp:ListItem Value="Den">Den</asp:ListItem>
                <asp:ListItem Value="Office">Office</asp:ListItem>
                <asp:ListItem Value="Bedroom">Bedroom</asp:ListItem>
                <asp:ListItem Value="Library">Library</asp:ListItem>
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
    <div runat="server" id="divOutBuilding">
        <%--<div>
            <label>Riding Mower</label>
            <asp:CheckBox ID="ChkBoxRideMower" runat="server" />
        </div>
        <div>
            <label>Push Mower</label>
            <asp:CheckBox ID="ChkBoxPushMower" runat="server" />
        </div>
        <div>
            <label>Large Tools</label>
            <asp:CheckBox ID="ChkLrgTools" runat="server" />
        </div>--%>
    </div>
    <div runat="server" id="divAttic">
        <%--<div>
            <label>Accessibility</label>
            <asp:CheckBox ID="ChkBoxAccess" runat="server" />
        </div>
        <div>
            <label>Pull Down Steps</label>
            <asp:CheckBox ID="ChkBoxPullDown" runat="server" />
        </div>--%>
    </div>
    <div runat="server" id="divBasement">
        <%--<div>
            <label>Outside Entrance</label>
            <asp:CheckBox ID="ChkBoxEntrance" runat="server" />
        </div>
        <div>
            <label>Get Truck to Door</label>
            <asp:CheckBox ID="ChkBoxTrucktoDoor" runat="server" />
        </div>--%>
    </div>
    <div runat="server" id="divDiningRoom">
       <%-- <label>Server</label>
        <asp:CheckBox ID="ChkBoxServer" runat="server" OnCheckedChanged="ChkBoxServer_CheckedChanged" AutoPostBack="true" />
        <div runat="server" id="divServer">
            <div>
                <label>High Value?</label>
                <asp:CheckBox ID="ChkBoxHigh" runat="server" />
            </div>
            <div>
                <label>Sideboard?</label>
                <asp:CheckBox ID="ChkBoxSideboard" runat="server" />
            </div>
            <div>
                <label>Mirror Back?</label>
                <asp:CheckBox ID="ChkBoxMirror" runat="server" />
            </div>
            <div>
                <label>Marble Top?</label>
                <asp:CheckBox ID="ChkBoxMarble" runat="server" />
            </div>
        </div>
        <div>
            <label>China Press</label>
            <asp:CheckBox ID="ChkBoxChina" runat="server" OnCheckedChanged="ChkBoxChina_CheckedChanged" AutoPostBack="true" />
        </div>
        <div runat="server" id="divChinaPress">
            <div>
                <label>Bow Front</label>
                <asp:CheckBox ID="ChkBoxBowFront" runat="server" />
            </div>
            <div>
                <label>High Value</label>
                <asp:CheckBox ID="ChkBoxHighValue" runat="server" />
            </div>
            <div>
                <label>2 Piece</label>
                <asp:CheckBox ID="ChkBox2Piece" runat="server" />
            </div>
        </div>
        <div>
            <label>Table</label>
            <asp:CheckBox ID="ChkBoxTable" runat="server" OnCheckedChanged="ChkBoxTable_CheckedChanged" AutoPostBack="true" />
        </div>
        <div runat="server" id="divTable">
            <div class="form-group">
                <label># of Leaves</label>
                <asp:TextBox
                    ID="TxtLeaves"
                    runat="server"
                    Placeholder="1, 2, 3"
                    Class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label># of Chairs</label>
                <asp:TextBox
                    ID="TxtBoxChairs"
                    runat="server"
                    Placeholder="1, 2, 3"
                    Class="form-control"></asp:TextBox>

            </div>
            <div>
                <label>High Value</label>
                <asp:CheckBox ID="ChkBoxHighValue2" runat="server" />
            </div>
        </div>
        <div>
            <label>Pedestal Table / Plant Stand</label>
            <asp:CheckBox ID="ChkBoxPedestal" runat="server" />
        </div>
        <div>
            <label>Silver Chest</label>
            <asp:CheckBox ID="ChkBoxSilver" runat="server" OnCheckedChanged="ChkBoxSilver_CheckedChanged" AutoPostBack="true" />
        </div>
        <div runat="server" id="divSilver">
            <div>
                <label>High Value?</label>
                <asp:CheckBox ID="ChkBoxHighValue3" runat="server" />
            </div>
        </div>
        <div>
            <label>Rug</label>
            <asp:CheckBox ID="ChkBoxRug" runat="server" />
        </div>
        <div>
            <label>Breakfront</label>
            <asp:CheckBox ID="ChkBoxBreakfront" runat="server" OnCheckedChanged="ChkBoxBreakfront_CheckedChanged" AutoPostBack="true" />
        </div>
        <div runat="server" id="divBreakfront">
            <div>
                <label>High Value</label>
                <asp:CheckBox ID="HighValue5" runat="server" />
            </div>
            <div>
                <label>2 Piece</label>
                <asp:CheckBox ID="ChkBox2Piece2" runat="server" />
            </div>
        </div>--%>
    </div>
    <div runat="server" id="divDen">
        <%--<div class="form-control">
            <label># of Sofas</label>
            <asp:TextBox
                ID="TxtSofas"
                runat="server"
                Placeholder="1, 2, 3"
                Class="form-control"></asp:TextBox>
        </div>
        <div class="form-control">
            <label>Leather Sofas</label>
            <asp:TextBox
                ID="TxtLeatherSofas"
                runat="server"
                Placeholder="1, 2, 3"
                Class="form-control"></asp:TextBox>
        </div>--%>
    </div>
    <div runat="server" id="divLivingRoom">
        <%--<div class="form-control">
            <label># of Sofas</label>
            <asp:TextBox
                ID="TxtSofas1"
                runat="server"
                Placeholder="1, 2, 3"
                Class="form-control"></asp:TextBox>
        </div>
        <div class="form-control">
            <label>Leather Sofas</label>
            <asp:TextBox
                ID="TxtLeatherSofas1"
                runat="server"
                Placeholder="1, 2, 3"
                Class="form-control"></asp:TextBox>

        </div>--%>
    </div>
    <div runat="server" id="divOtherRoom">
        <div class="form-group">
            <label>Other Room</label>
            <asp:TextBox ID="TxtOtherRoom"
                runat="server"
                class="form-control"
                Placeholder="Other Room"></asp:TextBox> <%--//Include an if statement on C# that throws this into the "RoomName" attribute--%>
        </div>
    </div>
    <div class="form-group">
        <label>Floor</label>
        <asp:DropDownList
            ID="DDLFloor"
            runat="server"
            class="form-control"
            OnSelectedIndexChanged="DDLFloor_SelectedIndexChanged" AutoPostBack="true">
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
        <asp:RadioButtonList ID="RBBtnBox" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RBBtnBox_SelectedIndexChanged">
            <asp:ListItem Value="Yes" Text="Yes"> </asp:ListItem>
            <asp:ListItem Value="No" Text="No"></asp:ListItem>
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
            <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" />
            <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
        </div>
        <div>
             <asp:GridView ID="grvBox"
                   runat="server" 
                 AutoGenerateColumns="false" 
                 CellPadding="3" 
                 AutoGenerateDeleteButton="true" 
                 Visible="true" 
                 DataSourceID="grdsrcBox" 
                 DataKeyNames="BoxesID" 
                 AutoGenerateEditButton="true">
            <Columns>
                <asp:BoundField DataField="BoxesID" Visible="false" />
                <asp:BoundField DataField="BoxType"  HeaderText="Type" />
                <asp:BoundField DataField="BoxQuantity"  HeaderText="Quantity" />
            </Columns>
                 </asp:GridView>
        </div>
    </div>
    <div class="form-group">
        <label>Blankets?</label>
        <asp:TextBox ID="TxtBlanket" runat="server" CssClass="form-control" placeholder="Blankets"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Notes about Room</label>
        <asp:TextBox
            ID="TxtAdditional"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
     <div class="form-group">
        <label>High Values?</label>
        <asp:TextBox
            ID="TextBox1"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
     <div class="form-group">
        <label>Large/Awkward Items?</label>
        <asp:TextBox
            ID="TextBox2"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
     <div class="form-group">
        <label>Collectibles/Curios?</label>
        <asp:TextBox
            ID="TextBox3"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
     <div class="form-group">
        <label>Appliances/Electronics?</label>
        <asp:TextBox
            ID="TextBox4"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            class="form-control"
            Placeholder="Enter additional notes"></asp:TextBox>
    </div>
    <br />
    <div class="float-right">
        <asp:Button ID="BtnAddRoom" runat="server" Text="Add Room" AutoPostBack="true" OnClick="BtnAddRoom_Click" />
        <asp:Button ID="BtnReturn" runat="server" Text="Return to Move Assessment" AutoPostBack="true" OnClick="BtnReturn_Click" />
    </div>
     <asp:SqlDataSource ID="grdsrcBox"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select BoxesID, BoxType, BoxQuantity FROM BOXES WHERE RoomID IS NULL"
        DeleteCommand="DELETE Boxes where BoxesID = @BoxesID" UpdateCommand="UPDATE Boxes SET BoxType = @BoxType, BoxQuantity = @BoxQuantity WHERE BoxesID = @BoxesID">
     </asp:SqlDataSource>
</asp:Content>
