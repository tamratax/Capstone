<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomer.aspx.cs" Inherits="WalkerS_Lab1Part3.ViewCustomer" MasterPageFile="LabFormat.Master"%>
<%-- Coded By: Stuart Walker & Aaron Walsh --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <h1>View Customers</h1>
     <fieldset>
         <div>
            <asp:Label ID="SearchCustomerLbl" runat="server" Text="Searh for a Customer:"></asp:Label>
            <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
             <asp:Button ID="BtnLoadAll" runat="server" Text="Show All" OnClick="BtnLoadAll_Click"/>
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
                DataSourceID="DSCust"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="CellPhone" HeaderText="Cell Phone " />
                    <asp:BoundField DataField="WorkPhone" HeaderText="Work Phone" />
                    <asp:BoundField DataField="HomePhone" HeaderText="HomePhone " />
                    <asp:BoundField DataField="Email" HeaderText="Email" />                   
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
    </asp:Content>