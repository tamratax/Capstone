<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewService.aspx.cs" Inherits="Lab2.ViewService" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Services</h1>
    <fieldset>
        <legend>Select Customer to View Services:</legend>
        <asp:Label ID="LblCustomerName" runat="server" Text="Customer Name: "></asp:Label>
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
        <br />
        <br />

         <div>
            <asp:GridView ID="GridViewCustomers"
                runat="server"
                EmptyDataText="No Customers Found"
                DataKeyNames="CustomerID"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="homephone" HeaderText="Home" />
                    <asp:BoundField DataField="Workphone" HeaderText="Work" />
                    <asp:BoundField DataField="Cellphone" HeaderText="Cell" />
                </Columns>

            </asp:GridView>
        </div>

    </fieldset>
    <br />
    <fieldset>
        <legend><b>Active Service Tickets </b></legend>
       
        <div>
            <asp:GridView ID="GrdServices"
                runat="server"
                EmptyDataText="No Moves"
                DataKeyNames="ServiceTicketID"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GrdServices_SelectedIndexChanged"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="ServiceTicketID" HeaderText="ServiceTicketID" Visible="false" />
                    <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" />
                    <asp:BoundField DataField="CompletionDate" HeaderText="Completion Date" />
                    <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                </Columns>

            </asp:GridView>
        </div>

        
    </fieldset>
    <br />
    <fieldset>
        <legend><b>Selected Service Details: </b> </legend>
  
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label
                        ID="LblWorkflow" 
                        runat="server"
                        Text="Employees Assigned"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                    <asp:Label
                        ID="LblEquipment" 
                        runat="server"
                        Text="Equipment"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="LblInventory" 
                        runat="server"
                        Text="Notes"
                        Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="GrdEmployeeResults"
                runat="server"
                EmptyDataText="No Employees Assigned"
                DataKeyNames="EmployeeID"
                AutoGenerateColumns="false"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="false" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                    <asp:BoundField DataField="Ticket Change Date" HeaderText="Ticket Date" />

                </Columns>

            </asp:GridView>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="lblSpacing"
                        runat="server"
                        Text="---------"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:GridView ID="GrdEquipmentResults"
                runat="server"
                EmptyDataText="No Equipment Assigned"
                DataKeyNames="EquipmentID"
                AutoGenerateColumns="false"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:BoundField DataField="EquipmentID" HeaderText="EquipmentID" Visible="false" />
                    <asp:BoundField DataField="Type" HeaderText="Equipment" />     
                </Columns>

            </asp:GridView>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="LblSpacing2"
                        runat="server"
                        Text="---------"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:GridView ID="GrdNotes"
                runat="server"
                EmptyDataText="No Notes Added"
                DataKeyNames="TicketHistoryID"
                OnSelectedIndexChanged="GrdNotes_SelectedIndexChanged"
                AutoGenerateColumns="false"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="TicketHistoryID" HeaderText="TicketHistoryID" Visible="false" />
                    <asp:BoundField DataField="TicketChangeDate" HeaderText="Note Date" />   
                    <asp:BoundField DataField="Note Title" HeaderText="Note Title" />   
                </Columns>

            </asp:GridView>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="notespacing"
                        runat="server"
                        Visible="false"
                        Text="---------> Description: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label
                        ID="lbldescription"
                        runat="server"
                        Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </fieldset>
    <fieldset>
    <%--<script>

        function SetStatus(value) {
            var divStatus = document.getElementById('divStatus');
            divStatus.style.width = value + "%";
        }
    </script>
<asp:Table ID="Table2" runat="server">
    <asp:TableRow>
        <asp:TableCell><asp:Label ID="StatBar" runat="server" Text="Service Status Bar" Font-Bold="true" Font-Size="Larger"></asp:Label></asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="StatusPercent" runat="server" Text="" Font-Bold="true"></asp:Label></asp:TableCell>
    </asp:TableRow>
</asp:Table>--%>
     
     <div style="border:1px solid black;width:40%;">
      <div id="divStatus" runat="server" style="background-color:Green;width:0%;">&nbsp; </div>
     </div>
    <br />
    </fieldset>
    <br />

   
</asp:Content>










