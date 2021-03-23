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
using System.Net;
using System.Net.Mail;

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
                    SqlConnection sqlConnect = new SqlConnection("Server= aa134xzc8c5axs3, 1433;Database=Capstone;uid=admin;Password=Tobyman98!;Trusted_Connection=Yes;Integrated Security = False;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    //Fills data from editing customer's sql record into InitialConversation page
                    TxtFirstName.Text = Convert.ToString(dtForSelect.Rows[0]["FirstName"]);
                    TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
                    TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                    TxtCellPhone.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                    TxtWorkPhone.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                    TxtEmail.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);
                    TxtHowMany.Text = Convert.ToString(dtForSelect.Rows[0]["ItemsForSale"]);
                    TxtDescriptions.Text = Convert.ToString(dtForSelect.Rows[0]["WhatDoYouSell"]);
                    ChkBoxDownsizing.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["Downsizing"]);
                    ChkBoxEstate.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["SettlingEstate"]);
                    ChkBoxMove.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["MovingCB"]);
                    ChkBoxAuction.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["AuctionCB"]);
                    ChkBoxConsignment.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["ConsignmentCB"]);
                    ChkBoxAppraisal.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["AppraisalCb"]);

                    string[] arrayTransport = new string[] { "We Pick-Up Your Item(s)", "You Drop-Off Your Item(s)", "Unsure"};
                    if (arrayTransport.Contains(Convert.ToString(dtForSelect.Rows[0]["ItemTransportation"])))
                    {
                        DdlItemTransport.SelectedValue = DdlItemTransport.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["ItemTransportation"])).Value;
                  
                    }

                    //Array of possible mediums for intial contact
                    string[] arrayInitialContact = new string[] { "In-Person", "By Phone", "Email", "Text" };

                    //Checks to see if item is in the dropdown list items from array
                    if (arrayInitialContact.Contains(Convert.ToString(dtForSelect.Rows[0]["PreferredContact"])))
                    {
                        DdlInitialContact.SelectedValue = DdlInitialContact.Items.FindByText(Convert.ToString(dtForSelect.Rows[0]["PreferredContact"])).Value;
                        DdlInitialContact_SelectedIndexChanged(sender, e);
                    }
                    //Checks to see if it is other since it is not in the array and is not blank (i.e. Carrier Pigeon)
                    else if (Convert.ToString(dtForSelect.Rows[0]["PreferredContact"]) != "")
                    {
                        DdlInitialContact.SelectedValue = "4";
                        TxtOther.Text = Convert.ToString(dtForSelect.Rows[0]["PreferredContact"]);
                        DdlInitialContact_SelectedIndexChanged(sender, e);
                    }

                    TxtReferral.Text = Convert.ToString(dtForSelect.Rows[0]["ReferralChannel"]);
                    TxtDeadline.Text = Convert.ToString(dtForSelect.Rows[0]["DeadlineStart"]);
                    TxtDeadlineEnd.Text = Convert.ToString(dtForSelect.Rows[0]["DeadlineEnd"]);
                    if (dtForSelect.Rows[0]["CompletedByEmp"] != DBNull.Value)
                    {
                        DdlCompletedByEmp.SelectedValue =  Convert.ToString(dtForSelect.Rows[0]["CompletedByEmp"]);
                    } 
                    TxtCustomerNotes.Text = Convert.ToString(dtForSelect.Rows[0]["CustomerNotes"]);
                    ChkBoxCompleted.Checked = Convert.ToBoolean(dtForSelect.Rows[0]["Completed"]);

                    //Fill Primary Address
                    //Pulling in customer's record
                    String sqlQueryAddress = "Select * from address where description = 'Primary Contact Address' AND customerid = " + Session["Customer ID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnectAddress = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapterAddress = new SqlDataAdapter(sqlQueryAddress, sqlConnectAddress);

                    //This creates a datatable and fills it
                    DataTable dtForSelectAddress = new DataTable();
                    sqlAdapterAddress.Fill(dtForSelectAddress);

                    if (dtForSelectAddress.Rows.Count != 0)
                    {
                        TxtStreet.Text = Convert.ToString(dtForSelectAddress.Rows[0]["Street"]);
                        TxtCity.Text = Convert.ToString(dtForSelectAddress.Rows[0]["City"]);
                        TxtState.Text = Convert.ToString(dtForSelectAddress.Rows[0]["State"]);
                        TxtZip.Text = Convert.ToString(dtForSelectAddress.Rows[0]["Zip"]);
                    }

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
            ChkBoxAuction.Checked = true;
            LblHowMany.Visible = true;
            LblDescriptions.Visible = true;
            TxtHowMany.Visible = true;
            TxtDescriptions.Visible = true;
            ChkBoxCompleted.Checked = true;

            //Populates fields for testing
            TxtFirstName.Text = "Jake";
            TxtLastName.Text = "Robert";
            TxtPhoneNumber.Text = "7037284871";
            TxtCellPhone.Text = "7078523694";
            TxtWorkPhone.Text = "7578452321";
            TxtEmail.Text = "jake@dukes.com";
            TxtStreet.Text = "531 New Port Rd";
            TxtCity.Text = "Harrisonburg";
            TxtState.Text = "VA";
            TxtZip.Text = "22801";       
            TxtHowMany.Text = "5";
            TxtDescriptions.Text = "Couch, tv, coffee table, nightstand, lamp";
            DdlInitialContact.SelectedIndex = 5;
            DdlItemTransport.SelectedIndex = 2;
            DdlCompletedByEmp.SelectedIndex = 2;
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
            TxtCellPhone.Text = "";
            TxtWorkPhone.Text = "";
            TxtEmail.Text = "";
            TxtStreet.Text = "";
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtZip.Text = "";
            TxtHowMany.Text = "";
            TxtDescriptions.Text = "";
            DdlInitialContact.SelectedIndex = -1;
            DdlItemTransport.SelectedIndex = -1;
            DdlCompletedByEmp.SelectedIndex = -1;
            TxtOther.Text = "";
            TxtReferral.Text = "";
            TxtDeadline.Text = "";
            TxtDeadlineEnd.Text = "";
            LblSaveStatus.Text = "";

            //Hide Text Boxes Again
            LblOther.Visible = false;
            TxtOther.Visible = false;
            ChkBoxCompleted.Checked = false;
            LblHowMany.Visible = false;
            LblDescriptions.Visible = false;
            TxtHowMany.Visible = false;
            TxtDescriptions.Visible = false;
            ChkBoxAuction.Checked = false;

            //Stops the edit function
            Session["Customer ID"] = null;



        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //try
            // {
            //Changes chkbox boolean into a 1 or 0 for inserting into db
            string completed;
            if (ChkBoxCompleted.Checked)
            {
                completed = "True";
                
                var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
                var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name");
                const string fromPassword = "RoCo703757";
                const string subject = "Initial Conversation Completed!";
                const string body = "New Customer Account has been created from the Employee Portal.";

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
            else { completed = "False"; }
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
                String sqlQuery = "UPDATE CUSTOMER SET FirstName = @FirstName, LastName = @LastName, CellPhone = @CellPhone, WorkPhone = @WorkPhone, HomePhone = @HomePhone, Email = @Email, ItemsForSale = @HowMany, WhatDoyouSell = @Descriptions, Downsizing = @Downsizing, SettlingEstate =  @Estate, MovingCB = @MovingCB, AuctionCB = @AuctionCB, ConsignmentCB = @ConsignmentCB, AppraisalCB = @AppraisalCB, ItemTransportation = @ItemTransport, PreferredContact = @PreferredContact, ReferralChannel = @ReferralChannel, DeadlineStart = @DeadlineStart, DeadlineEnd = @DeadlineEnd, CompletedByEmp = @CompletedBy, CustomerNotes = @CustomerNotes, DateContacted = @DateContacted, completed = '" + completed + "' WHERE customerID = " + Session["Customer ID"].ToString();

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Capstone"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                //Parameterizes all strings
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
                sqlCommand.Parameters.Add(new SqlParameter("@DateContacted", System.DateTime.Today.ToString("yyyy-MM-dd")));
                if (DdlItemTransport.SelectedValue == "-1")
                {
                    sqlCommand.Parameters.Add(new SqlParameter("@ItemTransport", ""));
                }
                else
                {
                    sqlCommand.Parameters.Add(new SqlParameter("@ItemTransport", DdlItemTransport.SelectedItem.Text));
                }
              
                sqlCommand.Parameters.Add(new SqlParameter("@PreferredContact", initialContact));
                sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@DeadlineStart", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@DeadlineEnd", HttpUtility.HtmlEncode(TxtDeadlineEnd.Text)));
                if (DdlCompletedByEmp.SelectedValue == "-1")
                {
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletedBy", null));
                }
                else
                {
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletedBy", DdlCompletedByEmp.SelectedItem.Value));
                }
                
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerNotes", HttpUtility.HtmlEncode(TxtCustomerNotes.Text)));


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
                SqlConnection sqlConnectDuplicate = new SqlConnection("Server= aa134xzc8c5axs3, 1433;uid=admin;Password=Tobyman98!;Database=Capstone;Trusted_Connection=Yes;Integrated Security = False;");

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
                        " @Estate, @MovingCB, @AuctionCB, @ConsignmentCB, @AppraisalCB, @ItemTransport, @PreferredContact, @ReferralChannel, " + System.DateTime.Today.ToShortDateString() + ",  @DeadlineStart, @DeadlineEnd, @CompletedBy, @CustomerNotes, @Completed)";
                    //Define the Connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Capstone"].ConnectionString);

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
                    sqlCommand.Parameters.Add(new SqlParameter("@PreferredContact", initialContact));
                    sqlCommand.Parameters.Add(new SqlParameter("@ReferralChannel", HttpUtility.HtmlEncode(TxtReferral.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DeadlineStart", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@DeadlineEnd", HttpUtility.HtmlEncode(TxtDeadlineEnd.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@CompletedBy", DdlCompletedByEmp.SelectedItem.Value));
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

                    //Define the Connection to the Database
                    SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Capstone"].ConnectionString);
                    sqlConnect2.Open();
                    int CustomerID;
                    //Concatenate Sql Query Insert Statements
                    String query2 = "Select CustomerID from Customer WHERE Email = @Email";
                    SqlCommand command2 = new SqlCommand(query2, sqlConnect2);
                    command2.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(TxtEmail.Text));

                    SqlDataReader sqlDataReader = command2.ExecuteReader();
                    sqlDataReader.Read();
                    CustomerID = sqlDataReader["CustomerID"].GetHashCode();
                    sqlConnect2.Close();











                    //Define the Connection to the Database
                    SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Capstone"].ConnectionString);
                    sqlConnect3.Open();

                    //Concatenate Sql Query Insert Statements
                    String query1 = "Insert into Address values(null, "+CustomerID+", @Street, @City, @State, @Zip, 'Primary Contact Address')";
                    

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommand1 = new SqlCommand();
                    sqlCommand1.Connection = sqlConnect3;
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlCommand1.CommandText = query1;
                    sqlCommand1.Parameters.Add(new SqlParameter("@Street", HttpUtility.HtmlEncode(TxtStreet.Text)));
                    sqlCommand1.Parameters.Add(new SqlParameter("@City", HttpUtility.HtmlEncode(TxtCity.Text)));
                    sqlCommand1.Parameters.Add(new SqlParameter("@State", HttpUtility.HtmlEncode(TxtState.Text)));
                    sqlCommand1.Parameters.Add(new SqlParameter("@Zip", HttpUtility.HtmlEncode(TxtZip.Text)));

                    SqlDataReader queryResults2 = sqlCommand1.ExecuteReader();
                    queryResults2.Close();
                    sqlConnect3.Close();
                }

            }
        //}
            //catch
            //{
            //    LblSaveStatus.Text = "Error Saving Customer, Check Data Fields";
            //    LblSaveStatus.ForeColor = Color.Red;
            //}
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
            Response.Redirect("AddServiceOrder.aspx");
        }

        protected void DdlCompletedByEmp_DataBound(object sender, EventArgs e)
        {
            if (Session["Customer ID"] != null)
            {
                //Sets Service list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DdlCompletedByEmp.Items.Insert(0, blankOption);
                
            }
            else
            {
                //Sets Service list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DdlCompletedByEmp.Items.Insert(0, blankOption);
                DdlCompletedByEmp.SelectedIndex = 0;
            }
        }

        protected void ChkBoxMove_CheckedChanged(object sender, EventArgs e)
        {

        }

    }
}