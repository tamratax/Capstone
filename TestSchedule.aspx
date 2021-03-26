<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="TestSchedule.aspx.cs" Inherits="Lab3.TestSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   
    <asp:Label ID="EventSummaryLbl" runat="server" server="" Text="Event Summary"></asp:Label>
    <asp:TextBox ID="SummaryTxt" runat="server"></asp:TextBox>
     
    <br />
    <asp:Label ID="EventDescriptionLbl" runat="server" server="" Text="Event Description"></asp:Label>
    <asp:TextBox ID="TxtDescription" runat="server"></asp:TextBox>

     <br />
    <asp:Label ID="StartLbl" runat="server" server="" Text="Start Date/Time"></asp:Label>
    <asp:TextBox ID="StartDateTxt" runat="server" TextMode="Date"></asp:TextBox>
    <asp:TextBox ID="StartTimeTxt" runat="server" TextMode="Time"></asp:TextBox>

         <br />
    <asp:Label ID="EndLbl" runat="server" server="" Text="End Date/Time"></asp:Label>
    <asp:TextBox ID="EndDateTxt" runat="server" TextMode="Date"></asp:TextBox>
    <asp:TextBox ID="EndTimeTxt" runat="server" TextMode="Time"></asp:TextBox>
    <br />

    <asp:Button ID="ScheduleBtn" runat="server" Text="Schedule" OnClick="ScheduleBtn_Click" />

