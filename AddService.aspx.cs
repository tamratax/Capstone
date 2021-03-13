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

namespace WalkerS_Lab1Part3
{
    public partial class AddService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Creates items for service type ddl
                DdlServiceType.Items.Add(new ListItem("Select", "-1"));
                DdlServiceType.Items.Add(new ListItem("Move", "Move"));
                DdlServiceType.Items.Add(new ListItem("Auction", "Auction"));

                //Hides auction/move fields on load
                LblEmployeeContact.Visible = false;
                DdlEmployeeContact.Visible = false;
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;
                LblGasExpense.Visible = false;
                TxtGasExpense.Visible = false;
                LblMiscExpense.Visible = false;
                TxtMiscExpense.Visible = false;

                //Hides rfv fields on load
                RfvDestinationTime.Visible = false;
                RfvGasExpense.Visible = false;
                RfvMiscExpense.Visible = false;

                RfvEmployeeContact.Visible = false;

                //Hides cv fields
                CvGasExpense.Visible = false;
                CvMiscExpense.Visible = false;

                if (Session["ServiceRequestID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from ServiceRequest where ServiceRequestID = " + Session["ServiceRequestID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);


                    //Populates service fields with request data
                    TxtServiceDate.Text = Convert.ToString(dtForSelect.Rows[0]["ServiceDate"]);

                    if (Convert.ToString(dtForSelect.Rows[0]["ServiceType"]) != "")
                    {
                        DdlServiceType.SelectedValue = DdlServiceType.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["ServiceType"]).Trim()).Value;
                        DdlServiceType_SelectedIndexChanged(sender, e);
                    }
                    ddlCustomerList.SelectedValue = Convert.ToString(dtForSelect.Rows[0]["CustomerID"]);
                    LblRequestDescription.Text = "Request Description: " + Convert.ToString(dtForSelect.Rows[0]["RequestDescription"]);
                }

