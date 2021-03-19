<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="Lab3.NewCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoCo Consulting</title>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="Content/Login.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form2" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName">First Name</label>
                                                        <%--                                                        <input class="form-control py-4" id="inputFirstName" type="text" placeholder="Enter first name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtFirstName"
                                                            Text=""
                                                            class="form-control py-4"
                                                            placeholder="Enter first name"
                                                            runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName">Last Name</label>
                                                        <%--<input--%> <%--class="form-control py-4" id="inputLastName" type="text" placeholder="Enter last name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtLastName"
                                                            runat="server"
                                                            placeholder="Enter last name"
                                                            class="form-control py-4"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Email (This will be your username)</label>
                                                <%--                                            <input class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="Enter email address" />--%>
                                                <asp:TextBox
                                                    ID="TxtEmail"
                                                    runat="server"
                                                    TextMode="Email"
                                                    placeholder="Enter email address"
                                                    class="form-control py-4"></asp:TextBox>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputCellPhone">Cell Phone</label>
                                                        <%--                                                        <input class="form-control py-4" id="inputFirstName" type="text" placeholder="Enter first name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtCellPhone"
                                                            Text=""
                                                            class="form-control py-4"
                                                            placeholder="Enter cell phone"
                                                            runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputHomePhone">Home Phone</label>
                                                        <%--<input--%> <%--class="form-control py-4" id="inputLastName" type="text" placeholder="Enter last name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtPhoneNumber"
                                                            runat="server"
                                                            placeholder="Home phone"
                                                            class="form-control py-4"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputWorkPhone">Work Phone</label>
                                                        <%--                                                        <input class="form-control py-4" id="inputFirstName" type="text" placeholder="Enter first name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtWorkPhone"
                                                            Text=""
                                                            class="form-control py-4"
                                                            placeholder="Work phone"
                                                            runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputStreetAddress">Street Address</label>
                                                <asp:TextBox
                                                    ID="TxtStreetAddress"
                                                    runat="server"
                                                    placeholder="Enter address"
                                                    class="form-control py-4"></asp:TextBox>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputCity">City</label>
                                                        <%--                                                        <input class="form-control py-4" id="inputFirstName" type="text" placeholder="Enter first name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtCity"
                                                            Text=""
                                                            class="form-control py-4"
                                                            placeholder="City"
                                                            runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputState">State</label>
                                                        <%--<input--%> <%--class="form-control py-4" id="inputLastName" type="text" placeholder="Enter last name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtState"
                                                            runat="server"
                                                            placeholder="State"
                                                            class="form-control py-4"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputZip">Zip</label>
                                                        <%--                                                        <input class="form-control py-4" id="inputFirstName" type="text" placeholder="Enter first name" />--%>
                                                        <asp:TextBox
                                                            ID="TxtZip"
                                                            Text=""
                                                            class="form-control py-4"
                                                            placeholder="Zip"
                                                            runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputPassword">Password</label>
                                                        <%--                                                    <input class="form-control py-4" id="inputPassword" type="password" placeholder="Enter password" />--%>
                                                        <asp:TextBox
                                                            ID="TxtPassword"
                                                            runat="server"
                                                            class="form-control py-4"
                                                            placeholder="Enter password"
                                                            TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputConfirmPassword">Confirm Password</label>
                                                        <%--                                                    <input class="form-control py-4" id="inputConfirmPassword" type="password" placeholder="Confirm password" />--%>
                                                        <asp:TextBox
                                                            ID="TxtConfirm"
                                                            runat="server"
                                                            class="form-control py-4"
                                                            placeholder="Confirm password"
                                                            TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0"></div>
                                            <asp:Button
                                                ID="BtnCreate"
                                                runat="server"
                                                class="btn btn-primary btn-block"
                                                Text="Create Account"
                                                OnClick="BtnCreate_Click" />
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="CustomerPortal.aspx">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
       <%-- <div>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtEmail"
                            runat="server"
                            Text="">
                        </asp:TextBox>--%>
                   <%-- </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtPassword"
                            runat="server"
                            TextMode="Password"></asp:TextBox>--%>
                   <%-- </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtFirstName"
                            runat="server"
                            Text="">
                        </asp:TextBox>--%>
                   <%-- </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtLastName"
                            runat="server"
                            Text="">
                        </asp:TextBox>--%>
                 <%--   </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtStreetAddress"
                            runat="server"></asp:TextBox>--%>
                   <%-- </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtCity"
                            runat="server"></asp:TextBox>--%>
                  <%--  </asp:TableCell>
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
                    <asp:TableCell>--%>
<%--                        <asp:TextBox
                            ID="TxtState"
                            runat="server"></asp:TextBox>--%>
                   <%-- </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator
                            ID="RfvState"
                            runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="TxtState"
                            Text="This Field Is Required"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>--%>
                   <%--<%-- </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="ZipLbl"
                            runat="server"
                            Text="Zip:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
<%--                        <asp:TextBox
                            ID="TxtZip"
                            runat="server"></asp:TextBox>--%>
                   <%-- </asp:TableCell>
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
                    <asp:TableCell ColumnSpan="5">--%>
                        <%--                        <asp:TextBox
                            ID="TxtPhoneNumber"
                            runat="server"
                            Text=""></asp:TextBox>--%>

                        <%--<asp:Label
                            ID="LblCellPhone"
                            runat="server"
                            Text=" Cell Phone: "></asp:Label>--%>

                        <%--                        <asp:TextBox
                            ID="TxtCellPhone"
                            runat="server"
                            Text=""></asp:TextBox>--%>

                       <%-- <asp:Label
                            ID="LblWorkPhone"
                            runat="server"
                            Text=" Work Phone: "></asp:Label>--%>

                        <%--                        <asp:TextBox
                            ID="TxtWorkPhone"
                            runat="server"
                            Text=""></asp:TextBox>--%>
                    <%--</asp:TableCell>

                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>--%>
<%--                        <asp:Button
                            ID="BtnCreate"
                            runat="server"
                            Text="Create Account"
                            OnClick="BtnCreate_Click"
                            ValidationGroup="SaveGroup" />--%>
                   <%-- </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BtnBack"
                            runat="server"
                            Text="Back To Login ->"
                            OnClick="BtnBack_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label
                            ID="LblCreateStatus"
                            runat="server"
                            Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnPopulate"
                            runat="server"
                            Text="Populate"
                            OnClick="BtnPopulate_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BtnClear"
                            runat="server"
                            Text="Clear"
                            OnClick="BtnClear_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>--%>
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
