<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="LookAt.aspx.cs" Inherits="Lab3.LookAt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
        <div>
            <fieldset>
                <asp:Label ID="CustLbl" runat="server" Text="Search for a Customer: "></asp:Label>
                <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
                <asp:GridView
                    ID="GridViewCustomers"
                    runat="server"
                    EmptyDataText="No Customers Found"
                    DataKeyNames="CustomerID"
                    AutoGenerateColumns="false"
                    OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged"
                    CssClass="table justify-content-center">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="homephone" HeaderText="Home" />
                        <asp:BoundField DataField="Workphone" HeaderText="Work" />
                        <asp:BoundField DataField="Cellphone" HeaderText="Cell" />
                    </Columns>
                </asp:GridView>
            </fieldset>
        </div>
        <br />
        <div>
            <fieldset>
                <legend><b>Active Service Tickets </b></legend>
                <div>
                    <asp:GridView ID="GrdServices"
                        runat="server"
                        EmptyDataText="No Moves"
                        DataKeyNames="ServiceTicketID"
                        AutoGenerateColumns="false"
                        OnSelectedIndexChanged="GrdServices_SelectedIndexChanged"
                        CssClass="table justify-content-center">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                            <asp:BoundField DataField="ServiceTicketID" HeaderText="ServiceTicketID" Visible="false" />
                            <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" />
                            <asp:BoundField DataField="CompletionDate" HeaderText="Completion Date" />
                            <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                        </Columns>

                    </asp:GridView>
                </div>
            </fieldset>
        </div>
        <%--       <asp:CheckBox ID="AuctionChkBx" runat="server" Text="Auction" />
         <asp:CheckBox ID="AppraisalChkBx" runat="server" Text="Appraisal" />--%>
        <div>
            <asp:Label ID="FileUploadedList" runat="server" />
        </div>

        <div class="form-group">
            <label>Truck Accessibility: </label>
            <asp:TextBox ID="TruckAccTxt" runat="server" class="form-control" TextMode="MultiLine"  Wrap="true" Rows="5" Width="500px" length="75px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Supplies needed:</label>
            <asp:TextBox ID="SuppliesTxt" runat="server" class="form-control" TextMode="MultiLine" Wrap="true" Rows="5" Width="500px" length="75px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Number of Boxes & type:</label>
            <asp:TextBox ID="BoxesTxt" runat="server" class="form-control" TextMode="MultiLine" Wrap="true" Rows="5" Width="500px" length="75px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Crew: </label>
            <asp:TextBox ID="CrewTxt" runat="server" class="form-control" TextMode="MultiLine" Wrap="true" Rows="5" Width="500px" length="75px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Type and Number of Trucks: </label>
            <asp:TextBox ID="TrucksTxt" runat="server" class="form-control" TextMode="MultiLine" Wrap="true" Rows="5" Width="500px" length="75px"></asp:TextBox>
        </div>
        <div>
            <asp:FileUpload ID="FilesUpload" runat="server"
                AllowMultiple="true" />
        </div>
        <div>
            <asp:Button ID="UploadButton" runat="server"
                OnClick="UploadButton_Click"
                Text="Upload File" />
        </div>
        <br />

        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
        <asp:Label ID="LblSaveStatus" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>
