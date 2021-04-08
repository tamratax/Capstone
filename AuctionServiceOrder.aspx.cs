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
    public partial class AuctionServiceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Checks to see if there is a customer selected
                if (Session["SelectedCustomerID"] == null)
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");


                }
                //If the user is trying to edit a customer, there will be a customerid in this session data
                if (Session["SelectedCustomerID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select * from customer where customerid = " + Session["SelectedCustomerID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    LblCustName.Text = Session["SelectedCustomerName"].ToString();
                    LblHomeNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                    LblCellNumber.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                    LblWorkNumber.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                    LblEmailText.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);


                    //Populates service Ddl
                    ddlService.DataTextField = "Services";
                    ddlService.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + TicketOpenDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + Session["SelectedCustomerID"].ToString();


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    ddlService.DataSource = dtForDdlServiceList;
                    ddlService.DataBind();
                }
            }
        }

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnAddOrigin_Click(object sender, EventArgs e)
        {

        }

        protected void BtnAddEmployee_Click(object sender, EventArgs e)
        {

        }

        protected void CheckBoxTrash_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void ddlService_DataBound(object sender, EventArgs e)
        {

        }

        protected void DdlInitiatingEmp_DataBound(object sender, EventArgs e)
        {

        }
    }
}