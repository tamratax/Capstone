<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomer.aspx.cs" Inherits="WalkerS_Lab1Part3.ViewCustomer" MasterPageFile="LabFormat.Master"%>
<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
            <h1>View Customers</h1>
            <fieldset>
                <legend>Select Customer to View Details:</legend>

                <asp:Label ID="Label2" runat="server" Text="Customer Name: "></asp:Label>
                <asp:DropDownList
                    ID="ddlCustomerList"
                    runat="server"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCustomerList_SelectedIndexChanged" 
                    OnDataBound="ddlCustomerList_DataBound">
                </asp:DropDownList>

                <asp:Button ID="btnLoadAllCustomer"
                    runat="server"
                    Text="Show All Customers"
                    OnClick="btnLoadAllCustomer_Click" />

                <asp:Button ID="BtnAddCustomer"
                    runat="server"
                    Text="Add Customer ->"
                    OnClick="BtnAddCustomer_Click" />

                <asp:Button ID="BtnNavigation"
                    runat="server"
                    Text="Back To Navigation ->"
                    OnClick="BtnNavigation_Click" />


            </fieldset>
            <br />
            <fieldset>
                <legend>Orders for select customer: </legend>
                <asp:GridView
                    ID="grdOrderResults"
                    runat="server"
                    AlternatingRowStyle-BackColor="#ebebeb"
                    EmptyDataText="No customer selected!">
                </asp:GridView>
            </fieldset>

        <asp:SqlDataSource
            ID="dtasrcCustomerList"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Capstone%>"
            SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>
    </asp:Content>