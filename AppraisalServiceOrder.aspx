﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AppraisalServiceOrder.aspx.cs" Inherits="Lab3.AppraisalServiceOrder" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <link href="Content/AddService.css" rel="stylesheet" />
    <h1>Appraisal Service Order</h1>

    <h4>Customer Info:</h4>
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
        <br />
        <br />
    </div>
    <br />

    <h2>Create Appraisal Service</h2>
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
            <%--<label>Size of Appraisal</label>--%>
            <asp:TextBox ID="TxtAppraisalSize" runat="server" Class="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <div runat="server" id="div3">
        <div>
            <h5>Inventory</h5>
        </div>
        <div class="form-group">

            <asp:TextBox ID="TxtInventory" runat="server" TextMode="MultiLine" Rows="5" Columns="25" Class="form-control"></asp:TextBox>
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
        <div>
            <h5>Links</h5>
        </div>
        <div>
            <asp:Button ID="BtnOutlook" runat="server" Text="Open Outlook" OnClick="BtnOutlook_Click" />
             <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
           <asp:Label
                ID="LblSaveStatus"
                runat="server"
                Text=""></asp:Label>
           

            </div>
        <br />
        <asp:Button ID="BtnUploadPhotos" runat="server" Text="Upload Photos" OnClick="BtnUploadPhotos_Click" />
            <asp:FileUpload
                ID="FilesUpload"
                runat="server"
                AllowMultiple="true" />
          <asp:Label ID="FileUploadedList" runat="server" />
    </div>





    <%--<asp:Label ID="LblSelectedSessionID" runat="server" Text="" Visible="false"></asp:Label>--%>


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

</asp:Content>
