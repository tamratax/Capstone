<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Lab2.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoCo Consulting</title>
    <%--    <link href="Content/UserLogin.css" rel="stylesheet" />--%>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="Content/LoginFix.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
    <form id="form1" runat="server">
        <%--        <div class="wrapper fadeInDown">
        <div id="formContent >--%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4">Login</h3>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <%--                                                <input class="form-control py-4" id="TxtUsername" type="email" placeholder="Enter email address"--%>
                                                <asp:TextBox
                                                    ID="TxtUsername"
                                                    class="form-control py-4"
                                                    placeholder="Enter email address"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Password</label>
                                                <%--                                                <input class="form-control py-4" id="TxtPassword" type="password" placeholder="Enter password" />--%>
                                                <asp:TextBox
                                                    ID="TxtPassword"
                                                    runat="server"
                                                    class="form-control py-4"
                                                    TextMode="Password"
                                                    placeholder="Enter password"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <asp:Label
                                                        ID="LblLoginStatus"
                                                        runat="server"
                                                        Text=""></asp:Label>
                                                    <%--                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Remember password</label>--%>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <asp:Button
                                                    ID="BtnLogin"
                                                    runat="server"
                                                    Text="Login"
                                                    class="btn btn-primary"
                                                    OnClick="BtnLogin_Click" />
                                            </div>
                                        </form>
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
                            <div class="text-muted">RoCo Consulting</div>
                            <div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <%--        <div>
            <div>
                <h1>Customer Portal</h1>--%>
        <%--<asp:Table ID="TblLogin" runat="server" CssClass="tableContent">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">--%>
        <%--                <asp:Label
                    ID="LblLoginHeader"
                    runat="server"
                    Text="Please Enter Username & Password"
                    Font-Bold="true"></asp:Label>--%>
        <%--class="fadeIn first"--%>
        <%--</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>--%>
        <%--                    <asp:TableCell>
                        <asp:Label
                            ID="LblUsername"
                            runat="server"
                            Text="Username:"></asp:Label>
                    </asp:TableCell>--%>
        <%--<asp:TableCell ColumnSpan="2">--%>
        <%--                        <asp:TextBox
                            ID="TxtUsername"
                            runat="server"></asp:TextBox>--%>
        <%--class="fadeIn second"--%>
        <%--Placeholder="Username"--%>
        <%--</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>--%>
        <%--                    <asp:TableCell>
                        <asp:Label
                            ID="LblPassword"
                            runat="server"
                            Text="Pasword:"></asp:Label>
                    </asp:TableCell>--%>
        <%--<asp:TableCell>--%>
        <%--                        <asp:TextBox
                            ID="TxtPassword"
                            runat="server"
                            class="fadeIn third"
                            Textmode="Password" ></asp:TextBox>--%>
        <%--Placeholder="Password"--%>
        <%--</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>--%>
        <%--                        <asp:Button
                            ID="BtnLogin"
                            runat="server"
                            Text="Login"
                            OnClick="BtnLogin_Click" />--%>
        <%--class="fadeIn fourth"--%>
        <%--                    </asp:TableCell>
                    <asp:TableCell>--%>
        <%--                <asp:Button
                    ID="BtnNewUser"
                    runat="server"
                    Text="Create Account ->"
                    OnClick="BtnNewUser_Click" />--%>
        <%--                    </asp:TableCell>
                    <asp:TableCell>--%>
        <%--                <asp:Label
                    ID="LblLoginStatus"
                    runat="server"
                    Text=""></asp:Label>--%>
        <%--                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>--%>
        <%--            </div>
        </div>--%>
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
