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
using System.Drawing;


namespace Lab2
{
    public partial class ViewService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLoadAllServices_Click(object sender, EventArgs e)
        {
            //Shows whole service table in gridview for moves
            String sqlQueryMove = "select c.FirstName + ' ' + c.lastname 'Customer Name', ";
            sqlQueryMove += "TicketStatus as 'Ticket Status', TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', ServiceCost as 'Service Cost', CompletionDate as 'Completion Date', ServiceType as 'Type', ";
            sqlQueryMove += "DestinationTime as 'Destination Time', GasExpense as 'Gas Expense', MiscExpense as 'Misc Expense', EmpFirstName + ' ' + EmpLastName 'Initiating Employee' ";
            sqlQueryMove += "from customer c join SERVICETICKET st on c.CustomerID = st.CustomerID join EMPLOYEE e on e.employeeid = st.InitiatingEmp ";
            sqlQueryMove += "where servicetype = 'Move' ";


            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQueryMove, sqlConnect);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            GrdMoveResults.DataSource = dtForGridView;
            GrdMoveResults.DataBind();


            //Shows whole service table in gridview for Auction
            String sqlQueryAuction = "select c.FirstName + ' ' + c.lastname 'Customer Name', ";
            sqlQueryAuction += "TicketStatus as 'Ticket Status', TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', AuctionDate as 'Auction Date', ServiceCost as 'Service Cost', CompletionDate as 'Completion Date', ServiceType as 'Service Type', ";
            sqlQueryAuction += "e2.EmpFirstName + ' ' + e2.EmpLastName 'Auction Contact', ";
            sqlQueryAuction += "e.EmpFirstName + ' ' + e.EmpLastName 'Initiating Employee'  ";
            sqlQueryAuction += "from customer c join SERVICETICKET st on c.CustomerID = st.CustomerID ";
            sqlQueryAuction += "join EMPLOYEE e on e.employeeid = st.InitiatingEmp join EMPLOYEE e2 on e2.employeeid = st.ContactID join AUCTION on Auction.AuctionID = st.AuctionID ";
            sqlQueryAuction += "where servicetype = 'Auction'";


            SqlConnection sqlConnectAuction = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapterAuction = new SqlDataAdapter(sqlQueryAuction, sqlConnectAuction);

            DataTable dtForGridViewAuction = new DataTable();
            sqlAdapterAuction.Fill(dtForGridViewAuction);

            GrdAuctionResults.DataSource = dtForGridViewAuction;
            GrdAuctionResults.DataBind();

