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
    public partial class WarehouseInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {

            //Check to see if customer is in the database
            String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name', email, homephone, workphone, cellphone from customer WHERE FirstName + ' ' +  LastName like @Name";



            //Establishes the connection between our web form and database
            SqlConnection sqlConnectDuplicate = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            //Creates sqlcommand with query and email parameter for security
            SqlCommand sqlCommandInsert = new SqlCommand();
            sqlCommandInsert.Connection = sqlConnectDuplicate;
            sqlCommandInsert.CommandType = CommandType.Text;
            sqlCommandInsert.CommandText = sqlQueryDuplicate;
            sqlCommandInsert.Parameters.Add(new SqlParameter("@Name", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));


            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GridViewCustomers.DataSource = dtForDuplicate;
            GridViewCustomers.DataBind();
            GridViewCustomers.Visible = true;

        }
        protected void GridViewCustomers_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
            String sqlQuery = "SELECT warehouseID, customerID, Date, Location,  Description from warehouse WHERE CustomerID = @CustomerID";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            SqlCommand com = new SqlCommand();
            com.Connection = sqlConnect;
            com.CommandType = CommandType.Text;
            com.CommandText = sqlQuery;
            com.Parameters.Add(new SqlParameter("@CustomerID", GridViewCustomers.SelectedDataKey.Value.ToString()));

            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(com);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GrdEquip.DataSource = dtForDuplicate;
            GrdEquip.DataBind();
            GrdEquip.Visible = true;
        }

        public object FormatPhoneNumber(string phoneNumber)
        {
            // return nothing if the string is null
            if (String.IsNullOrEmpty(phoneNumber))
            {
                return "N/A";
            }

            // if the int is valid, return the formatted phone number
            return string.Format("({0}) {1}-{2}",
                   phoneNumber.Substring(0, 3),
                   phoneNumber.Substring(3, 3),
                   phoneNumber.Substring(6));
        }

    }
}
