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

namespace WalkerS_Lab1Part3
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Creates items for Phone type ddl
                DdlPhoneType.Items.Add(new ListItem("Select", "-1"));
                DdlPhoneType.Items.Add(new ListItem("Cell", "0"));
                DdlPhoneType.Items.Add(new ListItem("Home", "1"));
                DdlPhoneType.Items.Add(new ListItem("Work", "2"));
                DdlPhoneType.Items.Add(new ListItem("Other", "3"));


                //Creates items for Interested In ddl
                DdlInterestedIn.Items.Add(new ListItem("Select", "-1"));
                DdlInterestedIn.Items.Add(new ListItem("Auction", "0"));
                DdlInterestedIn.Items.Add(new ListItem("Move", "1"));
                DdlInterestedIn.Items.Add(new ListItem("Both", "2"));

                //Creates items for Initial Contact ddl
                DdlInitialContact.Items.Add(new ListItem("Select", "-1"));
                DdlInitialContact.Items.Add(new ListItem("In-Person", "0"));
                DdlInitialContact.Items.Add(new ListItem("By Phone", "1"));
                DdlInitialContact.Items.Add(new ListItem("Email", "2"));
                DdlInitialContact.Items.Add(new ListItem("Text", "3"));
                DdlInitialContact.Items.Add(new ListItem("Other", "4"));

                //Hides required fields at first
                LblDestinationStreet.Visible = false;
                TxtDestinationStreet.Visible = false;
                LblDestinationCity.Visible = false;
                TxtDestinationCity.Visible = false;
                LblDestinationState.Visible = false;
                TxtDestinationState.Visible = false;
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
                    DdlPhoneType.SelectedValue = DdlPhoneType.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["PhoneType"])).Value;
                    TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);
                    if (Convert.ToString(dtForSelect.Rows[0]["InterestedIn"]) != "")
                    {
                        DdlInterestedIn.SelectedValue = DdlInterestedIn.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["InterestedIn"])).Value;
                        DdlInterestedIn_SelectedIndexChanged(sender, e);
                    }
                    TxtOriginStreet.Text = Convert.ToString(dtForSelect.Rows[0]["OriginStreet"]);
                    TxtOriginCity.Text = Convert.ToString(dtForSelect.Rows[0]["OriginCity"]);
                    TxtOriginState.Text = Convert.ToString(dtForSelect.Rows[0]["OriginState"]);
                    TxtDestinationStreet.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationStreet"]);
                    TxtDestinationCity.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationCity"]);
                    TxtDestinationState.Text = Convert.ToString(dtForSelect.Rows[0]["DestinationState"]);

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
                    TxtTotalEarnings.Text = Convert.ToString(dtForSelect.Rows[0]["TotalEarnings"]);
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
            LblDestinationStreet.Visible = true;
            TxtDestinationStreet.Visible = true;
            LblDestinationCity.Visible = true;
            TxtDestinationCity.Visible = true;
            LblDestinationState.Visible = true;
            TxtDestinationState.Visible = true;
            LblOther.Visible = true;
            TxtOther.Visible = true;

            //Populates fields for testing
            TxtFirstName.Text = "Jake";
            TxtLastName.Text = "Robert";
            TxtPhoneNumber.Text = "7037284871";
            DdlPhoneType.SelectedIndex = 1;
            TxtEmail.Text = "jake@dukes.com";
            DdlInterestedIn.SelectedIndex = 2;
            TxtOriginStreet.Text = "123 Port Street";
            TxtOriginCity.Text = "Harrisonburg";
            TxtOriginState.Text = "VA";
            TxtDestinationStreet.Text = "531 New Port Rd";
            TxtDestinationCity.Text = "Harrisonburg";
            TxtDestinationState.Text = "VA";
            DdlInitialContact.SelectedIndex = 5;
            TxtOther.Text = "Carrier Pidgeon";
            TxtReferral.Text = "Poster";
            TxtTotalEarnings.Text = "0";
            TxtDeadline.Text = "2021-02-01";
            TxtDeadlineEnd.Text = "2021-02-28";


        }

        //Clears all textboxes once button is clicked
        protected void BtnClear_Click(object sender, EventArgs e)
        {

            TxtFirstName.Text = "";
            TxtLastName.Text = "";
            TxtPhoneNumber.Text = "";
            DdlPhoneType.SelectedIndex = -1;
            TxtEmail.Text = "";
            DdlInterestedIn.SelectedIndex = -1;
            TxtOriginStreet.Text = "";
            TxtOriginCity.Text = "";
            TxtOriginState.Text = "";
            TxtDestinationStreet.Text = "";
            TxtDestinationCity.Text = "";
            TxtDestinationState.Text = "";
            DdlInitialContact.SelectedIndex = -1;
            TxtOther.Text = "";
            TxtReferral.Text = "";
            TxtTotalEarnings.Text = "";
            TxtDeadline.Text = "";
            TxtDeadlineEnd.Text = "";

            LblSaveStatus.Text = "";

            //Hide Text Boxes Again
            LblDestinationStreet.Visible = false;
            TxtDestinationStreet.Visible = false;
            LblDestinationCity.Visible = false;
            TxtDestinationCity.Visible = false;
            LblDestinationState.Visible = false;
            TxtDestinationState.Visible = false;
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
                    sqlCommand.Parameters.Add(new SqlParameter("@PhoneType", DdlPhoneType.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InterestedIn", DdlInterestedIn.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@OriginStreet", HttpUtility.HtmlEncode(TxtOriginStreet.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@OriginCity", HttpUtility.HtmlEncode(TxtOriginCity.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@OriginState", HttpUtility.HtmlEncode(TxtOriginState.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationStreet", HttpUtility.HtmlEncode(TxtDestinationStreet.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationCity", HttpUtility.HtmlEncode(TxtDestinationCity.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DestinationState", HttpUtility.HtmlEncode(TxtDestinationState.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@InitialContact", DdlInitialContact.SelectedItem.Text));
                    sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@TotalEarnings", HttpUtility.HtmlEncode(TxtTotalEarnings.Text)));
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
                        String sqlQuery = "insert into CUSTOMER values (@FirstName, @LastName, @PhoneNumber, @PhoneType, @Email, @InterestedIn, @OriginStreet, @OriginCity, @OriginState,";
                        sqlQuery += "@DestinationStreet, @DestinationCity, @DestinationState, @InitialContact, @ReferralChannel, @TotalEarnings, '" + System.DateTime.Now.Date.ToString("yyyy-MM-dd") + "', @DeadlineStart, @DeadlineEnd, 0)";

                        //Define the Connection to the Database
                        SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                        // Create the SQL Command object which will send the query
                        SqlCommand sqlCommand = new SqlCommand();
                        sqlCommand.Connection = sqlConnect;
                        sqlCommand.CommandType = CommandType.Text;
                        sqlCommand.CommandText = sqlQuery;
                        sqlCommand.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(TxtFirstName.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(TxtLastName.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@PhoneNumber", HttpUtility.HtmlEncode(TxtPhoneNumber.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@PhoneType", DdlPhoneType.SelectedItem.Text));
                        sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@InterestedIn", DdlInterestedIn.SelectedItem.Text));
                        sqlCommand.Parameters.Add(new SqlParameter("@OriginStreet", HttpUtility.HtmlEncode(TxtOriginStreet.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@OriginCity", HttpUtility.HtmlEncode(TxtOriginCity.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@OriginState", HttpUtility.HtmlEncode(TxtOriginState.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DestinationStreet", HttpUtility.HtmlEncode(TxtDestinationStreet.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DestinationCity", HttpUtility.HtmlEncode(TxtDestinationCity.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DestinationState", HttpUtility.HtmlEncode(TxtDestinationState.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@InitialContact", DdlInitialContact.SelectedItem.Text));
                        sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@TotalEarnings", HttpUtility.HtmlEncode(TxtTotalEarnings.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DeadlineStart", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                        sqlCommand.Parameters.Add(new SqlParameter("@DeadlineEnd", HttpUtility.HtmlEncode(TxtDeadlineEnd.Text)));

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

        protected void DdlInterestedIn_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlInterestedIn.SelectedValue == "0" || DdlInterestedIn.SelectedValue == "-1")
            {
                LblDestinationStreet.Visible = false;
                TxtDestinationStreet.Visible = false;
                LblDestinationCity.Visible = false;
                TxtDestinationCity.Visible = false;
                LblDestinationState.Visible = false;
                TxtDestinationState.Visible = false;

                TxtDestinationStreet.Text = "";
                TxtDestinationCity.Text = "";
                TxtDestinationState.Text = "";
            }
            else
            {
                LblDestinationStreet.Visible = true;
                TxtDestinationStreet.Visible = true;
                LblDestinationCity.Visible = true;
                TxtDestinationCity.Visible = true;
                LblDestinationState.Visible = true;
                TxtDestinationState.Visible = true;
            }
        }

        protected void ChkBoxMove_CheckedChanged(object sender, EventArgs e)
        {
            
            if (ChkBoxMove.Checked)
            {
                LblDestinationStreet.Visible = true;
                TxtDestinationStreet.Visible = true;
                LblDestinationCity.Visible = true;
                TxtDestinationCity.Visible = true;
                LblDestinationState.Visible = true;
                TxtDestinationState.Visible = true;



            }
            else
            {
                LblDestinationStreet.Visible = false;
                TxtDestinationStreet.Visible = false;
                LblDestinationCity.Visible = false;
                TxtDestinationCity.Visible = false;
                LblDestinationState.Visible = false;
                TxtDestinationState.Visible = false;

                TxtDestinationStreet.Text = "";
                TxtDestinationCity.Text = "";
                TxtDestinationState.Text = "";
            }
        }

        protected void ChkBoxAuction_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxAuction.Checked)
            {
                
                ChkBoxLookAt.Visible = true;
            }
            else
            {
                ChkBoxLookAt.Visible = false;

            }
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