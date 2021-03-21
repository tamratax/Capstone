<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test (No Master).aspx.cs" Inherits="Lab3.Test__No_Master_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:DropDownList
            ID="DdlCustomerList"
            runat="server"
            DataSourceID="dtasrcCustomerList"
            DataTextField="CustomerName"
            DataValueField="CustomerID"
            AutoPostBack="true"
            OnDataBound="DdlCustomerList_DataBound"
            OnSelectedIndexChanged="DdlCustomerList_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:TextBox 
            ID="TxtSearch"
            runat="server"></asp:TextBox>
        <asp:Button 
            ID="BtnSearch"
            runat="server" Text="Search" 
            OnClick="BtnSearch_Click"/>
        <asp:Label
            ID="LblSearch"
            runat="server"
            Text="Search First And/Or Last Name"
            BackColor="Yellow">
        </asp:Label>
           <asp:Label
            ID="LblMoveResults"
            runat="server"
            Text="Moves"
            Font-Bold="true"></asp:Label>
        <asp:GridView
            ID="GrdMoveResults"
            runat="server"
            AlternatingRowStyle-BackColor="#ebebeb"
            EmptyDataText="This Customer Has No Move Services!">
        </asp:GridView>

        </div>
         
           <asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>
    </form>
</body>
</html>
