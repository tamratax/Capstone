//Coded By: Stuart Walker & Aaron Walsh
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
    public partial class AddServiceRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Creates items for service type ddl
                DdlServiceType.Items.Add(new ListItem("Select", "-1"));
                DdlServiceType.Items.Add(new ListItem("Move", "Move"));
                DdlServiceType.Items.Add(new ListItem("Auction", "Auction"));
                DdlServiceType.Items.Add(new ListItem("Consignment", "Consignment"));
                DdlServiceType.Items.Add(new ListItem("Appraisal", "Appraisal"));

            }

            username.Text = Session["CustomerUsername"].ToString();
        }

        protected void BtnCreateServiceRequest_Click(object sender, EventArgs e)
        {
            //try
            //{
            if (Session["CustomerUsername"] != null)
            {
                //Concatenate Sql Query Insert Statements
                String sqlQuery = "select CustomerID from Customer where email = '" + Session["CustomerUsername"].ToString() + "'";

                //Runs sql select statement and saves into datatable
                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //Creates bridge between the query and the connection
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                DataTable dtForSelect = new DataTable();
                sqlAdapter.Fill(dtForSelect);

                //Gets Customer ID
                String customerID = Convert.ToString(dtForSelect.Rows[0]["CustomerID"]);

                //Creates service request record with customerID
                //Concatenate Sql Query Insert Statement
                String sqlQueryInsert = "insert into servicerequest values (@DdlServicetype, @ServiceDate, @RequestDescription, 0, " + customerID + ")";
                //Define the Connection to the Database
                SqlConnection sqlConnectInsert = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommandInsert = new SqlCommand();
                sqlCommandInsert.Connection = sqlConnectInsert;
                sqlCommandInsert.CommandType = CommandType.Text;
                sqlCommandInsert.CommandText = sqlQueryInsert;
                sqlCommandInsert.Parameters.Add(new SqlParameter("@DdlServiceType", DdlServiceType.SelectedItem.Text));
                sqlCommandInsert.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                sqlCommandInsert.Parameters.Add(new SqlParameter("@RequestDescription", HttpUtility.HtmlEncode(TxtRequestDescription.Text)));

                // Open your connection, send the query 
                sqlConnectInsert.Open();
                SqlDataReader queryResultsInsert = sqlCommandInsert.ExecuteReader();

                // Close all related connections
                queryResultsInsert.Close();
                sqlConnectInsert.Close();

                LblSaveStatus.Text = "Service Request Added Successfully";
                LblSaveStatus.ForeColor = Color.Green;

                GridRequests.DataBind();

                TxtRequestDescription.Text = "";
                TxtServiceDate.Text = "";

                var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
                var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name"); 
                const string fromPassword = "RoCo703757";
                const string subject = "Subject";
                const string body = "Body";

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

            else
            {
                LblSaveStatus.Text = "Please Login Again";
                LblSaveStatus.ForeColor = Color.Red;
            }

                //}
                //catch
                //{
                //    LblSaveStatus.Text = "Database Error";
                //    LblSaveStatus.ForeColor = Color.Red;
                //}

            }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FilesUpload.HasFile)
                foreach (HttpPostedFile uploadedFile in FilesUpload.PostedFiles)
                    try
                    {
                        uploadedFile.SaveAs(Server.MapPath("~/uploads/") +
                                            uploadedFile.FileName);
                        FileUploadedList.Text += "File name: " +
                           uploadedFile.FileName + "<br>" +
                           uploadedFile.ContentLength + " kb<br>" +
                           "Content type: " + uploadedFile.ContentType + "<br><br>";
                    }
                    catch (Exception ex)
                    {
                        FileUploadedList.Text = "ERROR: " + ex.Message.ToString();
                    }
            else
            {
                FileUploadedList.Text = "You have not specified a file.";
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            DdlServiceType.SelectedValue = "-1";
            TxtServiceDate.Text = "";
            TxtRequestDescription.Text = "";
            LblSaveStatus.Text = "";

        }
    }
}