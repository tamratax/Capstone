<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerAppraisel.aspx.cs" Inherits="Lab3.CustomerAppraisel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <link href="Content/AddService.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
   <div class="groupAuction">
    <div class="row justify-content-center">
    <h1 class="display-4">Appraisal Service Order</h1>
    </div>
    
       
    

    <br />

            
        <%--<div>
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
        </div>--%>
        <br />
        <br />
    
    <br />

    
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
            <asp:TextBox ID="TxtDeadline" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
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
  

</asp:Content>
