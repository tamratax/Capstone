<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveServiceOrderForm.aspx.cs" Inherits="Lab3.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
            <label>Service Date</label>
            <%--            <input type="text" class="form-control" id="inputCity" />--%>
            <asp:TextBox ID="TxtServiceDate"
                runat="server"
                class="form-control"
                Placeholder=""
                TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-row">
        <div class="form-group col-md-6">
            <label>First Name</label>
            <%--      <input type="email" class="form-control" id="TxtFirstName" placeholder="First Name" />--%>
            <asp:TextBox
                ID="TxtFirstName"
                runat="server"
                Placeholder="First Name"
                class="form-control">
            </asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label>Last Name</label>
            <%--      <input type="password" class="form-control" id="TxtLastName" placeholder="Password" />--%>
            <asp:TextBox
                ID="TxtLastName"
                runat="server"
                Placeholder="Last Name"
                class="form-control">
            </asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label>Email</label>
        <%--            <input type="email" class="form-control" id="inputEmail4" placeholder="Email">--%>
        <asp:TextBox
            ID="TxtEmail"
            runat="server"
            Placeholder="Email Address"
            class="form-control"></asp:TextBox>
    </div>
    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Cell Phone</label>
            <asp:TextBox
                ID="TxtCellPhone"
                runat="server"
                Placeholder="Cell Phone"
                class="form-control"></asp:TextBox>
        </div>
                <div class="form-group col-md-4">
            <label>Home Phone</label>
            <asp:TextBox
                ID="TxtPhoneNumber"
                runat="server"
                Placeholder="Home Phone"
                class="form-control"></asp:TextBox>
        </div>
         <div class="form-group col-md-4">
            <label>Work Phone</label>
            <asp:TextBox
                ID="txtworkPhome"
                runat="server"
                Placeholder="Work Phone"
                class="form-control"></asp:TextBox>
        </div>
    </div>
            <div class="form-group">
        <label>Current Address</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder=""
            class="form-control"></asp:TextBox>
    </div>
            <div class="form-row">
         <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <asp:TextBox ID="TxtCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <asp:TextBox ID="TxtState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <asp:TextBox ID="TxtZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>
            <div class="form-group">
        <label>Current Address</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="MoveAddress"
            runat="server"
            Placeholder=""
            class="form-control"></asp:TextBox>
    </div>
            <div class="form-row">
         <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <asp:TextBox ID="MoveCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <asp:TextBox ID="MoveState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <asp:TextBox ID="MoveZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label>Is ther Packing?: </label>
        <asp:CheckBox
            ID="ChkBoxCompleted"
            runat="server" />
    </div>
    <div class="form-group">
        <label>Is there Trash Removal/Donations?: </label>
        <asp:CheckBox
            ID="CheckBoxTrash"
            runat="server" />
    </div>
    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Type of Home</label>
            <asp:TextBox
                ID="TypeHome"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Truck Accessibility</label>
            <asp:TextBox
                ID="TruckAccess"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Walking Distance</label>
            <asp:TextBox
                ID="WalkingDistance"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
    </div>

     <div class="form-row">
        <div class="form-group col-md-4">
            <label>Number of Steps</label>
            <asp:TextBox
                ID="Txtsteps"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Special Equipment</label>
            <asp:TextBox
                ID="Txtequp"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Trucks We Are Taking</label>
            <asp:TextBox
                ID="txttrucks"
                runat="server"
                Placeholder=""
                class="form-control"></asp:TextBox>
        </div>
    </div>
 


</asp:Content>
