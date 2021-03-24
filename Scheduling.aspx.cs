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

namespace Lab3
{
    public partial class Scheduling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            LblSelectedSessionID.Text = Session["SelectedCustomerID"].ToString();


            ////POPULATE SCHEDULING GRIDVIEW
            //String sqlQuery = "Select SchedulingID, CustomerID, Purpose, Description, Date, Time, MeetingLocation from Scheduling where customerID = " + Session["SelectedCustomerID"].ToString();

            ////Establishes the connection between our web form and database
            //SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            ////The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            ////This creates a datatable and fills it
            //DataTable dtForGridView = new DataTable();
            //sqlAdapter.Fill(dtForGridView);

            ////Sends the results from the datatable to the gridview
            //GrdViewScheduling.DataSource = dtForGridView;
            //GrdViewScheduling.DataBind();
            //GrdViewScheduling.Visible = true;



            //SET LABEL TO SELECTED CUSTOMER NAME
            LblCustName.Text = Session["SelectedCustomerName"].ToString();


           


        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //INSERT STATEMENTS FOR ADDING APPOINTMENT
            //Concatenate Sql Query Update Statements
            String sqlQuery = "Insert into Scheduling values (@CustomerID, @Purpose, @Description, @Date, @Time, @MeetingLocation)";

            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            //Parameterizes all the strings
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand.Parameters.Add(new SqlParameter("@Purpose", HttpUtility.HtmlEncode(TxtPurpose.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(TxtDescription.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Date", HttpUtility.HtmlEncode(TxtDate.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Time", HttpUtility.HtmlEncode(TxtTime.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@MeetingLocation", HttpUtility.HtmlEncode(TxtMeetingLocation.Text)));

            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
            GrdViewScheduling.DataBind();

            LblSaveStatus.ForeColor = Color.Green;
            LblSaveStatus.Text = "New Appointment Scheduled";

            //Clears textboxes
            TxtPurpose.Text = "";
            TxtDescription.Text = "";
            TxtDate.Text = "";
            TxtTime.Text = "";
            TxtMeetingLocation.Text = "";

        }
    }
}