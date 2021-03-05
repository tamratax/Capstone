<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerUnauthorized.aspx.cs" Inherits="Lab3.CustomerUnauthorized" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>You Must Be Logged In To View This Page</h2>
            <asp:Button
                ID="BtnLoginPage"
                runat="server"
                Text="Login ->"
                OnClick="BtnLoginPage_Click"/>
        </div>
    </form>
</body>
</html>