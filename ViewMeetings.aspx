<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewMeetings.aspx.cs" Inherits="Lab3.ViewMeetings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Meetings</h1>
     <fieldset>
         <div>
            <asp:Label ID="SearchCustomerLbl" runat="server" Text="Search for a Customer:"></asp:Label>
            <asp:TextBox ID="TxtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click"/>
             <asp:Button ID="BtnLoadAll" runat="server" Text="Show All" onclick="BtnLoadAll_Click"/>
             <br />
             <asp:GridView ID="GridviewMeeting" 
            runat="server" 
            AutoGenerateEditButton="true"          
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="True" 
            Visible="false"
            DataSourceID="DSMeetings"
            CssClass="table"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="SchedulingID" HeaderText="SchedulingID" Visible="false" />
                    <%--<asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />--%>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="MeetingLocation" HeaderText="Meeting Location" />                   
            </Columns>
        </asp:GridView>
             <asp:GridView ID="GRDShowAllMeetings" 
            runat="server"  
            AutoGenerateEditButton="true"           
            EmptyDataText="No Customers Found"
            DataKeyNames="CustomerID"
            AutoGenerateColumns="false"
            AllowPaging="true"
            CssClass="table"
            AllowSorting="True" 
            DataSourceID="DSShowAllMeetings"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            HeaderStyle-CssClass="thead-light">
            <Columns>
                 <asp:CommandField ButtonType="Button" />
                    <asp:BoundField DataField="SchedulingID" HeaderText="SchedulingID" Visible="false" />
                    <%--<asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="false" />--%>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="MeetingLocation" HeaderText="Meeting Location" />                   
            </Columns>
        </asp:GridView>




         </div>



            </fieldset>
      <asp:SqlDataSource
            ID="DSMeetings"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Lab3%>"
            SelectCommand="Select Scheduling.SchedulingID, Customer.CustomerID, Customer.FirstName, Customer.LastName, Scheduling.Purpose, Scheduling.Description, Scheduling.Date, Scheduling.Time, Scheduling.MeetingLocation from Scheduling Inner Join Customer On Scheduling.CustomerID = Customer.CustomerID where Customer.Firstname + ' ' + Customer.LastName  Like '%'+@Name+'%' " 
            UpdateCommand="UPDATE Scheduling SET Purpose = @Purpose, Description = @Description, Date = @Date, Time = @Time, MeetingLocation = @MeetingLocation WHERE customerID = @customerID" 
            DeleteCommand="DELETE Scheduling where customerID = @customerID" > 
          <SelectParameters>
              <asp:ControlParameter Name="Name" Type="String" ControlID="TxtSearch" />

          </SelectParameters>

         
     </asp:SqlDataSource>

          <asp:SqlDataSource
            ID="DSShowAllMeetings"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Lab3%>"
            SelectCommand="Select Scheduling.SchedulingID, Customer.CustomerID, Customer.FirstName, Customer.LastName, Scheduling.Purpose, Scheduling.Description, Scheduling.Date, Scheduling.Time, Scheduling.MeetingLocation from Scheduling Inner Join Customer On Scheduling.CustomerID = Customer.CustomerID" 
            UpdateCommand="UPDATE Scheduling SET Purpose = @Purpose, Description = @Description, Date = @Date, Time = @Time, MeetingLocation = @MeetingLocation WHERE customerID = @customerID"  
            DeleteCommand="DELETE Scheduling where customerID = @customerID" > 
<%--          <SelectParameters>
              <asp:ControlParameter Name="Name" Type="String" ControlID="TxtShowAll" />

          </SelectParameters>--%>

         
     </asp:SqlDataSource>

    
    </asp:Content>