<%--<form id="form1" runat="server">--%>
  <%--<div style="font-family: Arial" align="center">
    <table>
      <tr>
        <td align="left">
          Appointment Summary:</td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:TextBox ID="txtEventSummary" runat="server" Width="98%"
          Rows="5"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="left">
          Appointment Description:</td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:TextBox ID="txtEventDescription" runat="server" Rows="5"
          Width="98%"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="left">
          Starting Date/Time:</td>
        <td style="width: 30px" valign="top"></td>
        <td align="left" valign="top">Ending Date/Time:</td>
      </tr>
      <tr>
        <td>
          <asp:DropDownList ID="ddlStartTime" runat="server"
          Width="49%">
            <asp:ListItem Value="000000">12:00 AM</asp:ListItem>
            <asp:ListItem Value="003000">12:30 AM</asp:ListItem>
            <asp:ListItem Value="010000">1:00 AM</asp:ListItem>
            <asp:ListItem Value="013000">1:30 AM</asp:ListItem>
            <asp:ListItem Value="020000">2:00 AM</asp:ListItem>
            <asp:ListItem Value="023000">2:30 AM</asp:ListItem>
            <asp:ListItem Value="030000">3:00 AM</asp:ListItem>
            <asp:ListItem Value="033000">3:30 AM</asp:ListItem>
            <asp:ListItem Value="040000">4:00 AM</asp:ListItem>
            <asp:ListItem Value="043000">4:30 AM</asp:ListItem>
            <asp:ListItem Value="050000">5:00 AM</asp:ListItem>
            <asp:ListItem Value="053000">5:30 AM</asp:ListItem>
            <asp:ListItem Value="060000">6:00 AM</asp:ListItem>
            <asp:ListItem Value="063000">6:30 AM</asp:ListItem>
            <asp:ListItem Value="070000">7:00 AM</asp:ListItem>
            <asp:ListItem Value="073000">7:30 AM</asp:ListItem>
            <asp:ListItem Value="080000">8:00 AM</asp:ListItem>
            <asp:ListItem Value="083000">8:30 AM</asp:ListItem>
            <asp:ListItem Value="090000">9:00 AM</asp:ListItem>
            <asp:ListItem Value="093000">9:30 AM</asp:ListItem>
            <asp:ListItem Value="100000">10:00 AM</asp:ListItem>
            <asp:ListItem Value="103000">10:30 AM</asp:ListItem>
            <asp:ListItem Value="110000">11:00 AM</asp:ListItem>
            <asp:ListItem Value="113000">11:30 AM</asp:ListItem>
            <asp:ListItem Value="120000">12:00 PM</asp:ListItem>
            <asp:ListItem Value="123000">12:30 PM</asp:ListItem>
            <asp:ListItem Value="130000">1:00 PM</asp:ListItem>
            <asp:ListItem Value="133000">1:30 PM</asp:ListItem>
            <asp:ListItem Value="140000">2:00 PM</asp:ListItem>
            <asp:ListItem Value="143000">2:30 PM</asp:ListItem>
            <asp:ListItem Value="150000">3:00 PM</asp:ListItem>
            <asp:ListItem Value="153000">3:30 PM</asp:ListItem>
            <asp:ListItem Value="160000">4:00 PM</asp:ListItem>
            <asp:ListItem Value="163000">4:30 PM</asp:ListItem>
            <asp:ListItem Value="170000">5:00 PM</asp:ListItem>
            <asp:ListItem Value="173000">5:30 PM</asp:ListItem>
            <asp:ListItem Value="180000">6:00 PM</asp:ListItem>
            <asp:ListItem Value="183000">6:30 PM</asp:ListItem>
            <asp:ListItem Value="190000">7:00 PM</asp:ListItem>
            <asp:ListItem Value="193000">7;30 PM</asp:ListItem>
            <asp:ListItem Value="200000">8:00 PM</asp:ListItem>
            <asp:ListItem Value="203000">8:30 PM</asp:ListItem>
            <asp:ListItem Value="210000">9:00 PM</asp:ListItem>
            <asp:ListItem Value="213000">9:30 PM</asp:ListItem>
            <asp:ListItem Value="220000">10:00 PM</asp:ListItem>
            <asp:ListItem Value="223000">10:30 PM</asp:ListItem>
            <asp:ListItem Value="230000">11:00 PM</asp:ListItem>
            <asp:ListItem Value="233000">11:30 PM</asp:ListItem>

          </asp:DropDownList><asp:DropDownList ID="ddlStartTZ"
          runat="server" Width="50%">
            <asp:ListItem>US/Eastern</asp:ListItem>
            <asp:ListItem>US/Central</asp:ListItem>
            <asp:ListItem>US/Mountain</asp:ListItem>
            <asp:ListItem>US/Pacific</asp:ListItem>
          </asp:DropDownList></td>
        <td style="width: 30px" valign="top"></td>
        <td valign="top">
          <asp:DropDownList ID="ddlEndTime" runat="server" Width="49%">
            <asp:ListItem Value="000000">12:00 AM</asp:ListItem>
            <asp:ListItem Value="003000">12:30 AM</asp:ListItem>
            <asp:ListItem Value="010000">1:00 AM</asp:ListItem>
            <asp:ListItem Value="013000">1:30 AM</asp:ListItem>
            <asp:ListItem Value="020000">2:00 AM</asp:ListItem>
            <asp:ListItem Value="023000">2:30 AM</asp:ListItem>
            <asp:ListItem Value="030000">3:00 AM</asp:ListItem>
            <asp:ListItem Value="033000">3:30 AM</asp:ListItem>
            <asp:ListItem Value="040000">4:00 AM</asp:ListItem>
            <asp:ListItem Value="043000">4:30 AM</asp:ListItem>
            <asp:ListItem Value="050000">5:00 AM</asp:ListItem>
            <asp:ListItem Value="053000">5:30 AM</asp:ListItem>
            <asp:ListItem Value="060000">6:00 AM</asp:ListItem>
            <asp:ListItem Value="063000">6:30 AM</asp:ListItem>
            <asp:ListItem Value="070000">7:00 AM</asp:ListItem>
            <asp:ListItem Value="073000">7:30 AM</asp:ListItem>
            <asp:ListItem Value="080000">8:00 AM</asp:ListItem>
            <asp:ListItem Value="083000">8:30 AM</asp:ListItem>
            <asp:ListItem Value="090000">9:00 AM</asp:ListItem>
            <asp:ListItem Value="093000">9:30 AM</asp:ListItem>
            <asp:ListItem Value="100000">10:00 AM</asp:ListItem>
            <asp:ListItem Value="103000">10:30 AM</asp:ListItem>
            <asp:ListItem Value="110000">11:00 AM</asp:ListItem>
            <asp:ListItem Value="113000">11:30 AM</asp:ListItem>
            <asp:ListItem Value="120000">12:00 PM</asp:ListItem>
            <asp:ListItem Value="123000">12:30 PM</asp:ListItem>
            <asp:ListItem Value="130000">1:00 PM</asp:ListItem>
            <asp:ListItem Value="133000">1:30 PM</asp:ListItem>
            <asp:ListItem Value="140000">2:00 PM</asp:ListItem>
            <asp:ListItem Value="143000">2:30 PM</asp:ListItem>
            <asp:ListItem Value="150000">3:00 PM</asp:ListItem>
            <asp:ListItem Value="153000">3:30 PM</asp:ListItem>
            <asp:ListItem Value="160000">4:00 PM</asp:ListItem>
            <asp:ListItem Value="163000">4:30 PM</asp:ListItem>
            <asp:ListItem Value="170000">5:00 PM</asp:ListItem>
            <asp:ListItem Value="173000">5:30 PM</asp:ListItem>
            <asp:ListItem Value="180000">6:00 PM</asp:ListItem>
            <asp:ListItem Value="183000">6:30 PM</asp:ListItem>
            <asp:ListItem Value="190000">7:00 PM</asp:ListItem>
            <asp:ListItem Value="193000">7;30 PM</asp:ListItem>
            <asp:ListItem Value="200000">8:00 PM</asp:ListItem>
            <asp:ListItem Value="203000">8:30 PM</asp:ListItem>
            <asp:ListItem Value="210000">9:00 PM</asp:ListItem>
            <asp:ListItem Value="213000">9:30 PM</asp:ListItem>
            <asp:ListItem Value="220000">10:00 PM</asp:ListItem>
            <asp:ListItem Value="223000">10:30 PM</asp:ListItem>
            <asp:ListItem Value="230000">11:00 PM</asp:ListItem>
            <asp:ListItem Value="233000">11:30 PM</asp:ListItem>
          
          </asp:DropDownList><asp:DropDownList ID="ddlEndTZ"
          runat="server" Width="50%">
            <asp:ListItem>US/Eastern</asp:ListItem>
            <asp:ListItem>US/Central</asp:ListItem>
            <asp:ListItem>US/Mountain</asp:ListItem>
            <asp:ListItem>US/Pacific</asp:ListItem>
          </asp:DropDownList></td>
      </tr>
      <tr>
        <td>
          <asp:Calendar ID="calStartDate" runat="server"
          BackColor="White" BorderColor="Black" BorderStyle="Solid"
          CellSpacing="1" Font-Names="Verdana" Font-Size="9pt"
          ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth">
            <SelectedDayStyle BackColor="333399" ForeColor="White" />
            <TodayDayStyle BackColor="999999" ForeColor="White" />
            
            <OtherMonthDayStyle ForeColor="999999" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" 
            ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" 
            ForeColor="333333" Height="8pt" />
            <TitleStyle BackColor="333399" BorderStyle="Solid"
            Font-Bold="True" Font-Size="12pt"
            ForeColor="White" Height="12pt" />
          </asp:Calendar>
        </td>
        <td style="width: 30px" valign="top"></td>
        <td valign="top">
          <asp:Calendar ID="calEndDate" runat="server"
          BackColor="White" BorderColor="Black" BorderStyle="Solid" 
          CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" 
          ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth">
            <SelectedDayStyle BackColor="333399" ForeColor="White" />
            <TodayDayStyle BackColor="999999" ForeColor="White" />
            
            <OtherMonthDayStyle ForeColor="999999" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt"
            ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt"
            ForeColor="333333" Height="8pt" />
            <TitleStyle BackColor="333399" BorderStyle="Solid"
            Font-Bold="True" Font-Size="12pt"
            ForeColor="White" Height="12pt" />
          </asp:Calendar>
        </td>
      </tr>
      <tr>
        <td align="center" colspan="3" valign="top">
          <asp:Button ID="btnAddEvent" runat="server" 
           OnClick="btnAddEvent_Click1" Text="Add Event" /></td>
      </tr>
    </table>
  </div>
</form>--%>

</asp:Content>
