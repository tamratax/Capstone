using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace Lab3
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Checks to see if there is a customer selected
                if (Session["SelectedCustomerID"] == null)
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");


                }
                //If the user is trying to edit a customer, there will be a customerid in this session data
                if (Session["SelectedCustomerID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from customer where customerid = " + Session["SelectedCustomerID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    LblCustName.Text = Session["SelectedCustomerName"].ToString();
                    LblHomeNumber.Text = FormatPhoneNumber(Convert.ToString(dtForSelect.Rows[0]["HomePhone"])).ToString();
                    LblCellNumber.Text = FormatPhoneNumber(Convert.ToString(dtForSelect.Rows[0]["CellPhone"])).ToString();
                    LblWorkNumber.Text = FormatPhoneNumber(Convert.ToString(dtForSelect.Rows[0]["WorkPhone"])).ToString();
                    LblEmailText.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);


                    //Populates service Ddl
                    ddlService1.DataTextField = "Services";
                    ddlService1.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + TicketOpenDate 'Services' from ServiceTicket where  customerID = " + Session["SelectedCustomerID"].ToString();


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    ddlService1.DataSource = dtForDdlServiceList;
                    ddlService1.DataBind();
                }
            }
        }
        protected void ddlService_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            ddlService1.Items.Insert(0, blankOption);
            ddlService1.SelectedIndex = 0;
        }

        protected void SubmitFeed_Click1(object sender, EventArgs e)
        {
            //Concatenate Sql Query Update Statements
            String sqlQuery = "Insert into Feedback values (@ServiceTicketID, @feedback, @comments)";

            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            //Parameterizes all the strings
            sqlCommand.Parameters.Add(new SqlParameter("@ServiceTicketID", HttpUtility.HtmlEncode(ddlService1.SelectedValue.ToString())));
            sqlCommand.Parameters.Add(new SqlParameter("@feedback", HttpUtility.HtmlEncode(ddlFeedback.SelectedValue.ToString())));
            sqlCommand.Parameters.Add(new SqlParameter("@comments", HttpUtility.HtmlEncode(Commentstxt.Text)));
            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();





            if (ddlFeedback.SelectedValue.ToString() == "Positive")
            {

                var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
                var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name");
                const string fromPassword = "RoCo703757";
                const string subject = "Green Valley Auction Servey";
                string body = "Thank you for your business, " + LblCustName.Text +
                    " We would be very greatful if you could fill out our survey and let us know how we did." +
                    "https://forms.gle/xo8Wt5nk1bnUidX66";

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress) { Subject = subject, Body = body })
                {
                    smtp.Send(message);
                }


                LblSaveStatus.Text = "Submitted Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
            else
            {
                var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
                var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name");
                const string fromPassword = "RoCo703757";
                string subject = "Customer Complaint from " + LblCustName.Text;
                string body = "Complaint Submitted to Green Valley Auction " + "Comments: \n " + Commentstxt.Text;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress) { Subject = subject, Body = body })
                {
                    smtp.Send(message);
                }


                LblSaveStatus.Text = "Completed Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
        }
        public object FormatPhoneNumber(string phoneNumber)
        {
            // return nothing if the string is null
            if (String.IsNullOrEmpty(phoneNumber))
            {
                return "N/A";
            }

            // if the int is valid, return the formatted phone number
            return string.Format("({0}) {1}-{2}",
                   phoneNumber.Substring(0, 3),
                   phoneNumber.Substring(3, 3),
                   phoneNumber.Substring(6));
        }
    }
}