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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Save_Click(object sender, EventArgs e)
        {
            String sqlQuery = "insert into Employee values (@EmpFirstName, @EmpLastName)";
            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlCommand.Parameters.Add(new SqlParameter("@EmpFirstName", HttpUtility.HtmlEncode(AddEmployeeFirstTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@EmpLastName", HttpUtility.HtmlEncode(AddEmployeeLastTxt.Text)));

            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            sqlConnect.Close();


            LblSaveStatus.Text = "Employee Added Successfully";
            LblSaveStatus.ForeColor = Color.Green;
            GrdEquip.DataBind();

        }
    }
}