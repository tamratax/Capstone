<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="Lab3.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Table ID="AddItemTbl" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="CustLbl" runat="server" Text="Select Customer: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DDLCust" 
                    DataSourceID="dtasrcCustomerList" 
                    DataTextField="CustomerName" 
                    DataValueField="CustomerID" 
                    runat="server" 
                    OnSelectedIndexChanged="DDLCust_SelectedIndexChanged" 
                    OnDataBound="DDLCust_DataBound"
                    AutoPostBack="true">
                </asp:DropDownList> 
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblType" 
                    runat="server" 
                    Text="Select Service Type: ">
                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList 
                    ID="DDLType" 
                    runat="server" 
                    OnDataBound="DDLType_DataBound" AutoPostBack="true" OnSelectedIndexChanged="DDLType_SelectedIndexChanged"></asp:DropDownList>   
                </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <br />
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:GridView ID="GridItem" 
                    runat="server" 
                    CausesValidation="false"></asp:GridView>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblItem" 
                    runat="server" 
                    Text="Item: " 
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtItem" 
                    runat="server" 
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="TxtItem" 
                    Text="Field Cannot Be Blank" 
                    ForeColor="Red"></asp:RequiredFieldValidator>            
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCost" 
                    runat="server" 
                    Text="Item Cost: "
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCost" 
                    runat="server" 
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
                    ControlToValidate="TxtCost" 
                    Text="Field Cannot Be Blank" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblDate" 
                    runat="server" 
                    Text="Date: " 
                    Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDate" 
                    runat="server" 
                    Visible="false"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    runat="server" 
                    ControlToValidate="TxtDate" 
                    Text="Field Cannot Be Blank" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnComplete" 
                    runat="server" 
                    Text="Add Item to Ticket" 
                    Visible="false" 
                    OnClick="BtnComplete_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblStatus" 
                    runat="server" 
                    ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcCustomerList" 
        runat="server" 
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName from Customer Order By LastName ASC"></asp:SqlDataSource>
</asp:Content>
