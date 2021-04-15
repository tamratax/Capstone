<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewService.aspx.cs" Inherits="Lab2.ViewService" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
    <h1 class="display-4">View Services</h1>
        </div>
    <%--<fieldset>
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
                    <asp:BoundField DataField="Name" NullDisplayText="N/A" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" NullDisplayText="N/A" HeaderText="Email" />
                    <asp:BoundField DataField="homephone" NullDisplayText="N/A" HeaderText="Home" />
                    <asp:BoundField DataField="Workphone" NullDisplayText="N/A" HeaderText="Work" />
                    <asp:BoundField DataField="Cellphone" NullDisplayText="N/A" HeaderText="Cell" />
                </Columns>

            </asp:GridView>
        </div>

    </fieldset>--%>
    <br />
    <fieldset>
        <legend><b>
            <asp:Label ID="LblActive" runat="server" Text=""></asp:Label></b></legend>
       
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
                    <asp:BoundField DataField="TicketOpenDate" HeaderText="Service Date" />
                    <asp:BoundField DataField="CompletedDate" HeaderText="Completion Date" />
                    <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                </Columns>

            </asp:GridView>
        </div>
        <fieldset>
    <script>

        function SetStatus(value) {
            var progressbar = document.getElementById('divStatus');
            progressbar.style.width = value + "%";
        }
    </script>

       <div style="margin-left:auto; margin-right:auto; text-align:center">
       <asp:Label ID="StatBar" runat="server" Text="Service Status Bar" Font-Bold="true" Font-Size="Larger"></asp:Label>
       
       <asp:Label ID="StatusPercent" runat="server" Text="" Font-Bold="true"></asp:Label>
    </div>


     
     <%--<div style="border:1px solid black;width:40%;">
      <div id="divStatus" runat="server" style="background-color:Green;width:0%;"></div>
     </div>--%>

            <div class="progress" style="width:40%; margin-left:auto; margin-right:auto">
  <div id="progressbar" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="70"
  aria-valuemin="0" aria-valuemax="100" style="width:0%" runat="server">
  </div>
    
   

</div>

    <br />
    </fieldset>
    <br />
         <div>
        <asp:DropDownList ID="DDLServices" runat="server" OnDataBound="DDLServices_DataBound"></asp:DropDownList> <br />
        <asp:Button ID="BtnServices" runat="server" Text="Change Status" OnClick="BtnServices_Click" />
    </div>

        
    </fieldset>
    <br />
    <div class="row justify-content-center">
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
                    <asp:BoundField DataField="ServiceTicketID" HeaderText="ServiceTicketID" Visible="false" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />

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
            </asp:TableRow>
        </asp:Table>
    </fieldset>

   
</asp:Content>










