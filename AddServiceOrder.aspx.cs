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
          
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;


                //Hides rfv fields on load
                RfvDestinationTime.Visible = false;


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
                    TxtServiceDate.Text = Convert.ToString(dtForSelect.Rows[0]["ServiceDate"]);
                    TxtCompletionDate.Text = Convert.ToString(dtForSelect.Rows[0]["CompletionDate"]);
                    DdlServiceType.SelectedValue = DdlServiceType.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["ServiceType"]).Trim()).Value;
                    DdlServiceType_SelectedIndexChanged(sender, e);
                    TxtDestinationTime.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationTime"]);




                }
                //If the user is trying to edit a customer, there will be a customerid in this session data
                if (Session["Customer ID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from customer where customerid = " + Session["Customer ID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    //Fills data from editing customer's sql record into InitialConversation page
                    ddlCustomerList.SelectedValue = Convert.ToString(Session["Customer ID"]);
                    //TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
                    TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                    TxtCellPhone.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                    TxtWorkPhone.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                    TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);
                }
                if (Session["ServiceTicketID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from customer join serviceticket on customer.customerID = serviceticket.customerID where serviceticketID = " + Session["ServiceTicketID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    String custID = dtForSelect.Rows[0]["CustomerID"].ToString();

                    //Fills data from editing customer's sql record into InitialConversation page
                    ddlCustomerList.SelectedValue = custID;
                    //TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
                    TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                    TxtCellPhone.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                    TxtWorkPhone.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                    TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);
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
           
            TxtServiceDate.Text = "2021-08-05";
            TxtCompletionDate.Text = "2021-09-07";
      
            DdlServiceType.SelectedIndex = 1;
            TxtDestinationTime.Text = "9:00am";
   

            //Reloads data to show Move fields
            DdlServiceType_SelectedIndexChanged(sender, e);


        }

        protected void ddlCustomerList_DataBound(object sender, EventArgs e)
        {
            //Sets drop down list to default Select option
            ddlCustomerList.Items.Insert(0, new ListItem("Select", "-1"));
        }




        protected void DdlServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlServiceType.SelectedValue == "Move")
            {
                


                //Show Move Fields
                LblDestinationTime.Visible = true;
                TxtDestinationTime.Visible = true;
            

                //Show move rfv fields
                RfvDestinationTime.Visible = true;
             



            }
            else if (DdlServiceType.SelectedValue == "Auction")
            {
                //hides move fields
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;
  

                //hides rfv fields
                RfvDestinationTime.Visible = false;
              
            }
            else
            {

                //Hides fields if no choice selected
           
                LblDestinationTime.Visible = false;
                TxtDestinationTime.Visible = false;
            

                //Hides all rfv
                RfvDestinationTime.Visible = false;
     


            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //Clears all data on webform
            TxtPotentialDate.Text = "";
            TxtPotentialTime.Text = "";
            DdlInitiatingEmp.SelectedIndex = -1;
            ddlCustomerList.SelectedIndex = -1;
            TxtPhoneNumber.Text = "";
            TxtCellPhone.Text = "";
            TxtWorkPhone.Text = "";
            TxtEmail.Text = "";
            TxtStreet.Text = "";
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtZip.Text = "";
            TxtDescription.Text = "";
            ChkBoxLookAt.Checked = false;
            TxtLookAtSchedule.Text = "";
            TxtLookatScheduleTime.Text = "";
            TxtServiceDate.Text = "";
            TxtCompletionDate.Text = "";
            DdlServiceType.SelectedIndex = -1;
            TxtDestinationTime.Text = "";
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
            //try
            //{
               
            String sqlQuery = "";
            if (Session["ServiceTicketID"] != null)
            {


                //Different Updates for Move or Auction
                if (DdlServiceType.SelectedValue == "Move")
                {
                    //Concatenate Sql Query Update Statements
                    sqlQuery = "UPDATE ServiceTicket SET CustomerID = @CustomerID, TicketStatus = @TicketStatus, ServiceDate = @ServiceDate, ServiceCost = @ServiceCost, CompletionDate = @CompletionDate, ServiceType = @ServiceType, DestinationTime = @DestinationTime, GasExpense = @GasExpense, MiscExpense = @MiscExpense, ContactID = null, InitiatingEmp = @InitiatingEmp, AuctionID = null, Completed = "   + " WHERE ServiceTicketID = " + Session["ServiceTicketID"].ToString();
                    
                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;
                    
                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationTime", HttpUtility.HtmlEncode(TxtDestinationTime.Text)));
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
                    sqlQuery = "UPDATE ServiceTicket SET CustomerID = @CustomerID, TicketStatus = @TicketStatus, ServiceDate = @ServiceDate, ServiceCost = @ServiceCost, CompletionDate = @CompletionDate, ServiceType = @ServiceType, DestinationTime = '', GasExpense = 0, MiscExpense = 0, ContactID = @ContactID, InitiatingEmp = @InitiatingEmp, AuctionID = 1, Completed = " + " WHERE ServiceTicketID = " + Session["ServiceTicketID"].ToString();
                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
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
                    //Inserts service order
                    sqlQuery = "insert into ServiceTicket values (@CustomerID, '" + System.DateTime.Today.ToString("yyyy-MM-dd") + "', @PotentialDate, @PotentialTime, @ServiceDate,  @CompletionDate, @ServiceType, @DestinationTime,@LookAtCB,@LookAtDate,@LookAtTime,@InitiatingEmp, 1, 25, @StorageCB, @CleaningCB, @TrashCB , @Completed)";

                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;

                    //Parameterizes all the strings
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@PotentialDate", HttpUtility.HtmlEncode(TxtPotentialDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@PotentialTime", HttpUtility.HtmlEncode(TxtPotentialTime.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceDate", HttpUtility.HtmlEncode(TxtServiceDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletionDate", HttpUtility.HtmlEncode(TxtCompletionDate.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@ServiceType", DdlServiceType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationTime", HttpUtility.HtmlEncode(TxtDestinationTime.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@LookAtCB", ChkBoxLookAt.Checked.ToString()));
                    sqlCommand.Parameters.Add(new SqlParameter("@LookAtDate", HttpUtility.HtmlEncode(TxtLookAtSchedule.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@LookAtTime", HttpUtility.HtmlEncode(TxtLookatScheduleTime.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitiatingEmp", DdlInitiatingEmp.SelectedValue));
                    sqlCommand.Parameters.Add(new SqlParameter("@CleaningCB", ChkBxCleaning.Checked.ToString()));
                    sqlCommand.Parameters.Add(new SqlParameter("@StorageCB", ChkBxStorage.Checked.ToString()));
                    sqlCommand.Parameters.Add(new SqlParameter("@TrashCB", ChkBxTrashRemoval.Checked.ToString()));
                    sqlCommand.Parameters.Add(new SqlParameter("@Completed", ChkBoxCompleted.Checked.ToString()));



                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Service Order Saved Successfully";
                    LblSaveStatus.ForeColor = Color.Green;

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
            //}
            //catch
            //{
            //    LblSaveStatus.Text = "Error Saving Service, Check Data Fields";
            //    LblSaveStatus.ForeColor = Color.Red;
            //}
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

        protected void ddlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Clear

            //Pulling in customer's record
            String sqlQuery = "Select * from customer where customerid = " + ddlCustomerList.SelectedValue.ToString();

            //Establishes the connection between our web form and database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            //This creates a datatable and fills it
            DataTable dtForSelect = new DataTable();
            sqlAdapter.Fill(dtForSelect);

            //TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
            TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
            TxtCellPhone.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
            TxtWorkPhone.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
            TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);
        }

        protected void BtnAddAddress_Click(object sender, EventArgs e)
        {
            //Concatenate Sql Query Update Statements
            String sqlQuery = "Insert into address values (null, @CustomerID, @Street, @City, @State, @Zip, @Description)";

            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            //Parameterizes all the strings
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", ddlCustomerList.SelectedValue));
            sqlCommand.Parameters.Add(new SqlParameter("@Street", HttpUtility.HtmlEncode(TxtStreet.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@City", HttpUtility.HtmlEncode(TxtCity.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@State", HttpUtility.HtmlEncode(TxtState.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Zip", HttpUtility.HtmlEncode(TxtZip.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(TxtDescription.Text)));

            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
            GridAddress.DataBind();

            //Clears textboxes
            TxtStreet.Text = "";
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtZip.Text = "";
            TxtDescription.Text = "";



        }
    }
}
