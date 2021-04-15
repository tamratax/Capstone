<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomer.aspx.cs" Inherits="WalkerS_Lab1Part3.ViewCustomer" MasterPageFile="LabFormat.Master"%>
<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <div class="row justify-content-center">
    <h1 class="display-4">View Customers</h1>
        </div>
     <fieldset>
         <div>
             <div class="row justify-content-center">
            <asp:Label ID="SearchCustomerLbl" runat="server" Text="Search for a Customer:"></asp:Label>
            <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
             <asp:Button ID="BtnLoadAll" runat="server" Text="Show All" OnClick="BtnLoadAll_Click"/>
                 </div>
             <br />
             <br />
           <asp:GridView ID="GridviewCusts" 
            runat="server" 
            AutoGenerateEditButton="true"
            OnRowEditing="GridviewMoves_RowEditing"            
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            Visible="false"
            DataSourceID="DSCust"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="FirstName" NullDisplayText="N/A" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" NullDisplayText="N/A" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="CellPhone" NullDisplayText="N/A" HeaderText="Cell Phone " />
                    <asp:BoundField DataField="WorkPhone" NullDisplayText="N/A" HeaderText="Work Phone" />
                    <asp:BoundField DataField="HomePhone" NullDisplayText="N/A" HeaderText="HomePhone " />
                    <asp:BoundField DataField="Email" NullDisplayText="N/A" HeaderText="Email" />                   
            </Columns>
        </asp:GridView>


<asp:GridView ID="GRDShowAllCust" 
            runat="server"  
            AutoGenerateEditButton="true"
            OnRowEditing="GridviewMoves_RowEditing"            
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            DataSourceID="DSShowAll"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="FirstName" NullDisplayText="N/A" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" NullDisplayText="N/A" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="CellPhone" NullDisplayText="N/A" HeaderText="Cell Phone " />
                    <asp:BoundField DataField="WorkPhone" NullDisplayText="N/A" HeaderText="Work Phone" />
                    <asp:BoundField DataField="HomePhone" NullDisplayText="N/A" HeaderText="HomePhone " />
                    <asp:BoundField DataField="Email" NullDisplayText="N/A" HeaderText="Email" />                   
            </Columns>
        </asp:GridView>



         </div>



            </fieldset>
      <asp:SqlDataSource
            ID="DSCust"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Lab3%>"
            SelectCommand="Select  CustomerID, FirstName, LastName, CellPhone, WorkPhone, HomePhone,Email  from Customer where Firstname + ' ' + LastName  Like '%'+@Name+'%' " 
            UpdateCommand="UPDATE Customer SET FirstName = @FirstName, LastName = @LastName, CellPhone = @CellPhone, WorkPhone = @WorkPhone, HomePhone = @HomePhone, Email = @Email WHERE customerID = @customerID" 
            DeleteCommand="DELETE Customer where customerID = @customerID" > 
          <SelectParameters>
              <asp:ControlParameter Name="Name" Type="String" ControlID="TxtSearch" />

          </SelectParameters>

         
     </asp:SqlDataSource>

          <asp:SqlDataSource
            ID="DSShowAll"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Lab3%>"
            SelectCommand="Select  CustomerID, FirstName, LastName, CellPhone, WorkPhone, HomePhone,Email  from Customer" 
            UpdateCommand="UPDATE Customer SET FirstName = @FirstName, LastName = @LastName, CellPhone = @CellPhone, WorkPhone = @WorkPhone, HomePhone = @HomePhone, Email = @Email WHERE customerID = @customerID" 
            DeleteCommand="DELETE Customer where customerID = @customerID" > 
<%--          <SelectParameters>
              <asp:ControlParameter Name="Name" Type="String" ControlID="TxtShowAll" />

          </SelectParameters>--%>

         
     </asp:SqlDataSource>
    </asp:Content>