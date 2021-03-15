﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="Lab3.NewCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoCo Consulting</title>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Create New Account</h1>
            <asp:Table
                ID="TblAccountInfo"
                runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblEmail"
                            runat="server"
                            Text="Email:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtEmail"
                            runat="server"
                            Text="">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblUsernameMessage"
                            runat="server"
                            Text="(This Will Be Your Username)"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvEmail"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtEmail"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblPassword"
                            runat="server"
                            Text="Password:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtPassword"
                            runat="server"
                            TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvPassword"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtPassword"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblFirstName"
                            runat="server"
                            Text="First Name:">
                        </asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtFirstName"
                            runat="server"
                            Text="">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvFirstName"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtFirstName"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>

                        <asp:Label
                            ID="LblLastName"
                            runat="server"
                            Text="Last Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtLastName"
                            runat="server"
                            Text="">
                        </asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvLastName"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtLastName"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblStreetAddress"
                            runat="server"
                            Text="Street Address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtStreetAddress"
                            runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvStreetAddress"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtStreetAddress"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblCity"
                            runat="server"
                            Text="City:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtCity"
                            runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvCity"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtCity"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblState"
                            runat="server"
                            Text="State:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtState"
                            runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvState"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtState"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                     <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="ZipLbl"
                            runat="server"
                            Text="Zip:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox
                            ID="TxtZip"
                            runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtZip"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblPhoneNumber"
                    runat="server"
                    Text="Home Phone: "></asp:Label>
                </asp:TableCell>
            <asp:TableCell ColumnSpan ="5">
                <asp:TextBox
                    ID="TxtPhoneNumber"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
           
                <asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text=" Cell Phone: "></asp:Label>
           
                <asp:TextBox
                    ID="TxtCellPhone"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
        
                <asp:Label
                    ID="LblWorkPhone"
                    runat="server"
                    Text=" Work Phone: "></asp:Label>
         
                <asp:TextBox
                    ID="TxtWorkPhone"
                    runat="server"
                    Text=""
                    ></asp:TextBox>
            </asp:TableCell>
        
        </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button
                            ID="BtnCreate" 
                            runat="server"
                            Text="Create Account"
                            OnClick="BtnCreate_Click"
                            ValidationGroup="SaveGroup"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BtnBack" 
                            runat="server"
                            Text="Back To Login ->"
                            OnClick="BtnBack_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:Label 
                        ID="LblCreateStatus"
                        runat="server"
                        Text=""></asp:Label>
                </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell>
                        <asp:Button ID="BtnPopulate" 
                            runat="server" 
                            Text="Populate"
                            onclick="BtnPopulate_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BtnClear"
                            runat="server" 
                            Text="Clear" 
                            onclick="BtnClear_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
