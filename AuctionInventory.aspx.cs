using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Data;

namespace Lab3
{
    public partial class ItemRecieval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblCustomerName.Text = "PLEASE SELECT A CUSTOMER FROM HOME PAGE";
            if (Session["SelectedCustomerName"] != null)
            {
                LblCustomerName.Text = Session["SelectedCustomerName"].ToString();
            }
            else
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("Navigation.aspx");
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Define the Connection to the Database
                SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect3.Open();

                //Concatenate Sql Query Insert Statements
                String query1 = "Insert into AuctionInventory values(@AuctionNotes, "+ DDLType.SelectedValue.ToString() + ")";


                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand1 = new SqlCommand();
                sqlCommand1.Connection = sqlConnect3;
                sqlCommand1.CommandType = CommandType.Text;
                sqlCommand1.CommandText = query1;
                            
                sqlCommand1.Parameters.Add(new SqlParameter("@AuctionNotes", HttpUtility.HtmlEncode(TxtNotes.Text)));

                SqlDataReader queryResults2 = sqlCommand1.ExecuteReader();
                queryResults2.Close();
                sqlConnect3.Close();

                LblSaveStatus.Text = "Saved Customer Auction Inventory";
                LblSaveStatus.ForeColor = Color.Green;

            }
            catch
            {
                LblSaveStatus.Text = "Error Saving, Check Data Fields";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }
   
        protected void DDLType_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;
        }

        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            TxtNotes.Text = "Aaron has a lot of valuble guns and old war relics we can sell! We may have to donate or trash his hat collection!";
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxtNotes.Text = "";
        }
    }
}