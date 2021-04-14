<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="PreMoveAssessment.aspx.cs" Inherits="Lab3.PreMoveAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/AddService.css" rel="stylesheet" />
    <div class="row justify-content-center">
    <h1 class="display-4">Preliminary Move Assessment</h1>
        </div>
    <h4>Customer Info:</h4>
    <fieldset>
        <div class="groupCust">
            <asp:Label ID="Label1" runat="server" Text="Customer Name: "></asp:Label>
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
        </div>
    </fieldset>
    <br />
    <div class="float-right">
    <asp:Button ID="PopBtn" runat="server" Text="Populate" OnClick="PopBtn_Click" />
        </div>
    <br />
    <div class="form-group">
    <asp:Label ID="lblInitiating" runat="server" Text="Initiating Employee:"></asp:Label>
    <asp:DropDownList
        ID="ddlInitiating"
        runat="server"
        DataSourceID="dtasrcInitiating"
        DataTextField="EmployeeName"
        DataValueField="EmployeeID"
        OnDataBound="ddlInitiating_DataBound" Width="100%">
    </asp:DropDownList>
    </div>
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
            <asp:CheckBox ID="TrashChk" runat="server"  AutoPostBack="true" OnCheckedChanged="TrashChk_CheckedChanged" />
            <asp:TextBox ID="TrashDescriptionTxt" runat="server" AutoPostBack="true" TextMode="MultiLine" Visible="false"></asp:TextBox>
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
    <div class="text-center">
        <asp:Button ID="ClearBtn" runat="server" Text="Clear" class="btn btn-danger" OnClick="ClearBtn_Click" />
            <asp:Button ID="SaveBtn" runat="server" Text="Save" class="btn btn-success" OnClick="SaveBtn_Click" />
        <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>
        </div>

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
