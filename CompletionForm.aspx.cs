using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace Lab3
{
    public partial class CompletionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLCust_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DDLCust.SelectedValue != "-1")
                {
                    //Populates service Ddl
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + DDLCust.SelectedValue;


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLType.DataSource = dtForDdlServiceList;
                    DDLType.DataBind();
                }

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void DDLCust_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLCust.Items.Insert(0, blankOption);
            DDLCust.SelectedIndex = 0;
        }

        protected void DDLType_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;
        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridCust.Visible = true;
            GridAddress.Visible = true;
            GridEmployee.Visible = true;
        }

        protected void Drplst_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Drplst_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            Drplst.Items.Insert(0, blankOption);
            Drplst.SelectedIndex = 0;
        }

        protected void BtnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [MOVEEMPLOYEES] (EmployeeID, EmployeeName, ServiceTicketID) Values (@EmployeeID, @EmployeeName, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EmployeeID", Drplst.SelectedValue.ToString());
                com.Parameters.AddWithValue("EmployeeName", Drplst.SelectedItem.ToString());
                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Item sucessfully added!";
                GridEmployee.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }



        }

        protected void DDLPaynentType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DDLPaynentType_DataBound(object sender, EventArgs e)
        {

        }

        protected void BtnCalculate_Click(object sender, EventArgs e)
        {
            //try
            //{
            string query = "INSERT INTO [CHARGES] (Hours, Amount, Total, ServiceTicketID) Values (@Hours, @Amount, @Total, @ServiceTicketID)";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("Hours", HttpUtility.HtmlEncode(TxtCharge.Text.ToString()));
            com.Parameters.AddWithValue("Amount", HttpUtility.HtmlEncode(TxtAmount.Text.ToString()));
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            double total = Convert.ToDouble(TxtCharge.Text) * Convert.ToDouble(TxtAmount.Text);
            com.Parameters.AddWithValue("Total", total);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            LblStatus.Text = "Item sucessfully added!";
            GridCharges.DataBind();

            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error!";
            //}
        }

        protected void BtnSupplies_Click(object sender, EventArgs e)
        {
            //try
            //{

            //Pulling in customer's record
            string query2 = "SELECT SUM(Total) sum FROM CHARGES WHERE ServiceTicketID = " + DDLType.SelectedValue.ToString();

            //Establishes the connection between our web form and database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(query2, sqlConnect);

            //This creates a datatable and fills it
            DataTable dtForSelect = new DataTable();
            sqlAdapter.Fill(dtForSelect);



            double queryresults = Convert.ToDouble(dtForSelect.Rows[0]["sum"]);
            if (TxtSupplies.Text == "")
            {
                TxtSupplies.Text = "0";
            }
            double trueTotal = Convert.ToDouble(TxtSupplies.Text) + Convert.ToDouble(queryresults);
            LblCalculate.Text = "$"+trueTotal.ToString();



            sqlConnect.Close();

            LblStatus.Text = "Item sucessfully added!";


            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error!";
            //}
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
            var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name");
            const string fromPassword = "RoCo703757";
            const string subject = "Service Order Successfully Completed!";
            const string body = "Hello, We are glad to have provided you with our services. If you could leave us a review it would be much appretiated. " +
                "https://docs.google.com/forms/d/e/1FAIpQLSd2BrUcMwVNyyqqJ0vMiztJcCr78cSajYY1ptFLKMw8xRdcUw/viewform?usp=sf_link";

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
        }
    }
}