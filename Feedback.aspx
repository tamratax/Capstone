<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Lab3.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h4>Customer Info:</h4>
    <div class="groupCust">
    <div>
        <asp:Label ID="LblCust" runat="server" Text="Customer Name: "></asp:Label>
        &nbsp;
    <asp:Label ID="LblCustName" runat="server" Text=""></asp:Label>
</div>
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
            <br />
            </div>
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
        <div class="form-group">
            <label>Select Service</label>
<%--            <asp:Label ID="lblServ" runat="server" Text="Select Service: "></asp:Label>--%>
            <asp:DropDownList ID="ddlService1" 
                runat="server"
                 AutoPostBack="true"
                 class="form-control"
                  OnDataBound="ddlService_DataBound"
                ></asp:DropDownList>
            </div>
        <div class="form-group">
            <label>How was your service?</label>
<%--        <asp:Label ID="Feedback1" runat="server" Text="How was your service?: "></asp:Label>--%>
            <asp:DropDownList ID="ddlFeedback" 
                runat="server"
                class="form-control"
                AutoPostBack="true">
                 <asp:ListItem Value="Positive">Positive</asp:ListItem>
                 <asp:ListItem Value="Negative">Negative</asp:ListItem>
            </asp:DropDownList>
         </div>
     <div class="form-group">
         <label>Comments</label>
<%--            <asp:Label ID="CommentsLbl" runat="server" Text="Comments: "></asp:Label>--%>
            <asp:TextBox ID="Commentstxt" runat="server" Placeholder="Comments" class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="SubmitFeed" runat="server" Text="Submit" OnClick="SubmitFeed_Click1" />
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



</asp:Content>
