using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

namespace Lab3
{
    public partial class TestSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void ScheduleBtn_Click(object sender, EventArgs e)
        {
            StringBuilder sbICSFile = new StringBuilder();
            DateTime dtNov = DateTime.Now;

            sbICSFile.AppendLine("Begin:VCalendar");
            sbICSFile.AppendLine("VERSION:2.0");
            sbICSFile.AppendLine("PRODID:-//ICSTest/");
            sbICSFile.AppendLine("CALSCALE:GREGORIAN");

            //Define timezones add Drop down for it or remove 
            //Us Eastern
            sbICSFile.AppendLine("BEGIN:VTIMEZONE");
            sbICSFile.AppendLine("TZID:US/Eastern");
            sbICSFile.AppendLine("BEGIN:STANDARD");
            sbICSFile.AppendLine("DTSTART:20071104T020000");
            sbICSFile.AppendLine("RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11");
            sbICSFile.AppendLine("TZOFFSETFROM:-0400");
            sbICSFile.AppendLine("TZOFFSETTO:-0500");
            sbICSFile.AppendLine("TZNAME:EST");
            sbICSFile.AppendLine("END:STANDARD");
            sbICSFile.AppendLine("BEGIN:DAYLIGHT");
            sbICSFile.AppendLine("DTSTART:20070311T020000");
            sbICSFile.AppendLine("RRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3");
            sbICSFile.AppendLine("TZOFFSETFROM:-0500");
            sbICSFile.AppendLine("TZOFFSETTO:-0400");
            sbICSFile.AppendLine("TZNAME:EDT");
            sbICSFile.AppendLine("END:DAYLIGHT");
            sbICSFile.AppendLine("END:VTIMEZONE");

            // Define the event
            //sbICSFile.Append("DTSTART;TZID=" + ddlStartTZ.Text + ":");
            sbICSFile.Append(StartDateTxt.ToString());
            //sbICSFile.Append(_FormatDateTimeValue(calStartDate.SelectedDate.Month));
            //sbICSFile.Append(_FormatDateTimeValue(calStartDate.SelectedDate.Day) + "T");
            //sbICSFile.AppendLine(ddlStartTime.SelectedValue);

            //sbICSFile.Append("DTEND;TZID=" + ddlEndTZ.Text + ":");
            sbICSFile.Append(EndDateTxt.ToString());
            //sbICSFile.Append(_        FormatDateTimeValue(calEndDate.SelectedDate.Month));
            //sbICSFile.Append(_        FormatDateTimeValue(calEndDate.SelectedDate.Day) + "T");
            //sbICSFile.AppendLine(ddlEndTime.SelectedValue);

            sbICSFile.AppendLine("SUMMARY:" + SummaryTxt.Text);
            sbICSFile.AppendLine("DESCRIPTION:" + TxtDescription.Text);
            sbICSFile.AppendLine("UID:1");
            sbICSFile.AppendLine("SEQUENCE:0");

            //sbICSFile.Append("DTSTAMP:" + dtNow.Year.ToString());
            //sbICSFile.Append(FormatDateTimeValue(dtNow.Month));
            //sbICSFile.Append(FormatDateTimeValue(dtNow.Day) + "T");
            //sbICSFile.Append(FormatDateTimeValue(dtNow.Hour));
            //sbICSFile.AppendLine(FormatDateTimeValue(dtNow.Minute) + "00");

            sbICSFile.AppendLine("END:VEVENT");
            sbICSFile.AppendLine("END:VCALENDAR");

            Response.ContentType = "text/calendar";
            Response.AddHeader("content-disposition", "attachment; filename=CalendarEvent1.ics");
            Response.Write(sbICSFile);
            Response.End();



        }