            //Displays gridviews
            GrdMoveResults.Visible = true;
            GrdAuctionResults.Visible = true;
        }

        protected void BtnAddService_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddService.aspx");
        }

        protected void DdlServiceList_DataBound(object sender, EventArgs e)
        {

            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlServiceList.Items.Insert(0, blankOption);
            DdlServiceList.SelectedIndex = 0;


        }

        protected void DdlServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if Select is not selected...
            if (DdlServiceList.SelectedValue != "-1")
            {
                //updates Employee details in gridview
                String sqlQuery1 = "select EmpFirstName + ' ' + EmpLastName as EmployeeName, ";
                sqlQuery1 += "TicketChangeDate as 'Ticket Change Date' from employee emp join tickethistory th on emp.EmployeeID = th.EmployeeID ";
                sqlQuery1 += "join serviceticket st on st.ServiceTicketID = th.ServiceTicketID ";
                sqlQuery1 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                SqlConnection sqlConnect1 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery1, sqlConnect1);

                DataTable dtForGridView1 = new DataTable();
                sqlAdapter1.Fill(dtForGridView1);

                GrdEmployeeResults.DataSource = dtForGridView1;
                GrdEmployeeResults.DataBind();

                //updates Equipment details in gridview
                String sqlQuery2 = "select equipmenttype as 'Type' ";
                sqlQuery2 += "from EQUIPMENT join ASSIGNMENT on EQUIPMENT.EquipmentID = ASSIGNMENT.EquipmentID ";
                sqlQuery2 += "join ServiceTicket st on ASSIGNMENT.ServiceTicketID = st.ServiceTicketID ";
                sqlQuery2 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                SqlConnection sqlConnect2 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, sqlConnect2);

                DataTable dtForGridView2 = new DataTable();
                sqlAdapter2.Fill(dtForGridView2);

                GrdEquipmentResults.DataSource = dtForGridView2;
                GrdEquipmentResults.DataBind();


                //Updates Inventory details in gridview
                String sqlQuery3 = "select ItemDescription as 'Item Description', ItemCost as 'Item Cost', ItemDate as 'Item Date' from Inventory ";
                sqlQuery3 += "join ServiceTicket st on inventory.ServiceTicketID = st.ServiceTicketID ";
                sqlQuery3 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                SqlConnection sqlConnect3 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapter3 = new SqlDataAdapter(sqlQuery3, sqlConnect3);

                DataTable dtForGridView3 = new DataTable();
                sqlAdapter3.Fill(dtForGridView3);

                GrdInventory.DataSource = dtForGridView3;
                GrdInventory.DataBind();

                //Displays gridviews
                GrdEmployeeResults.Visible = true;
                GrdEquipmentResults.Visible = true;
                GrdInventory.Visible = true;

                //Populates ticket listbox
                LstBoxNoteSelect.DataTextField = "Note Title";
                LstBoxNoteSelect.DataValueField = "TicketHistoryID";

                String sqlQueryTicket = "Select TicketHistoryID, NoteTitle + ' ->' 'Note Title' from TicketHistory where ServiceTicketID = " + DdlServiceList.SelectedValue;


                SqlConnection sqlConnectTicket = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterTicket = new SqlDataAdapter(sqlQueryTicket, sqlConnectTicket);

                DataTable dtForListBox = new DataTable();
                sqlAdapterTicket.Fill(dtForListBox);

                LstBoxNoteSelect.DataSource = dtForListBox;
                LstBoxNoteSelect.DataBind();

            }
            else
            {
                //hides gridboxes if you select "select" on the dropdownlist
                GrdEmployeeResults.Visible = false;
                GrdEquipmentResults.Visible = false;
                GrdInventory.Visible = false;
            }
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
                sqlQueryMove += "TicketStatus as 'Ticket Status', TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', ServiceCost as 'Service Cost', CompletionDate as 'Completion Date', ServiceType 'Type', ";
                sqlQueryMove += "DestinationTime as 'Destination Time', GasExpense as 'Gas Expense', MiscExpense as 'Misc Expense', EmpFirstName + ' ' + EmpLastName 'Initiating Employee' ";
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
                sqlQueryAuction += "TicketStatus as 'Ticket Status', TicketOpenDate as 'Ticket Open Date', ServiceDate as 'Service Date', AuctionDate as 'Auction Date', ServiceCost as 'Service Cost', CompletionDate as 'Completion Date', ServiceType as 'Service Type', ";
                sqlQueryAuction += "e2.EmpFirstName + ' ' + e2.EmpLastName 'Auction Contact', ";
                sqlQueryAuction += "e.EmpFirstName + ' ' + e.EmpLastName 'Initiating Employee'  ";
                sqlQueryAuction += "from customer c join SERVICETICKET st on c.CustomerID = st.CustomerID  join AUCTION on Auction.AuctionID = st.AuctionID ";
                sqlQueryAuction += "join EMPLOYEE e on e.employeeid = st.InitiatingEmp join EMPLOYEE e2 on e2.employeeid = st.ContactID ";
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

                //Populates service Ddl
                DdlServiceList.DataTextField = "Services";
                DdlServiceList.DataValueField = "ServiceTicketID";

                String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where customerID = " + DdlCustomerList.SelectedValue;


                SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                DataTable dtForDdlServiceList = new DataTable();
                sqlAdapterService.Fill(dtForDdlServiceList);

                DdlServiceList.DataSource = dtForDdlServiceList;
                DdlServiceList.DataBind();


            }
            else
            {
                //hides gridbox if you select "select" on the dropdownlist
                GrdMoveResults.Visible = false;
                GrdAuctionResults.Visible = false;
            }


        }

        protected void LstBoxNoteSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelectedTicketHistoryID"] = LstBoxNoteSelect.SelectedValue.ToString();
            Session["SelectedCustomerID"] = DdlCustomerList.SelectedValue.ToString();
            Session["SelectedServiceTicketID"] = DdlServiceList.SelectedValue.ToString();
            Session["FromPage"] = "ViewService";
            Response.Redirect("ViewNote.aspx");


        }

        protected void BtnAddNewNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNote.aspx");
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
            sqlCommandInsert.Parameters.Add(new SqlParameter("@Name", "%"+ HttpUtility.HtmlEncode(TxtSearch.Text)+"%"));


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
