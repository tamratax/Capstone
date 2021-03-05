<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Lab2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stuart Walker & Aaron Walsh</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Stuart Walker & Aaron Walsh</p>
             <h1>User Login</h1>
        <asp:Table ID="TblLogin" runat="server">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:Label 
                        ID="LblLoginHeader"
                        runat="server" 
                        Text="Please Enter Username & Password"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label
                        ID="LblUsername"
                        runat="server"
                        Text="Username:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox
                        ID="TxtUsername"
                        runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label
                        ID="LblPassword"
                        runat="server"
                        Text="Pasword:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox
                        ID="TxtPassword"
                        runat="server"
                        TextMode="Password"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button
                        ID="BtnLogin"
                        runat="server"
                        Text="Login"
                        OnClick="BtnLogin_Click"/>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label 
                        ID="LblLoginStatus"
                        runat="server"
                        Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
    </form>
</body>
</html>
