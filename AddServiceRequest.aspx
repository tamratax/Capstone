<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceRequest.aspx.cs" Inherits="Lab3.AddServiceRequest" MasterPageFile="~/CustomerFacingMaster.Master" %>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1>Create Service Request</h1>
    <asp:Table
        ID="TblServiceRequest"
        runat="server">
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
            <asp:TableCell ColumnSpan="10">
                <asp:Label 
                    ID="LblInstructions"
                    runat="server" 
                    Text="Please Select The Service(s) You Are Interested In:"
                    Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxMove"
                    runat="server" 
                    Text="Move"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxAuction"
                    runat="server"
                    Text="Auction"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxConsignment"
                    runat="server" 
                    Text="Consignment"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox 
                    ID="ChkBoxAppraisal"
                    runat="server"
                    Text="Appraisal"/>
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
</asp:Content>
