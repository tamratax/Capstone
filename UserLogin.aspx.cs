//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            // connect to database to retrieve stored password string
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                LblLoginStatus.Text = "Database Connection Successful";

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT PasswordHash FROM Pass WHERE Username = @Username";
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
                            Session["User"] = HttpUtility.HtmlEncode(TxtUsername.Text);
                            Response.Redirect("Navigation.aspx");
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
            }
            catch
            {
                LblLoginStatus.Text = "Database Error.";
            }     
    }
}
}