<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPortal.aspx.cs" Inherits="Lab3.CustomerPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoCo Consulting</title>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <link href="Content/CustLogin.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
    <form id="form1" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container ">
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
                                               
                                                <asp:TextBox
                                                    ID="TxtUsername"
                                                    class="form-control py-4"
                                                    placeholder="Enter email address"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Password</label>
                                               
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
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="NewCustomer.aspx">Need an account? Sign up!</a></div>
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
        
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
