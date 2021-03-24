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

namespace WalkerS_Lab1Part3
{
    public partial class ViewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            
            GridviewCusts.Visible = true;
            GRDShowAllCust.Visible = false;
        }

        protected void GridviewMoves_RowEditing(object sender, GridViewEditEventArgs e)
        {
            

        }

        protected void BtnLoadAll_Click(object sender, EventArgs e)
        {
            //string sqlQueryDuplicate = "Select CustomerID, Firstname, Lastname, CellPhone, WorkPhone, HomePhone,Email from customer";

            //SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            //sqlConnectDuplicate.Open();

            //SqlCommand sqlCommandInsert = new SqlCommand();
            //sqlCommandInsert.Connection = sqlConnectDuplicate;
            //sqlCommandInsert.CommandType = CommandType.Text;
            //sqlCommandInsert.CommandText = sqlQueryDuplicate;
            //sqlCommandInsert.Parameters.Add(new SqlParameter("@FirstName", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));
            //sqlCommandInsert.Parameters.Add(new SqlParameter("@LastName", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));

            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);


            //DataSet ds = new DataSet();

            //sqlAdapterDuplicate.Fill(DSCust);

            //GridviewCusts.DataSource = DSCust;

            //GridviewCusts.DataBind();
            //GridviewCusts.Visible = true;
            GridviewCusts.Visible = false;
            GRDShowAllCust.Visible = true;

        }
    }
}