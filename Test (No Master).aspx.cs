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
    public partial class Test__No_Master_ : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DdlCustomerList_DataBound(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                //Sets Customer list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DdlCustomerList.Items.Insert(0, blankOption);
                DdlCustomerList.SelectedIndex = 0;

            }
        }

        protected void DdlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlCustomerList.SelectedValue != "-1")
            {
                //hides gridboxes if you select "select" on the dropdownlist
                GrdEmployeeResults.Visible = false;
                GrdEquipmentResults.Visible = false;
                GrdInventory.Visible = false;

                //Shows whole service table in gridview for moves
                String sqlQueryMove = "select c.FirstName + ' ' + c.lastname 'Customer Name', ";
                sqlQueryMove += "TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', CompletionDate as 'Completion Date', ServiceType 'Type', ";
                sqlQueryMove += "DestinationTime as 'Destination Time', EmpFirstName + ' ' + EmpLastName 'Initiating Employee' ";
                sqlQueryMove += "from customer c join SERVICETICKET st on c.CustomerID = st.CustomerID join EMPLOYEE e on e.employeeid = st.InitiatingEmp ";
                sqlQueryMove += "where servicetype = 'Move' and c.CustomerID = " + DdlCustomerList.SelectedValue;


                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQueryMove, sqlConnect);

                DataTable dtForGridView = new DataTable();
                sqlAdapter.Fill(dtForGridView);

                GrdMoveResults.DataSource = dtForGridView;
                GrdMoveResults.DataBind();


                //Shows whole service table in gridview for Auction
                String sqlQueryAuction = "select c.FirstName + ' ' + c.lastname 'Customer Name', ";
                sqlQueryAuction += "TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', AuctionDate as 'Auction Date', CompletionDate as 'Completion Date', ServiceType as 'Service Type', ";
                sqlQueryAuction += "e2.EmpFirstName + ' ' + e2.EmpLastName 'Auction Contact', ";
                sqlQueryAuction += "e.EmpFirstName + ' ' + e.EmpLastName 'Initiating Employee'  ";
                sqlQueryAuction += "from customer c join SERVICETICKET st on c.CustomerID = st.CustomerID  join AUCTION on Auction.AuctionID = st.AuctionID ";
                sqlQueryAuction += "join EMPLOYEE e on e.employeeid = st.InitiatingEmp join EMPLOYEE e2 on e2.employeeid = st.InitiatingEmp ";
                sqlQueryAuction += "where servicetype = 'Auction' and c.CustomerID = " + DdlCustomerList.SelectedValue;


                SqlConnection sqlConnectAuction = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterAuction = new SqlDataAdapter(sqlQueryAuction, sqlConnectAuction);

                DataTable dtForGridViewAuction = new DataTable();
                sqlAdapterAuction.Fill(dtForGridViewAuction);

                GrdAuctionResults.DataSource = dtForGridViewAuction;
                GrdAuctionResults.DataBind();

                //Reveals grid views
                GrdMoveResults.Visible = true;
                GrdAuctionResults.Visible = true;

                

            }
            else
            {
                //hides gridbox if you select "select" on the dropdownlist
                GrdMoveResults.Visible = false;
          
                
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //Check to see if customer is in the database
            String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name' from customer WHERE FirstName + ' ' +  LastName like @Name";



            //Establishes the connection between our web form and database
            SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

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

            if (dtForDuplicate.Rows.Count == 0)
            {
                LblSearch.Text = "No Results Found";
                LblSearch.ForeColor = Color.Red;
            }
            else
            {
                DdlCustomerList.SelectedValue = Convert.ToString(dtForDuplicate.Rows[0]["CustomerID"]);
                DdlCustomerList_SelectedIndexChanged(sender, e);
                LblSearch.Text = Convert.ToString(dtForDuplicate.Rows.Count) + " Results Found";
                LblSearch.ForeColor = Color.Green;
            }

        }
    }
    
}