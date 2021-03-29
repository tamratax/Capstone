<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerUnauthorized.aspx.cs" Inherits="Lab3.CustomerUnauthorized" %>

<!DOCTYPE html>
<link href="Content/CustUnauthorized.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row justify-content-center">
            <h2 class="row align-content-center" style="color: #FFFFFF" >You Must Be Logged In To View This Page</h2>
            </div>
            <div class="row justify-content-center">
            <asp:Button
                ID="BtnLoginPage"
                runat="server"
                Text="Login ->"
                OnClick="BtnLoginPage_Click" />
        </div>
    </form>
</body>
</html>