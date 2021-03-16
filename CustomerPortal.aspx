<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPortal.aspx.cs" Inherits="Lab3.CustomerPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoCo Consulting</title>
    <link href="Content/UserLogin.css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="/images/favicon.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper fadeInDown">
        <div id="formContent">
            <h1>Customer Portal</h1>
            <%--<asp:Table ID="TblLogin" runat="server" CssClass="tableContent">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">--%>
                        <asp:Label
                            ID="LblLoginHeader"
                            runat="server"
                            Text="Please Enter Username & Password"
                            Font-Bold="true"
                            class="fadeIn first"></asp:Label>
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
                        <asp:TextBox
                            ID="TxtUsername"
                            runat="server"
                            class="fadeIn second"
                            Placeholder="Username"></asp:TextBox>
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
                        <asp:TextBox
                            ID="TxtPassword"
                            runat="server"
                            class="fadeIn third"
                            Textmode="Password"
                            Placeholder="Password"></asp:TextBox>
                    <%--</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>--%>
                        <asp:Button
                            ID="BtnLogin"
                            runat="server"
                            Text="Login"
                            OnClick="BtnLogin_Click" 
                            class="fadeIn fourth"/>
<%--                    </asp:TableCell>
                    <asp:TableCell>--%>
                        <asp:Button
                            ID="BtnNewUser"
                            runat="server"
                            Text="Create Account ->"
                            OnClick="BtnNewUser_Click" />
<%--                    </asp:TableCell>
                    <asp:TableCell>--%>
                        <asp:Label
                            ID="LblLoginStatus"
                            runat="server"
                            Text=""></asp:Label>
<%--                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>--%>
        </div>
      </div>
    </form>
    <script src="Scripts/jquery-3.5.1.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
