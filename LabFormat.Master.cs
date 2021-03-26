//Coded By:Stuart Walker & Aaron Walsh
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

namespace Lab2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////If not logged in, will kick user to Unauthorized page
            //if (Session["User"] == null)
            //{
            //    Response.Redirect("UnauthorizedAccess.aspx");
            //}
            //else
            //{
            //    LblActiveUser.Text = "You Are Logged In As: " + Session["User"].ToString();
            //}

            if (Session["SelectedCustomerID"] != null)
            {
                divNotes.Visible = true;
            }
            else
            {
                divNotes.Visible = false;
            }

        }



        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            //Set the session data for user to null
            Session.RemoveAll();
            Response.Redirect("UserLogin.aspx");
        }

        protected void LblSelectedCust_PreRender(object sender, EventArgs e)
        {
            if (Session["SelectedCustomerName"] != null)
            {
                LblSelectedCust.Text = Session["SelectedCustomerName"].ToString();
            }
            else
            {
                LblSelectedCust.Text = "No Customer Selected!";
            }
        }

        protected void BtnClearCust_Click(object sender, EventArgs e)
        {
            Session.Remove("SelectedCustomerID");
            Session.Remove("SelectedCustomerName");
            Response.Redirect("Navigation.aspx");
        }

        protected void DdlNotes_DataBound(object sender, EventArgs e)
        {
            //Sets ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlNotes.Items.Insert(0, blankOption);
            ListItem NewNote = new ListItem("--Add New Note--", "AddNewNote");
            DdlNotes.Items.Insert(1, NewNote);
        }

        protected void DdlNotes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlNotes.SelectedIndex == 0)
            {
                //if select is selected
                TxtNoteText.Text = "";
                LblNoteDate.Text = "";
                divNotesContent.Visible = false;

            }
            else if (DdlNotes.SelectedIndex == 1)
            {
                divNotesContent.Visible = true;
                //if addnewnote is selected
                LblNoteDate.Text = "New Note";
                TxtNoteText.Text = "";
            }
            else
            {
                divNotesContent.Visible = true;
                //if a note is selected
                //Pulling in customer's record
                String sqlQuery = "Select DateCreated, NoteText from NOTES where NoteID = " + DdlNotes.SelectedValue.ToString();

                //Establishes the connection between our web form and database
                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                //This creates a datatable and fills it
                DataTable dtForSelect = new DataTable();
                sqlAdapter.Fill(dtForSelect);

                //Fills page with data from selected service
                LblNoteDate.Text = Convert.ToString(dtForSelect.Rows[0]["DateCreated"]);
                TxtNoteText.Text = Convert.ToString(dtForSelect.Rows[0]["NoteText"]);



            }
        }

        protected void BtnSaveNote_Click(object sender, EventArgs e)
        {
            if (DdlNotes.SelectedIndex == 1)
            {
                //if addnewnote is selected, insert note
                //Concatenate Sql Query Update Statement
                string sqlQuery = "INSERT INTO NOTES (DateCreated, NoteText, CustomerID) VALUES (@DateCreated, @NoteText, @CustomerID)";

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                //Parameterizes all the strings
                sqlCommand.Parameters.Add(new SqlParameter("@DateCreated", System.DateTime.Today.ToString("yyyy-MM-dd")));
                sqlCommand.Parameters.Add(new SqlParameter("@NoteText", HttpUtility.HtmlEncode(TxtNoteText.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"]));

                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                DdlNotes.DataBind();
                DdlNotes.SelectedIndex = 0;

            }
            else
            {
                //if note is selected, update existing note
                //Concatenate Sql Query Update Statement
                string sqlQuery = "UPDATE NOTES SET NoteText = @NoteText WHERE NoteID = " + DdlNotes.SelectedValue.ToString();

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                //Parameterizes all the strings
                sqlCommand.Parameters.Add(new SqlParameter("@NoteText", HttpUtility.HtmlEncode(TxtNoteText.Text)));

                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();


            }
        }

        protected void DdlNotes_PreRender(object sender, EventArgs e)
        {
            if (DdlNotes.SelectedIndex == 0)
            {
                DdlNotes_SelectedIndexChanged(sender, e);
            }
        }
    }
}