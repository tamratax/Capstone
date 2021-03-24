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

namespace Lab2
{
    public partial class AddNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checks to see if there is a customer selected
            if (Session["SelectedCustomerID"] == null)
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("Navigation.aspx");


            }

            //Set label to Selected Customer
            LblSelectedCustomer.Text = Session["SelectedCustomerName"].ToString();

            //protected void DdlCustomerList_DataBound(object sender, EventArgs e)
            //{
            //    if (!IsPostBack)
            //    {
            //        //Sets Customer list ddl to default of select
            //        ListItem blankOption = new ListItem("Select", "-1");
            //        DdlCustomerList.Items.Insert(0, blankOption);
            //        DdlCustomerList.SelectedIndex = 0;



            //    }
            //}

            //protected void DdlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
            //{
            if (Session["SelectedCustomerID"] != null)
            {
                //Populates service Ddl when customer is selected
                DdlServiceList.DataTextField = "Services";
                DdlServiceList.DataValueField = "ServiceTicketID";

                String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where customerID = " + Session["SelectedCustomerID"].ToString();


                SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                DataTable dtForDdlServiceList = new DataTable();
                sqlAdapterService.Fill(dtForDdlServiceList);

                DdlServiceList.DataSource = dtForDdlServiceList;
                DdlServiceList.DataBind();
            }
            else
            {
                //Clears data when CustomerDdl is changed to Select
                DdlServiceList.Items.Clear();
                DdlNoteCreator.SelectedValue = "-1";
                TxtTitle.Text = "";
                TxtDetails.Text = "";
                LblSaveStatus.Text = "";
            }
        }

        

        protected void DdlServiceList_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Sets Service list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DdlServiceList.Items.Insert(0, blankOption);
                DdlServiceList.SelectedIndex = 0;
            }
        }


        protected void DdlServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                if (DdlServiceList.SelectedValue != "-1")
                {
                }
                else
                {
                    //Clears data when ServiceDdl is changed to Select
                    TxtTitle.Text = "";
                    TxtDetails.Text = "";
                    LblSaveStatus.Text = "";
                }
            
        }
        protected void BtnAddNote_Click(object sender, EventArgs e)
        {
            try
            {
                //Concatenate Sql Query Insert Statements
                String sqlQuery = "INSERT into TicketHistory VALUES ('" + System.DateTime.Today.ToString("yyyy-MM-dd") + "', @NoteTitle, @NoteDetails, " + DdlServiceList.SelectedValue + ", " + DdlNoteCreator.SelectedValue +  ")";

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.Add(new SqlParameter("@NoteTitle", HttpUtility.HtmlEncode(TxtTitle.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@NoteDetails", HttpUtility.HtmlEncode(TxtDetails.Text)));

                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                
                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                LblSaveStatus.Text = "Note Added Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
            catch
            {
                LblSaveStatus.Text = "Error Adding Note, Check Data Fields";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }

        protected void DdlNoteCreator_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlNoteCreator.Items.Insert(0, blankOption);
            DdlNoteCreator.SelectedIndex = 0;
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //Clears all data on page
            //DdlCustomerList.SelectedValue = "-1";
            DdlServiceList.Items.Clear();
            DdlNoteCreator.SelectedValue = "-1";
            TxtTitle.Text = "";
            TxtDetails.Text = "";
            LblSaveStatus.Text = "";
        }

        protected void BtnViewNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewNote.aspx");
        }
    }




}