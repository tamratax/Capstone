<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AppraisalServiceOrder.aspx.cs" Inherits="Lab3.AppraisalServiceOrder" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <link href="Content/AddService.css" rel="stylesheet" />
    <div class="row justify-content-center">
    <h1 class="display-4">Appraisal Service Order</h1>
        </div>
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
                CssClass="table justify-content-center">
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
        <div class="float-right">
         <asp:Button ID="BtnPopulate"
                runat="server"
                Text="Populate"
                OnClick="BtnPopulate_Click" />
    </div>
    <div runat="server" id="divOutBuilding">
        <div>
            <h5><u>Purpose of Appraisal</u></h5>
        </div>
                <div>
     <asp:Label ID="lblInitiating" runat="server" Text="Initiating Employee:"></asp:Label>
    <asp:DropDownList
        ID="ddlInitiating"
        runat="server"
        DataSourceID="dtasrcInitiating"
        DataTextField="EmployeeName"
        DataValueField="EmployeeID"
        OnDataBound="ddlInitiating_DataBound" Width="100%">
    </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="ddlInitiating" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
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
            <h5><u>Deadline</u></h5>
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
            <h5><u>Size of Appraisal</u></h5>
        </div>
        <div class="form-group">
            <%--<label>Size of Appraisal</label>--%>
            <asp:TextBox ID="TxtAppraisalSize" Placeholder="Size of Appraisal" runat="server" Class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtAppraisalSize" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div runat="server" id="div3">
        <div>
            <h5><u>Inventory</u></h5>
        </div>
        <div class="form-group">

            <asp:TextBox ID="TxtInventory" runat="server" Placeholder="Inventory" TextMode="MultiLine" Rows="5" Columns="25" Class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtAppraisalSize" Text="Required" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

        </div>
    </div>
    <br />
    <div runat="server" id="div4">
        <div>
            <h5><u>Additional Services</u></h5>
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
            <h5><u>Links</u></h5>
        </div>
        <div>
            <asp:Button ID="BtnOutlook" runat="server" Text="Open Outlook" OnClick="BtnOutlook_Click" />



        </div>
        <br />
        <asp:Button ID="BtnUploadPhotos" runat="server" Text="Upload Files" OnClick="BtnUploadPhotos_Click" />
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
            <asp:Button ID="BtnSave" BackColor="LimeGreen" runat="server" Text="Save" OnClick="BtnSave_Click" class="btn btn-success" ValidationGroup="Save" />
            <asp:Label
                ID="LblSaveStatus"
                runat="server"
                Text=""></asp:Label>
        </div>
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

        <asp:SqlDataSource
        ID="dtasrcInitiating"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName
                    from Employee Order By EmpLastName ASC"></asp:SqlDataSource>

</asp:Content>
