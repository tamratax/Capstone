﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="Scheduling.aspx.cs" Inherits="Lab3.Scheduling" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <h1>Scheduling</h1>
        <br />
    <fieldset>
        <legend><b>Current Scheduled Appointments</b></legend>
        <div>
            <asp:GridView 
                ID="GrdViewScheduling" 
                runat="server"
                EmptyDataText="No Appointments Found"
                DataKeyNames="SchedulingID"
                DataSourceID="DtaSrcSchedulingID"
                AutoGenerateColumns="false"
                CssClass="table justify-content-center">
                <Columns>
                    <asp:CommandField ShowEditButton ="true"  ShowDeleteButton="true" ButtonType="Button" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Time" HeaderText="Time" />
                    <asp:BoundField DataField="MeetingLocation" HeaderText="Meeting Location" />
               </Columns>
            </asp:GridView>
        </div>
    </fieldset>


    <br />

    <fieldset>
        <legend><b>Schedule New Appointment</b></legend>
        <div>
          
                        <asp:Label ID="LblName"
                            runat="server"
                            Text="Customer Name: "></asp:Label>
                 
                        <asp:Label ID="LblCustName"
                            runat="server"
                            Text=""></asp:Label>
                  
                  
                        <asp:Label ID="LblPurpose"
                            runat="server"
                            Text="Purpose:"></asp:Label>
                   
                          <asp:TextBox
                            ID="TxtPurpose"
                            runat="server"></asp:TextBox>
                  
                        <asp:Label ID="LblDescription"
                            runat="server"
                            Text="Description:"></asp:Label>
                   
                          <asp:TextBox
                            ID="TxtDescription"
                            runat="server"></asp:TextBox>
                    
                        <asp:Label ID="LblDate"
                            runat="server"
                            Text="Date:"></asp:Label>
                   
                          <asp:TextBox
                            ID="TxtDate"
                            runat="server"
                            TextMode="Date"></asp:TextBox>
                   
                        <asp:Label ID="LblTime"
                            runat="server"
                            Text="Time:"></asp:Label>
                  
                          <asp:TextBox
                            ID="TxtTime"
                            runat="server"
                            TextMode="Time"
                            ></asp:TextBox>
                  
                        <asp:Label ID="LblMeetingLocation"
                            runat="server"
                            Text="Meeting Location:"></asp:Label>
                    
                          <asp:TextBox
                            ID="TxtMeetingLocation"
                            runat="server"></asp:TextBox>
                    
        </div>
    </fieldset>
    <fieldset>
        <br />
        <div>
           
                        <asp:Button 
                            ID="BtnSave" 
                            runat="server" 
                            Text="Create Appointment"
                            OnClick="BtnSave_Click"/>
                  
                        <asp:Label
                            ID="LblSaveStatus" 
                            runat="server" 
                            Text=""></asp:Label>
                   
        </div>
    </fieldset>

    <asp:Label ID="LblSelectedSessionID" runat="server" Text="" Visible="false"></asp:Label>



     <asp:SqlDataSource
            ID="DtaSrcSchedulingID"
            runat="server"
            ConnectionString="<%$ConnectionStrings:Lab3%>"
            SelectCommand="Select SchedulingID, CustomerID, Purpose, Description, Date, Time, MeetingLocation from Scheduling where customerID = @customerID" 
            UpdateCommand="UPDATE Scheduling SET Purpose = @Purpose, Description = @Description, Date = @Date, Time = @Time, MeetingLocation = @MeetingLocation WHERE SchedulingID = @SchedulingID"
            DeleteCommand="DELETE Scheduling where SchedulingID = @SchedulingID">
         <SelectParameters>
             <asp:ControlParameter
                 Name="customerID"
                 Type="Int64"
                 ControlID="LblSelectedSessionID" />
         </SelectParameters>
     </asp:SqlDataSource>


</asp:Content>
