<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceRequest.aspx.cs" Inherits="Lab3.AddServiceRequest" MasterPageFile="~/CustomerFacingMaster.Master"%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
            <p>Stuart Walker & Aaron Walsh</p>
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