                if (Session["ServiceTicketID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from ServiceTicket where ServiceTicketID = " + Session["ServiceTicketID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    //Fills page with data from selected service
                    DdlInitiatingEmp.SelectedValue = Convert.ToString(dtForSelect.Rows[0]["InitiatingEmp"]);
                    ddlCustomerList.SelectedValue = Convert.ToString(dtForSelect.Rows[0]["CustomerID"]);
                    TxtTicketStatus.Text = Convert.ToString(dtForSelect.Rows[0]["TicketStatus"]);
                    TxtServiceDate.Text = Convert.ToString(dtForSelect.Rows[0]["ServiceDate"]);
                    TxtCompletionDate.Text = Convert.ToString(dtForSelect.Rows[0]["CompletionDate"]);
                    TxtServiceCost.Text = Convert.ToString(dtForSelect.Rows[0]["ServiceCost"]);
                    DdlServiceType.SelectedValue = DdlServiceType.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["ServiceType"]).Trim()).Value;
                    DdlServiceType_SelectedIndexChanged(sender, e);
                    TxtDestinationTime.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationTime"]);
                    TxtGasExpense.Text = Convert.ToString(dtForSelect.Rows[0]["GasExpense"]);
                    TxtMiscExpense.Text = Convert.ToString(dtForSelect.Rows[0]["MiscExpense"]);
                    if (Convert.ToString(dtForSelect.Rows[0]["ContactID"]) != "")
                    {
                        DdlEmployeeContact.SelectedValue = Convert.ToString(dtForSelect.Rows[0]["ContactID"]);
                    }



                }

            }

        }


        protected void BtnViewServicePage_Click(object sender, EventArgs e)
        {
            //changes  page to view services page
            Session["ServiceRequestID"] = null;
            Session["ServiceTicketID"] = null;
            Response.Redirect("ViewService.aspx");
        }

        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            //temp button to autofill controls with dummy data
            DdlInitiatingEmp.SelectedIndex = 2;
            ddlCustomerList.SelectedIndex = 2;
            TxtTicketStatus.Text = "In Progress";
            TxtServiceDate.Text = "2021-08-05";
            TxtCompletionDate.Text = "2021-09-07";
            TxtServiceCost.Text = "24.67";
            DdlServiceType.SelectedIndex = 1;
            TxtDestinationTime.Text = "9:00am";
            TxtGasExpense.Text = "142.56";
            TxtMiscExpense.Text = "80.00";

            //Reloads data to show Move fields
            DdlServiceType_SelectedIndexChanged(sender, e);


        }

        protected void ddlCustomerList_DataBound(object sender, EventArgs e)
        {
            //Sets drop down list to default Select option
            ddlCustomerList.Items.Insert(0, new ListItem("Select", "-1"));
        }


        protected void DdlEmployeeContact_DataBound(object sender, EventArgs e)
        {
            //Sets drop down list to default Select option
            DdlEmployeeContact.Items.Insert(0, new ListItem("Select", "-1"));
        }

        protected void DdlServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlServiceType.SelectedValue == "Move")
            {
                //hides auction fields
                LblEmployeeContact.Visible = false;
                DdlEmployeeContact.Visible = false;

                //Hides auction Rfv Fields
                RfvEmployeeContact.Visible = false;

                //Show compare validators
                CvGasExpense.Visible = true;
                CvMiscExpense.Visible = true;

                //Show Move Fields
                LblDestinationTime.Visible = true;
                TxtDestinationTime.Visible = true;
                LblGasExpense.Visible = true;
                TxtGasExpense.Visible = true;
                LblMiscExpense.Visible = true;
                TxtMiscExpense.Visible = true;

                //Show move rfv fields
                RfvDestinationTime.Visible = true;
                RfvGasExpense.Visible = true;
                RfvMiscExpense.Visible = true;



            }
            else if (DdlServiceType.SelectedValue == "Auction")
            {
                //hides move fields
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;
                LblGasExpense.Visible = false;
                TxtGasExpense.Visible = false;
                LblMiscExpense.Visible = false;
                TxtMiscExpense.Visible = false;

                //hides rfv fields
                RfvDestinationTime.Visible = false;
                RfvGasExpense.Visible = false;
                RfvMiscExpense.Visible = false;

                //Hides Cv Fields
                CvGasExpense.Visible = false;
                CvMiscExpense.Visible = false;

                //show auction fields
                LblEmployeeContact.Visible = true;
                DdlEmployeeContact.Visible = true;

                //Show auction Rfv Fields
                RfvEmployeeContact.Visible = true;
            }
            else
            {

                //Hides fields if no choice selected
                LblEmployeeContact.Visible = false;
                DdlEmployeeContact.Visible = false;
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;
                LblGasExpense.Visible = false;
                TxtGasExpense.Visible = false;
                LblMiscExpense.Visible = false;
                TxtMiscExpense.Visible = false;

                //Hides all rfv
                RfvDestinationTime.Visible = false;
                RfvGasExpense.Visible = false;
                RfvMiscExpense.Visible = false;
                RfvEmployeeContact.Visible = false;

                //Hides compare validators
                CvGasExpense.Visible = false;
                CvMiscExpense.Visible = false;



            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //Clears all data on webform
            DdlInitiatingEmp.SelectedIndex = -1;
            ddlCustomerList.SelectedIndex = -1;
            TxtTicketStatus.Text = "";
            TxtServiceDate.Text = "";
            TxtCompletionDate.Text = "";
            TxtServiceCost.Text = "";
            DdlServiceType.SelectedIndex = -1;
            TxtDestinationTime.Text = "";
            TxtGasExpense.Text = "";
            TxtMiscExpense.Text = "";
            ChkBoxCompleted.Checked = false;
            LblRequestDescription.Text = "";

            //Reloads data to hide move/auction fields
            DdlServiceType_SelectedIndexChanged(sender, e);

            LblSaveStatus.Text = "";

            //Clears session data from servicerequest
            Session["ServiceRequestID"] = null;
            Session["ServiceTicketID"] = null;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Changes chkbox boolean into a 1 or 0 for inserting into db
                int completed;
            if (ChkBoxCompleted.Checked)
            {
                completed = 1;
            }
            else { completed = 0; }
            String sqlQuery = "";
            if (Session["ServiceTicketID"] != null)
            {


                //Different Updates for Move or Auction
                if (DdlServiceType.SelectedValue == "Move")
                {
                    //Concatenate Sql Query Update Statements
                    sqlQuery = "UPDATE ServiceTicket SET CustomerID = @CustomerID, TicketStatus = @TicketStatus, ServiceDate = @ServiceDate, ServiceCost = @ServiceCost, CompletionDate = @CompletionDate, ServiceType = @ServiceType, DestinationTime = @DestinationTime, GasExpense = @GasExpense, MiscExpense = @MiscExpense, ContactID = null, InitiatingEmp = @InitiatingEmp, AuctionID = null, Completed = " + completed + " WHERE ServiceTicketID = " + Session["ServiceTicketID"].ToString();
                    
                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;
                    
                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@TicketStatus", HttpUtility.HtmlEncode(TxtTicketStatus.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceCost", HttpUtility.HtmlEncode(TxtServiceCost.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationTime", HttpUtility.HtmlEncode(TxtDestinationTime.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@GasExpense", HttpUtility.HtmlEncode(TxtGasExpense.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@MiscExpense", HttpUtility.HtmlEncode(TxtMiscExpense.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitiatingEmp", DdlInitiatingEmp.SelectedValue));

                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Move Updated Successfully";
                    LblSaveStatus.ForeColor = Color.Green;

                }
                else if (DdlServiceType.SelectedValue == "Auction")
                {
                    //Concatenate Sql Query Update Statements
                    sqlQuery = "UPDATE ServiceTicket SET CustomerID = @CustomerID, TicketStatus = @TicketStatus, ServiceDate = @ServiceDate, ServiceCost = @ServiceCost, CompletionDate = @CompletionDate, ServiceType = @ServiceType, DestinationTime = '', GasExpense = 0, MiscExpense = 0, ContactID = @ContactID, InitiatingEmp = @InitiatingEmp, AuctionID = 1, Completed = " + completed + " WHERE ServiceTicketID = " + Session["ServiceTicketID"].ToString();
                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@TicketStatus", HttpUtility.HtmlEncode(TxtTicketStatus.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceCost", HttpUtility.HtmlEncode(TxtServiceCost.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@ContactID", DdlEmployeeContact.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitiatingEmp", DdlInitiatingEmp.SelectedValue));


                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Auction Updated Successfully";
                    LblSaveStatus.ForeColor = Color.Green;
                }



            }
            else
            {

                //Different inserts for Move or Auction
                if (DdlServiceType.SelectedValue == "Move")
                {
                    //Concatenate Sql Query Insert Statements
                    sqlQuery = "insert into ServiceTicket values (";
                    sqlQuery += "@CustomerID, @TicketStatus, '" + System.DateTime.Today.ToString("yyyy-MM-dd") + "', @ServiceDate, @ServiceCost, @CompletionDate, @ServiceType, ";
                    sqlQuery += "@DestinationTime, @GasExpense, @MiscExpense, null, @InitiatingEmp, null, " + completed + ")";

                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@TicketStatus", HttpUtility.HtmlEncode(TxtTicketStatus.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceCost", HttpUtility.HtmlEncode(TxtServiceCost.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationTime", HttpUtility.HtmlEncode(TxtDestinationTime.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@GasExpense", HttpUtility.HtmlEncode(TxtGasExpense.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@MiscExpense", HttpUtility.HtmlEncode(TxtMiscExpense.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitiatingEmp", DdlInitiatingEmp.SelectedValue));

                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Move Saved Successfully";
                    LblSaveStatus.ForeColor = Color.Green;
                }
                else if (DdlServiceType.SelectedValue == "Auction")
                {
                    //Concatenate Sql Query Insert Statements
                    sqlQuery = "insert into ServiceTicket values (";
                    sqlQuery += "@CustomerID, @TicketStatus, '" + System.DateTime.Today.ToString("yyyy-MM-dd") + "', @ServiceDate, @ServiceCost, @CompletionDate, @ServiceType, ";
                    sqlQuery += "'', '', '', @ContactID, @InitiatingEmp, 1, " + completed + ")";

                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@TicketStatus", HttpUtility.HtmlEncode(TxtTicketStatus.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceCost", HttpUtility.HtmlEncode(HttpUtility.HtmlEncode(TxtServiceCost.Text))));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@ContactID", DdlEmployeeContact.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitiatingEmp", DdlInitiatingEmp.SelectedValue));

                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Auction Saved Successfully";
                    LblSaveStatus.ForeColor = Color.Green;
                }

                //Sets service request to completed, once serviceticket is sucessfully saved
                if (Session["ServiceRequestID"] != null)
                {
                    sqlQuery = "UPDATE ServiceRequest SET RequestStatus = 1 where ServiceRequestID = " + Session["ServiceRequestID"].ToString();

                    //Define the Connection to the Database
                    SqlConnection sqlConnectServiceRequest = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommandServiceRequest = new SqlCommand();
                    sqlCommandServiceRequest.Connection = sqlConnectServiceRequest;
                    sqlCommandServiceRequest.CommandType = CommandType.Text;
                    sqlCommandServiceRequest.CommandText = sqlQuery;

                    // Open your connection, send the query 
                    sqlConnectServiceRequest.Open();
                    SqlDataReader queryResultsServiceRequest = sqlCommandServiceRequest.ExecuteReader();

                    // Close all related connections
                    queryResultsServiceRequest.Close();
                    sqlConnectServiceRequest.Close();

                }


            }
            }
            catch
            {
                LblSaveStatus.Text = "Error Saving Service, Check Data Fields";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }

        protected void DdlInitiatingEmp_DataBound(object sender, EventArgs e)
        {
            //Sets drop down list to default Select option
            DdlInitiatingEmp.Items.Insert(0, new ListItem("Select", "-1"));
        }
        protected void ChkBoxLookAt_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxLookAt.Checked)
            {
                TxtLookAtSchedule.Visible = true;
                TxtLookatScheduleTime.Visible = true;
            }
            else
            {
                TxtLookAtSchedule.Visible = false;
                TxtLookatScheduleTime.Visible = false;
            }
        }
    }
}
