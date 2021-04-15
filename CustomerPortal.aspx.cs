//Coded By:Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;


namespace Lab3
{
    public partial class CustomerPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerCreated"] != null)
            {
                LblLoginStatus.ForeColor = Color.Green;
                LblLoginStatus.Text = "Account created sucessfully!";
                
                Session.Remove("CustomerCreated");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // connect to database to retrieve stored password string
            //try
            //{
                SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                LblLoginStatus.Text = "Database Connection Successful";

                sc.Open();
                SqlCommand findPass = new SqlCommand();
                findPass.Connection = sc;
                findPass.CommandType = CommandType.StoredProcedure;
                //Using a Stored Procedure to find hashed password
                findPass.CommandText = "JeremyEzellLab3";
                //SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(TxtUsername.Text)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(TxtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            LblLoginStatus.Text = "Success!";
                            Session["CustomerUsername"] = HttpUtility.HtmlEncode(TxtUsername.Text);

                            String sqlQueryDuplicate = "Select CustomerID from customer WHERE email = @email";



                            //Establishes the connection between our web form and database
                            SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                            //Creates sqlcommand with query and email parameter for security
                            SqlCommand sqlCommandInsert = new SqlCommand();
                            sqlCommandInsert.Connection = sqlConnectDuplicate;
                            sqlCommandInsert.CommandType = CommandType.Text;
                            sqlCommandInsert.CommandText = sqlQueryDuplicate;
                            sqlCommandInsert.Parameters.Add(new SqlParameter("@email", HttpUtility.HtmlEncode(TxtUsername.Text)));


                            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
                            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

                            //This creates a datatable and fills it
                            DataTable dtForDuplicate = new DataTable();
                            sqlAdapterDuplicate.Fill(dtForDuplicate);

                            Session["SelectedCustomerID"] = dtForDuplicate.Rows[0]["CustomerID"].ToString();

                            Response.Redirect("CustomerServiceChoice.aspx");
                        }
                        else
                            LblLoginStatus.ForeColor = Color.Red;
                            LblLoginStatus.Text = "Email and Password combination incorrect!";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    LblLoginStatus.ForeColor = Color.Red;
                LblLoginStatus.Text = "Email and Password combination incorrect!";

                sc.Close();
            //}
            //catch
            //{
            //    LblLoginStatus.Text = "Database Error.";
            //}


          

        }

        protected void BtnNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }
    }
}