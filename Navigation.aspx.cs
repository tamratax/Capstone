//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace WalkerS_Lab1Part3
{
    public partial class Navigation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Populates Customer Request listbox
                LstBoxCustomerRequests.DataTextField = "Name";
                LstBoxCustomerRequests.DataValueField = "Customer ID";

                String sqlQueryCustomer = "Select customer.customerID 'Customer ID', FirstName + ' ' + LastName + ' (' + DateContacted + ') ->' as 'Name' from Customer where completed='False'";


                SqlConnection sqlConnectCustomer = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterCustomer = new SqlDataAdapter(sqlQueryCustomer, sqlConnectCustomer);

                DataTable dtForListBox = new DataTable();
                sqlAdapterCustomer.Fill(dtForListBox);

                LstBoxCustomerRequests.DataSource = dtForListBox;
                LstBoxCustomerRequests.DataBind();

                ////Populates Service Request listbox
                //LstBoxServiceRequests.DataTextField = "Service Request";
                //LstBoxServiceRequests.DataValueField = "ServiceRequestID";

                //String sqlQueryService = "Select ServiceRequestID, FirstName + ' ' + LastName + ': ' + ServiceType + ' ->' as 'Service Request' from ServiceRequest join Customer on ServiceRequest.CustomerID = Customer.CustomerID WHERE requeststatus = 'Active'";


                //SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                //DataTable dtForListBox2 = new DataTable();
                //sqlAdapterService.Fill(dtForListBox2);

                //LstBoxServiceRequests.DataSource = dtForListBox2;
                //LstBoxServiceRequests.DataBind();

                //Populates Unfinished Service Ticket listbox
                LstBoxIncompleteServiceTickets.DataTextField = "Service Ticket";
                LstBoxIncompleteServiceTickets.DataValueField = "ServiceTicketID";

                String sqlQueryTicket = "Select ServiceTicketID, FirstName + ' ' + LastName + ': ' + ServiceType + ' on '+ ServiceDate +' ->' as 'Service Ticket' from ServiceTicket join Customer on ServiceTicket.CustomerID = Customer.CustomerID where ServiceTicket.Completed = 'False'";


                SqlConnection sqlConnectTicket = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterTicket = new SqlDataAdapter(sqlQueryTicket, sqlConnectTicket);

                DataTable dtForListBox3 = new DataTable();
                sqlAdapterTicket.Fill(dtForListBox3);

                LstBoxIncompleteServiceTickets.DataSource = dtForListBox3;
                LstBoxIncompleteServiceTickets.DataBind();
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

        //protected void LstBoxServiceRequests_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Session["ServiceRequestID"] = LstBoxServiceRequests.SelectedValue.ToString();
        //    Response.Redirect("AddServiceOrder.aspx");
        //}

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
    }
}