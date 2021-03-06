<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceRequest.aspx.cs" Inherits="Lab3.AddServiceRequest" MasterPageFile="~/CustomerFacingMaster.Master" %>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1>Create Service Request</h1>
   <asp:Label ID="username" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Table
        ID="TblServiceRequest"
        runat="server">
         <asp:TableRow>
            <asp:TableCell ColumnSpan="10">
                <asp:Label 
                    ID="LblInstructions"
                    runat="server" 
                    Text="Please Select The Service You Are Interested In:"
                    Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblServiceType"
                    runat="server"
                    Text="Service Type:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DdlServiceType"
                    runat="server">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvServiceType"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlServiceType"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
       
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblServiceDate"
                    runat="server"
                    Text="Service Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtServiceDate"
                    runat="server"
                    Text=""
                    TextMode="Date">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="rfvServiceDate"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtServiceDate"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblItemTransport"
                    runat="server"
                    Text="Item Transport Options?"
                    ></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DropDownList1"
                    runat="server">
                    <asp:ListItem Value="Select">Select</asp:ListItem>
                    <asp:ListItem>We Pick-Up Your Item(s)</asp:ListItem>
                    <asp:ListItem>You Drop-Off Your Item(s)</asp:ListItem>
                    <asp:ListItem>Unsure</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblRequestDescription"
                    runat="server"
                    Text="Request Description:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox
                    ID="TxtRequestDescription"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="10">
                </asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvRequestDescription"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtRequestDescription"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button
                    ID="BtnClear"
                    runat="server"
                    Text="Clear"
                    OnClick="BtnClear_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button
                    ID="BtnCreateServiceRequest"
                    runat="server"
                    Text="Create Service Request ->"
                    OnClick="BtnCreateServiceRequest_Click"
                    ValidationGroup="SaveGroup" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label
                    ID="LblSaveStatus"
                    runat="server"
                    Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
   
   <br /> 
    <asp:Table ID="pendingservicestable" runat="server">
       <asp:TableRow>
           <asp:TableCell>
               <asp:Label ID="LblGridView" runat="server" Text="Pending Service Requests:" Font-Bold="true"></asp:Label>
           </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
                <asp:GridView ID="GridRequests"
                    runat="server"
                    DataSourceID="dtasrcRequest"
                    CausesValidation="false"
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    DataKeyNames="ServiceRequestID"
                    CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="ServiceRequestID" Visible="false" />
                        <asp:BoundField DataField="Service" HeaderText="Service" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Description"  HeaderText="Description" />
                    </Columns>
                </asp:GridView>
            </asp:TableCell>
            </asp:TableRow>
   
   </asp:Table>

     <asp:SqlDataSource ID="dtasrcRequest"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT ServiceRequestID, ServiceType 'Service', ServiceDate 'Date', RequestDescription 'Description' FROM SERVICEREQUEST WHERE CustomerID = (SELECT CustomerID FROM Customer WHERE email = @email)"
        DeleteCommand="DELETE SERVICEREQUEST where ServiceRequestID = @ServiceRequestID"
        UpdateCommand="UPDATE SERVICEREQUEST SET ServiceType = @Service, ServiceDate = @Date, RequestDescription = @Description WHERE ServiceRequestID = @ServiceRequestID">
    <SelectParameters>
            <asp:ControlParameter Name="email" ControlID="username" />
        </SelectParameters>
     </asp:SqlDataSource>
     
</asp:Content>
