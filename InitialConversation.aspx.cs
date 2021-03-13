﻿//Coded By:Stuart Walker & Aaron Walsh
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
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                
                //Creates items for Initial Contact ddl
                DdlInitialContact.Items.Add(new ListItem("Select", "-1"));
                DdlInitialContact.Items.Add(new ListItem("In-Person", "0"));
                DdlInitialContact.Items.Add(new ListItem("By Phone", "1"));
                DdlInitialContact.Items.Add(new ListItem("Email", "2"));
                DdlInitialContact.Items.Add(new ListItem("Text", "3"));
                DdlInitialContact.Items.Add(new ListItem("Other", "4"));

                //Hides required fields at first
                LblOther.Visible = false;
                TxtOther.Visible = false;

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

                    //Fills data from editing customer's sql record into addcustomer page
                    TxtFirstName.Text = Convert.ToString(dtForSelect.Rows[0]["FirstName"]);
                    TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
                    TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["Phone"]);
                    TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);

                    //TxtDestinationStreet.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationStreet"]);
                    //TxtDestinationCity.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationCity"]);
                    //TxtDestinationState.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationState"]);

                    //Array of possible mediums for intial contact
                    string[] arrayInitialContact = new string[] { "In-Person", "By Phone", "Email", "Text" };

                    //Checks to see if item is in the dropdown list items from array
                    if (arrayInitialContact.Contains(Convert.ToString(dtForSelect.Rows[0]["InitialContact"])))
                    {
                        DdlInitialContact.SelectedValue = DdlInitialContact.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["InitialContact"])).Value;
                        DdlInitialContact_SelectedIndexChanged(sender, e);
                    }
                    //Checks to see if it is other since it is not in the array and is not blank (i.e. Carrier Pigeon)
                    else if (Convert.ToString(dtForSelect.Rows[0]["InitialContact"]) != "")
                    {
                        DdlInitialContact.SelectedValue = "4";
                        TxtOther.Text = Convert.ToString(dtForSelect.Rows[0]["InitialContact"]);
                        DdlInitialContact_SelectedIndexChanged(sender, e);
                    }

                    TxtReferral.Text = Convert.ToString(dtForSelect.Rows[0]["ReferralChannel"]);
                    TxtDeadline.Text = Convert.ToString(dtForSelect.Rows[0]["DeadlineStart"]);
                    TxtDeadlineEnd.Text = Convert.ToString(dtForSelect.Rows[0]["DeadlineEnd"]);

                }
            }
        }



        //Navigates to ViewCustomer Web form after button is clicked
        protected void BtnViewCustomerPage_Click(object sender, EventArgs e)
        {
            Session["Customer ID"] = null;
            Response.Redirect("ViewCustomer.aspx");
        }

        //Autofills all textboxes with test data once button is clicked
        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            //Show Text Boxes Again
            LblOther.Visible = true;
            TxtOther.Visible = true;

            //Populates fields for testing
            TxtFirstName.Text = "Jake";
            TxtLastName.Text = "Robert";
            TxtPhoneNumber.Text = "7037284871";
            TxtEmail.Text = "jake@dukes.com";

            //TxtDestinationStreet.Text = "531 New Port Rd";
            //TxtDestinationCity.Text = "Harrisonburg";
            //TxtDestinationState.Text = "VA";
            DdlInitialContact.SelectedIndex = 5;
            TxtOther.Text = "Carrier Pidgeon";
            TxtReferral.Text = "Poster";
            TxtDeadline.Text = "2021-02-01";
            TxtDeadlineEnd.Text = "2021-02-28";


        }

        //Clears all textboxes once button is clicked
        protected void BtnClear_Click(object sender, EventArgs e)
        {

            TxtFirstName.Text = "";
            TxtLastName.Text = "";
            TxtPhoneNumber.Text = "";
            TxtEmail.Text = "";
            //TxtDestinationStreet.Text = "";
            //TxtDestinationCity.Text = "";
            //TxtDestinationState.Text = "";
            DdlInitialContact.SelectedIndex = -1;
            TxtOther.Text = "";
            TxtReferral.Text = "";
            TxtDeadline.Text = "";
            TxtDeadlineEnd.Text = "";

            LblSaveStatus.Text = "";

            //Hide Text Boxes Again
            LblOther.Visible = false;
            TxtOther.Visible = false;
            ChkBoxCompleted.Checked = false;

            //Stops the edit function
            Session["Customer ID"] = null;



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
                if (Session["Customer ID"] != null)
                {
                    //Gets 'other' field if selected for initial contact
                    String initialContact;
                    if (DdlInitialContact.SelectedIndex == 5)
                    {
                        initialContact = HttpUtility.HtmlEncode(TxtOther.Text);
                    }
                    else
                    {
                        initialContact = DdlInitialContact.SelectedItem.Text;
                    }

                                                                                                                                                                                                                                                                                                                                                                                          
                    //Concatenate Sql Query Update Statement
                    String sqlQuery = "UPDATE CUSTOMER SET FirstName = @FirstName, LastName = @LastName, Phone = @PhoneNumber, PhoneType = @PhoneType, Email = @Email, InterestedIn = @InterestedIn, OriginStreet = @OriginStreet, OriginCity = @OriginCity, OriginState = @OriginState, DestinationStreet = @DestinationStreet, DestinationCity = @DestinationCity, DestinationState = @DestinationState, InitialContact = @InitialContact, ReferralChannel = @ReferralChannel, TotalEarnings = @TotalEarnings, DateContacted = '" + System.DateTime.Now.Date.ToString("yyyy-MM-dd") + "', DeadlineStart = @DeadlineStart, DeadlineEnd = @DeadlineEnd, completed = " + completed + " WHERE customerid = " + Session["Customer ID"].ToString();

                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;
                    
                    //Parameterizes all strings
                    sqlCommand.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(TxtFirstName.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(TxtLastName.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@PhoneNumber", HttpUtility.HtmlEncode(TxtPhoneNumber.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));

                    //sqlCommand.Parameters.Add(new SqlParameter("@DestinationStreet", HttpUtility.HtmlEncode(TxtDestinationStreet.Text)));
                    //sqlCommand.Parameters.Add(new SqlParameter("@DestinationCity", HttpUtility.HtmlEncode(TxtDestinationCity.Text)));
                    //sqlCommand.Parameters.Add(new SqlParameter("@DestinationState", HttpUtility.HtmlEncode(TxtDestinationState.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitialContact", DdlInitialContact.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DeadlineStart", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DeadlineEnd", HttpUtility.HtmlEncode(TxtDeadlineEnd.Text)));


                    // Open your connection, send the query 
                    sqlConnect.Open();
                    SqlDataReader queryResults = sqlCommand.ExecuteReader();

                    // Close all related connections
                    queryResults.Close();
                    sqlConnect.Close();

                    LblSaveStatus.Text = "Customer Updated Successfully";
                    LblSaveStatus.ForeColor = Color.Green;



                }
                else
                {
                    //Check to see if customer is already in the database
                    String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name' from customer WHERE Email = @Email";



                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //Creates sqlcommand with query and email parameter for security
                    SqlCommand sqlCommandInsert = new SqlCommand();
                    sqlCommandInsert.Connection = sqlConnectDuplicate;
                    sqlCommandInsert.CommandType = CommandType.Text;
                    sqlCommandInsert.CommandText = sqlQueryDuplicate;

                    sqlCommandInsert.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));


                    SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

                    //This creates a datatable and fills it
                    DataTable dtForDuplicate = new DataTable();
                    sqlAdapterDuplicate.Fill(dtForDuplicate);


                    if (dtForDuplicate.Rows.Count > 0)
                    {
                        //If any rows come back from the query
                        LblSaveStatus.Text = "Customer with that email already exists!";
                        LblSaveStatus.ForeColor = Color.Red;
                    }
                    else
                    {
                        //Gets other field if selected for initial contact
                        String initialContact;
                        if (DdlInitialContact.SelectedIndex == 5)
                        {
                            initialContact = TxtOther.Text;
                        }
                        else
                        {
                            initialContact = DdlInitialContact.SelectedItem.Text;
                        }
                        //Concatenate Sql Query Insert Statements
                        String sqlQuery = "insert into CUSTOMER values (@FirstName, @LastName, @CellPhone, @WorkPhone, @HomePhone, @Email, @HowMany, @Descriptions, @Downsizing," +
                            " @Estate, @MovingCB, @AuctionCB, @ConsignmentCB, @AppraisalCB, @ItemTransport, @InitialContact, @ReferralChannel, " +System.DateTime.Today.ToShortDateString()+",  @Deadline, @DeadlineEnd, @CompletedBy, @CustomerNotes, @Completed";
                        //Define the Connection to the Database
                        SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                        // Create the SQL Command object which will send the query
                        SqlCommand sqlCommand = new SqlCommand();
                        sqlCommand.Connection = sqlConnect;
                        sqlCommand.CommandType = CommandType.Text;
                        sqlCommand.CommandText = sqlQuery;
                        sqlCommand.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(TxtFirstName.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(TxtLastName.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@HomePhone", HttpUtility.HtmlEncode(TxtPhoneNumber.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@CellPhone", HttpUtility.HtmlEncode(TxtCellPhone.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@WorkPhone", HttpUtility.HtmlEncode(TxtWorkPhone.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@HowMany", HttpUtility.HtmlEncode(TxtHowMany.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@Descriptions", HttpUtility.HtmlEncode(TxtDescriptions.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@Downsizing", ChkBoxDownsizing.Checked.ToString()));
                        sqlCommand.Parameters.Add(new SqlParameter("@Estate", ChkBoxEstate.Checked.ToString()));
                        sqlCommand.Parameters.Add(new SqlParameter("@MovingCB", ChkBoxMove.Checked.ToString()));
                        sqlCommand.Parameters.Add(new SqlParameter("@AuctionCB", ChkBoxAuction.Checked.ToString()));
                        sqlCommand.Parameters.Add(new SqlParameter("@ConsignmentCB", ChkBoxConsignment.Checked.ToString()));
                        sqlCommand.Parameters.Add(new SqlParameter("@AppraisalCB", ChkBoxAppraisal.Checked.ToString()));
         
                        sqlCommand.Parameters.Add(new SqlParameter("@ItemTransport", DdlItemTransport.SelectedItem.Text));
                        sqlCommand.Parameters.Add(new SqlParameter("@InitialContact", initialContact));
                        sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DeadlineStart", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DeadlineEnd", HttpUtility.HtmlEncode(TxtDeadlineEnd.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@CompletedBy", DdlCompletedByEmp.SelectedItem.Text));
                        sqlCommand.Parameters.Add(new SqlParameter("@CustomerNotes", HttpUtility.HtmlEncode(TxtCustomerNotes.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@Completed", ChkBoxCompleted.Checked.ToString()));

                        // Open your connection, send the query 
                        sqlConnect.Open();
                        SqlDataReader queryResults = sqlCommand.ExecuteReader();

                        // Close all related connections
                        queryResults.Close();
                        sqlConnect.Close();

                        LblSaveStatus.Text = "Customer Added Successfully";
                        LblSaveStatus.ForeColor = Color.Green;

                    }

                }
            }
            catch
            {
                LblSaveStatus.Text = "Error Saving Customer, Check Data Fields";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }




        protected void DdlInitialContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlInitialContact.SelectedValue == "4")
            {
                LblOther.Visible = true;
                TxtOther.Visible = true;
            }
            else
            {
                LblOther.Visible = false;
                TxtOther.Visible = false;
                TxtOther.Text = "";
            }
        }

   


        protected void ChkBoxAuction_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxAuction.Checked)
            {
                
                LblHowMany.Visible = true;
                LblDescriptions.Visible = true;
                TxtHowMany.Visible = true;
                TxtDescriptions.Visible = true;
            }
            else
            {
                LblHowMany.Visible = false;
                LblDescriptions.Visible = false;
                TxtHowMany.Visible = false;
                TxtDescriptions.Visible = false;
            }
        }

        

        protected void BtnProceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddService.aspx");
        }

        protected void DdlCompletedByEmp_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "Select");
            DdlCompletedByEmp.Items.Insert(0, blankOption);
            DdlCompletedByEmp.SelectedIndex = 0;
        }

        protected void ChkBoxMove_CheckedChanged(object sender, EventArgs e)
        {

        }

    }
}