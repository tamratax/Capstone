//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;


namespace WalkerS_Lab1Part3
{
    public partial class Navigation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Displays error when coming from another page
            if (Session["NoCustSelected"] != null)
            {
                LblSelectCustomer.ForeColor = Color.Red;
                LblSelectCustomer.Text = "Please Select a Customer!";
            }
            else
            {
                LblSelectCustomer.Text = "";
            }

            //Clear CustomerID Session Data on Page Load
            Session["Customer ID"] = null;

            if (!IsPostBack)
            {
                //Populates Customer Request listbox
                LstBoxCustomerRequests.DataTextField = "Name";
                LstBoxCustomerRequests.DataValueField = "Customer ID";

                String sqlQueryCustomer = "Select customerID 'Customer ID', FirstName + ' ' + LastName + ' (' + DateContacted + ') ->' as Name from Customer where completed='False'";


                SqlConnection sqlConnectCustomer = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterCustomer = new SqlDataAdapter(sqlQueryCustomer, sqlConnectCustomer);

                DataTable dtForListBox = new DataTable();
                sqlAdapterCustomer.Fill(dtForListBox);

                LstBoxCustomerRequests.DataSource = dtForListBox;
                LstBoxCustomerRequests.DataBind();


            }
        }

        //Navigates to ViewCustomer Web form after button is clicked
        protected void BtnCustomerPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCustomer.aspx");
        }

        //Navigates to ViewServices Web form after button is clicked
        protected void BtnServicePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewService.aspx");
        }

        //Navigates to AddCustomer Web form after button is clicked
        protected void BtnAddCustomerPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialConversation.aspx");
        }

        //Navigates to BtnAddServices Web form after button is clicked
        protected void BtnAddServicePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddServiceOrder.aspx");
        }

        protected void BtnViewNotes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewNote.aspx");
        }

        protected void BtnAddNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNote.aspx");
        }

        protected void LstBoxCustomerRequests_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Customer ID"] = LstBoxCustomerRequests.SelectedValue.ToString();
            Response.Redirect("InitialConversation.aspx");
        }


        protected void LstBoxIncompleteServiceTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ServiceTicketID"] = LstBoxIncompleteServiceTickets.SelectedValue.ToString();
            Response.Redirect("AddServiceOrder.aspx");
        }

        protected void BtnAuctions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Auction.aspx");
        }


        protected void BtnWarehouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("WarehouseInventory.aspx");
        }

        protected void BtnAUctionInvt_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionInventory.aspx");
        }

        protected void BtnMoveInvt_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveInventory.aspx");
        }

        protected void BtnCompletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompletionForm.aspx");
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {

            Session["NoCustSelected"] = null;

            //Check to see if customer is in the database
            String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name', email, homephone, workphone, cellphone from customer WHERE FirstName + ' ' +  LastName like @Name";



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

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);

            //Displays gridview
            GridViewCustomers.DataSource = dtForDuplicate;
            GridViewCustomers.DataBind();
            GridViewCustomers.Visible = true;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelectedCustomerID"] = GridViewCustomers.SelectedDataKey.Value.ToString();
            Session["SelectedCustomerName"] = GridViewCustomers.Rows[GridViewCustomers.SelectedIndex].Cells[2].Text;
            GridViewCustomers.Visible = false;

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