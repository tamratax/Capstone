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
    public partial class WarehouseAssign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LblCustomerSelected.Text = Session["SelectedCustomerName"].ToString();
                TxtDate.Text = System.DateTime.Today.ToString("yyyy-MM-dd");
            }

        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Savebtn_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [WAREHOUSE] (Date, Location, Description, CustomerID) Values (@Date, @Location, @Description, @CustomerID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("Date", TxtDate.Text.ToString());
                com.Parameters.AddWithValue("Location", TxtLocation.Text.ToString());
                com.Parameters.AddWithValue("Description", TxtDescription.Text.ToString());
                com.Parameters.AddWithValue("CustomerID", Session["SelectedCustomerID"]);

                com.ExecuteNonQuery();
                sqlConnect.Close();

                TxtDate.Text = "";
                TxtDescription.Text = "";
                TxtLocation.Text = "";




                LblStatus.Text = "Item sucessfully added!";
                GridWarehouse.DataBind();
                TxtDate.Text = System.DateTime.Today.ToString("yyyy-MM-dd");

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }

        }
    }
}