        protected void btnAddEvent_Click1(object sender, EventArgs e)
        {
            //    StringBuilder sbICSFile = new StringBuilder();
            //    DateTime dtNov = DateTime.Now;
            //    sbICSFile.AppendLine("BEGIN:VCALENDAR");
            //    sbICSFile.AppendLine("VERSION:2.0");
            //    sbICSFile.AppendLine("PRODID:-//AkonaDev/CalendarAppointment");
            //    sbICSFile.AppendLine("CALSCALE:GREGORIAN");
            //    sbICSFile.AppendLine("BEGIN:VEVENT");


            //    //Define time zones.
            //    // US/Eastern
            //    sbICSFile.AppendLine("BEGIN:VTIMEZONE");
            //    sbICSFile.AppendLine("TZID:US/Eastern");
            //    sbICSFile.AppendLine("BEGIN:STANDARD");
            //    sbICSFile.AppendLine("DTSTART:20071104T020000");
            //    sbICSFile.AppendLine("RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11");
            //    sbICSFile.AppendLine("TZOFFSETFROM:-0400");
            //    sbICSFile.AppendLine("TZOFFSETTO:-0500");
            //    sbICSFile.AppendLine("TZNAME:EST");
            //    sbICSFile.AppendLine("END:STANDARD");
            //    sbICSFile.AppendLine("BEGIN:DAYLIGHT");
            //    sbICSFile.AppendLine("DTSTART:20070311T020000");
            //    sbICSFile.AppendLine("RRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3");
            //    sbICSFile.AppendLine("TZOFFSETFROM:-0500");
            //    sbICSFile.AppendLine("TZOFFSETTO:-0400");
            //    sbICSFile.AppendLine("TZNAME:EDT");
            //    sbICSFile.AppendLine("END:DAYLIGHT");
            //    sbICSFile.AppendLine("END:VTIMEZONE");

            //    //Define the event
            //    sbICSFile.AppendLine("Begin:VEvent");

            //    sbICSFile.Append("DTSTART;TZID=" + ddlStartTZ.Text + ":");
            //    sbICSFile.Append(calStartDate.SelectedDate.Year.ToString());
            //    sbICSFile.Append(FormatDateTimeValue(calStartDate.SelectedDate.Month));
            //    sbICSFile.Append(FormatDateTimeValue(calStartDate.SelectedDate.Day) + "T");
            //    sbICSFile.AppendLine(ddlStartTime.SelectedValue);

            //    sbICSFile.Append("DTEND;TZID=" + ddlEndTZ.Text + ":");
            //    sbICSFile.Append(calEndDate.SelectedDate.Year);
            //    sbICSFile.Append(FormatDateTimeValue(calEndDate.SelectedDate.Month));
            //    sbICSFile.Append(FormatDateTimeValue(calEndDate.SelectedDate.Day) + "T");
            //    sbICSFile.AppendLine(ddlEndTime.SelectedValue);

            //    sbICSFile.AppendLine("SUMMARY:" + txtEventSummary.Text);
            //    sbICSFile.AppendLine("DESCRIPTION:" + txtEventDescription.Text); 
            //    sbICSFile.AppendLine("UID:1");
            //    sbICSFile.AppendLine("SEQUENCE:0");


            //    //sbICSFile.Append("DTSTAMP:" + dtNow.Year.ToString());
            //    //sbICSFile.Append(FormatDateTimeValue(dtNow.Month));
            //    //sbICSFile.Append(FormatDateTimeValue(dtNow.Day) + "T");
            //    //sbICSFile.Append(FormatDateTimeValue(dtNow.Hour));
            //    //sbICSFile.AppendLine(FormatDateTimeValue(dtNow.Minute) + "00");

            //    sbICSFile.AppendLine("END:VEVENT");
            //    sbICSFile.AppendLine("END:VCALENDAR");

            //    Response.ContentType = "text/calendar";
            //    Response.AddHeader("content-disposition", "attachment; filename=CalendarEvent1.ics");
            //    Response.Write(sbICSFile);
            //    Response.End();
            //    }
            //private string FormatDateTimeValue(int DateValue)
            //{
            //    if (DateValue < 10)
            //        return "0" + DateValue.ToString();
            //    else
            //        return DateValue.ToString();
            //}
        }
    }
}