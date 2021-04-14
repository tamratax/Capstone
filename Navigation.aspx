<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navigation.aspx.cs" Inherits="WalkerS_Lab1Part3.Navigation" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>


<asp:Content ID="test" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
        <h1 class="display-4">Navigation</h1>
    </div>
    <div>
        <div id="layoutSidenav_content">

            <br />
            <div class=" container">
                <div class="row justify-content-center">
                    <div class="flex-column">
                        <asp:Label ID="Label1"
                            runat="server"
                            Text="Customer Search:"></asp:Label>
                        &nbsp;
                    </div>
                    <div class="flex-column">
                        <asp:TextBox
                            ID="TxtSearch"
                            runat="server"></asp:TextBox>
                    </div>
                    <div class="flex-column">
                        <asp:Button
                            ID="BtnSearch"
                            runat="server" Text="Search"
                            OnClick="BtnSearch_Click" />
                    </div>
                    <div>
                        <asp:Label
                            ID="LblSelectCustomer"
                            runat="server"
                            Text=""></asp:Label>
                    </div>

                </div>
            </div>
            <br />

            <%-- <div>
           <iframe 
               width="1140"
               height="541.25" 
               src="https://app.powerbi.com/reportEmbed?reportId=7dd9cd39-a3c1-4f09-aa44-aeb655b9d655&autoAuth=true&ctid=3d261773-12a4-47ee-bd93-912a93b9bdc2&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXVzLWVhc3QyLXJlZGlyZWN0LmFuYWx5c2lzLndpbmRvd3MubmV0LyJ9"
               frameborder="0" 
               allowFullScreen="true"></iframe>
       </div>--%>

            <div>
                <asp:GridView ID="GridViewCustomers"
                    runat="server"
                    EmptyDataText="No Customers Found"
                    DataKeyNames="CustomerID"
                    AutoGenerateColumns="false"
                    OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged"
                    CssClass="table justify-content-center" nulldisplaytext="N/A">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Customer Name" NullDisplayText="N/A" />
                        <asp:BoundField DataField="Email" HeaderText="Email" NullDisplayText="N/A" />
                        <asp:TemplateField HeaderText="Home" ConvertEmptyStringToNull="true">
                            <ItemTemplate>
                                <asp:Label ID="home" runat="server" Text='<%# FormatPhoneNumber(Eval("homephone").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work" ConvertEmptyStringToNull="true">
                            <ItemTemplate>
                                <asp:Label ID="work" runat="server" Text='<%# FormatPhoneNumber(Eval("Workphone").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cell" ConvertEmptyStringToNull="true">
                            <ItemTemplate>
                                <asp:Label ID="cell" runat="server" Text='<%# FormatPhoneNumber(Eval("Cellphone").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </div>


            <fieldset>
                <h2>Notifications</h2>

                <asp:Label
                    ID="LblNewCustomer"
                    runat="server"
                    Text="Incomplete Customer (Date Last Contacted):"
                    CssClass="table justify-content-center"></asp:Label>
                <br />

                <asp:ListBox
                    ID="LstBoxCustomerRequests"
                    runat="server"
                    OnSelectedIndexChanged="LstBoxCustomerRequests_SelectedIndexChanged"
                    AutoPostBack="true"
                    CssClass="table justify-content-center"></asp:ListBox>
                <br />
                <br />
                <asp:Label
                    ID="LblIncompleteServiceTickets"
                    runat="server"
                    Text="Incomplete Service Tickets:"
                    CssClass="table justify-content-center"></asp:Label>
                <br />

                <asp:ListBox
                    ID="LstBoxIncompleteServiceTickets"
                    runat="server"
                    OnSelectedIndexChanged="LstBoxIncompleteServiceTickets_SelectedIndexChanged"
                    AutoPostBack="true"
                    CssClass="table justify-content-center"></asp:ListBox>

            </fieldset>

            <div class="row justify-content-center">
                <iframe width="100%" height="400" src="https://outlook.live.com/owa/calendar/00000000-0000-0000-0000-000000000000/0b9c7a56-9838-49eb-949d-ffe6c9ac9657/cid-B7BAC9A1BE036526/index.html"></iframe>


            </div>




        </div>
    </div>
</asp:Content>
