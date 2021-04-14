<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerAppraisel.aspx.cs" Inherits="Lab3.CustomerAppraisel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <body>
        <link href="Content/AddService.css" rel="stylesheet" />
    <h1>Appraisal Service Order</h1>

    <br />

    <h2>Create Appraisal Service</h2>
        <div class="float-right">
         <asp:Button ID="BtnPopulate"
                runat="server"
                Text="Populate"
                OnClick="BtnPopulate_Click" />
    </div>
    <div runat="server" id="divOutBuilding">
        <div>
            <h5>Purpose of Appraisal</h5>
        </div>
        <div>
            <asp:CheckBox ID="ChkBoxEstate" runat="server" />
            <label>Estate</label>
        </div>
        <div>
            <asp:CheckBox ID="ChkBoxFamily" runat="server" />
            <label>Family Division</label>
        </div>
    </div>
    <br />
    <div runat="server" id="div1">
        <div>
            <h5>Deadline</h5>
        </div>
        <div>
            <asp:CheckBox ID="ChkBoxDeadline" runat="server" OnCheckedChanged="ChkBoxDeadline_CheckedChanged" AutoPostBack="true" />
            <label>Is There a Deadline?</label>
        </div>

        <div runat="server" id="DeadlineHidden">
            <label>When is it?</label>
            <asp:TextBox ID="TxtDeadline" runat="server" TextMode="Date"></asp:TextBox>
        </div>

    </div>
    <br />
    <div runat="server" id="div2">
        <div>
            <h5>Size of Appraisal</h5>
        </div>
        <div class="form-group">
            <asp:TextBox ID="TxtAppraisalSize" Placeholder="Size of Appraisal" runat="server" Class="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <div runat="server" id="div3">
        <div>
            <h5>Inventory</h5>
        </div>
        <div class="form-group">

            <asp:TextBox ID="TxtInventory" runat="server" Placeholder="Inventory" TextMode="MultiLine" Rows="5" Columns="25" Class="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <div runat="server" id="div4">
        <div>
            <h5>Additional Services</h5>
        </div>
        <div>
            <asp:CheckBox ID="ChkBoxMove" runat="server" />
            <label>Move Assessment</label>
        </div>
        <div>
            <asp:CheckBox ID="ChkBoxAuction" runat="server" />
            <label>Auction Assessment</label>
        </div>
    </div>
    <br />
    <div runat="server" id="div5">
       
        <br />
        <asp:Button ID="BtnUploadPhotos" runat="server" Text="Upload Photos" OnClick="BtnUploadPhotos_Click" />
        <asp:FileUpload
            ID="FilesUpload"
            runat="server"
            AllowMultiple="true" />
        <asp:Label ID="FileUploadedList" runat="server" />
        <br />
        <div class="text-center">
            <br />
            <asp:Button ID="BtnClear"
                runat="server"
                Text="Clear"
                OnClick="BtnClear_Click" class="btn btn-danger" />
            <asp:Button ID="BtnSave" BackColor="LimeGreen" runat="server" Text="Save" OnClick="BtnSave_Click" class="btn btn-success" />
            <asp:Label
                ID="LblSaveStatus"
                runat="server"
                Text=""></asp:Label>
        </div>
    </div>

  </body>

</asp:Content>
