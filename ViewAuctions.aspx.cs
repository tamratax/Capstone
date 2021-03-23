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
    public partial class ViewAuctions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string sqlQueryDuplicate = "Select Customer.CustomerID, Firstname +' '+ Lastname as Name, TicketOpenDate as OpenDate, EmpFirstName + ' ' + EmpLastName as InitiatingEmployee from ServiceTicket join customer on ServiceTicket.CustomerID = Customer.CustomerID join employee on employee.employeeID = ServiceTicket.InitiatingEmp where ServiceType = 'Auction' AND  Firstname +' '+ Lastname Like @name order by TicketOpenDate DESC";

            SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            sqlConnectDuplicate.Open();

            SqlCommand sqlCommandInsert = new SqlCommand();
            sqlCommandInsert.Connection = sqlConnectDuplicate;
            sqlCommandInsert.CommandType = CommandType.Text;
            sqlCommandInsert.CommandText = sqlQueryDuplicate;
            sqlCommandInsert.Parameters.Add(new SqlParameter("@Name", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));

            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it

            //DataTable dtForDuplicate = new DataTable();
            //sqlAdapterDuplicate.Fill(dtForDuplicate);

            //GridviewMoves.DataSource = dtForDuplicate;
            //GridviewMoves.DataBind();
            //GridviewMoves.Visible = true;

            DataSet ds = new DataSet();

            sqlAdapterDuplicate.Fill(ds);

            GridviewAuction.DataSource = ds;

            GridviewAuction.DataBind();
            GridviewAuction.Visible = true;
        }
    }
}