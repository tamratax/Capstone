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

namespace Lab3
{
    public partial class NewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {

            if (TxtFirstName.Text != "" && TxtLastName.Text != "" && TxtPassword.Text != "" && TxtEmail.Text != "") // all fields must be filled out
            {
                // COMMIT VALUES
                try
                {
                    //Check to see if customer is already in the database
                    String sqlQueryDuplicate = "Select CustomerID, email from customer WHERE email = '" + HttpUtility.HtmlEncode(TxtEmail.Text) + "'";



                //Establishes the connection between our web form and database
                SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate);

                //This creates a datatable and fills it
                DataTable dtForDuplicate = new DataTable();
                sqlAdapterDuplicate.Fill(dtForDuplicate);

                //If there are any records, user already exists
                if (dtForDuplicate.Rows.Count > 0)
                {
                    //LblCreateStatus.Text = "Customer with that Email/Username already exists!";
                    //LblCreateStatus.ForeColor = Color.Red;
                }
                else
                {
                    //Establishes a new Sql connection to the AUTH database
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    //LblCreateStatus.Text = "Database Connection Successful";

                    sc.Open();

                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "INSERT INTO Person (FirstName, LastName, Username, PersonType) VALUES (@FName, @LName, @Username, 'Customer')";
                    createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(TxtFirstName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(TxtLastName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(TxtEmail.Text)));
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO Pass (UserID, Username, PasswordHash) VALUES ((select max(userid) from person), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(TxtEmail.Text)));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(TxtPassword.Text))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    //LblCreateStatus.Text = "User committed!";

                    //Create Customer record
                    //Concatenate Sql Query Insert Statements
                    String sqlQuery = "insert into CUSTOMER (FirstName, LastName, WorkPhone, CellPhone, HomePhone, Email, Completed, DateContacted, Downsizing, SettlingEstate, MovingCB, AuctionCB, ConsignmentCB, AppraisalCb) values (@FirstName, @LastName, @WorkPhone, @CellPhone, @HomePhone, @Email, 'False', '" + System.DateTime.Today.ToString("yyyy-MM-dd") + "', 'False', 'False', 'False', 'False', 'False', 'False') ";
                    //sqlQuery += ", '', '', '', '', '', 0, '" + System.DateTime.Now.Date.ToString("yyyy-MM-dd") + "', '', '', 0)";


                    //Define the Connection to the Database
                    SqlConnection sqlConnectCustomer = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    // Create the SQL Command object which will send the query
                    SqlCommand sqlCommandCustomer = new SqlCommand();
                    sqlCommandCustomer.Connection = sqlConnectCustomer;
                    sqlCommandCustomer.CommandType = CommandType.Text;
                    sqlCommandCustomer.CommandText = sqlQuery;
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(TxtFirstName.Text)));
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(TxtLastName.Text)));
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@WorkPhone", HttpUtility.HtmlEncode(TxtWorkPhone.Text)));
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@HomePhone", HttpUtility.HtmlEncode(TxtPhoneNumber.Text)));
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@CellPhone", HttpUtility.HtmlEncode(TxtCellPhone.Text)));
                    sqlCommandCustomer.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(TxtEmail.Text)));
                        
                        
                        // Open your connection, send the query 
                        sqlConnectCustomer.Open();
                    SqlDataReader queryResultsCustomer = sqlCommandCustomer.ExecuteReader();

                    // Close all related connections
                    queryResultsCustomer.Close();
                    sqlConnectCustomer.Close();

                    

                    sqlQuery = "insert into Address (customerID, street, city, state, zip, Description ) values ((select TOP 1 customerID from customer order by customerid desc), @street, @city, @state, @zip, 'Primary Contact Address') ";

                    SqlConnection sqlConnectAddress = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    SqlCommand sqlCommandAddress = new SqlCommand();
                    sqlCommandAddress.Connection = sqlConnectAddress;
                    sqlCommandAddress.CommandType = CommandType.Text;
                    sqlCommandAddress.CommandText = sqlQuery;
                    sqlCommandAddress.Parameters.Add(new SqlParameter("@street", HttpUtility.HtmlEncode(TxtStreetAddress.Text)));
                    sqlCommandAddress.Parameters.Add(new SqlParameter("@city", HttpUtility.HtmlEncode(TxtCity.Text)));
                    sqlCommandAddress.Parameters.Add(new SqlParameter("@state", HttpUtility.HtmlEncode(TxtState.Text)));
                    sqlCommandAddress.Parameters.Add(new SqlParameter("@Zip", HttpUtility.HtmlEncode(TxtZip.Text)));

                    sqlConnectAddress.Open();
                    SqlDataReader queryResultsAddress = sqlCommandAddress.ExecuteReader();

                    // Close all related connections
                    queryResultsAddress.Close();
                    sqlConnectAddress.Close();





                        Session["CustomerCreated"] = "True";
                        Response.Redirect("CustomerPortal.aspx");
                    //LblCreateStatus.Text = "Customer Added Successfully";
                    //LblCreateStatus.ForeColor = Color.Green;
                }

                }
                catch
                {
                    //LblCreateStatus.Text = "Database Error - User not committed.";
                }
            }
            else
            {
                //LblCreateStatus.Text = "Fill all fields.";

            }



        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPortal.aspx");
        }

        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            TxtEmail.Text = "bradyT@Gmail.com";
            TxtPassword.Text = "dukedog";
            TxtFirstName.Text = "Tom";
            TxtLastName.Text = "Brady";
            TxtStreetAddress.Text = "155 Tampa Street";
            TxtCity.Text = "Harrisonburg";
            TxtState.Text = "Virginia";
            TxtZip.Text = "22801";
            TxtPhoneNumber.Text = "5405228558";
            TxtCellPhone.Text = "5405201010";
            TxtWorkPhone.Text = "5404252754";

            
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxtEmail.Text = "";
            TxtPassword.Text = "";
            TxtFirstName.Text = "";
            TxtLastName.Text = "";
            TxtStreetAddress.Text = "";
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtPhoneNumber.Text = "";
            TxtCellPhone.Text = "";
            TxtWorkPhone.Text = "";

        }
    }
}