//Coded By:Stuart Walker & Aaron Walsh
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
    public partial class Auction : System.Web.UI.Page
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
                //Populates service Ddl
                DdlServiceList.DataTextField = "Services";
                DdlServiceList.DataValueField = "ServiceTicketID";
                //Only selects service tickets that are Auctions and Completed
                String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where customerID = " + DdlCustomerList.SelectedValue + " AND ServiceType = 'Auction' AND Completed = 1";


                SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                DataTable dtForDdlServiceList = new DataTable();
                sqlAdapterService.Fill(dtForDdlServiceList);

                DdlServiceList.DataSource = dtForDdlServiceList;
                DdlServiceList.DataBind();
            }
            else
            {
                DdlServiceList.Items.Clear();

            }
        }

        protected void DdlServiceList_DataBound(object sender, EventArgs e)
        {

            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlServiceList.Items.Insert(0, blankOption);
            DdlServiceList.SelectedIndex = 0;


        }

        protected void DdlSelectAuction_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlSelectAuction.Items.Insert(0, blankOption);
            DdlSelectAuction.SelectedIndex = 0;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Concatenate Sql Query Update Statements
                String sqlQuery = "UPDATE ServiceTicket SET AuctionID = " + DdlSelectAuction.SelectedValue + " WHERE ServiceTicketID = " + DdlServiceList.SelectedValue;

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                LblSaveStatus.Text = "Service Inventory Added To Auction Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
            catch
            {
                LblSaveStatus.Text = "Error Occured When Saving";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            DdlCustomerList.SelectedValue = "-1";
            DdlServiceList.Items.Clear();
            DdlSelectAuction.SelectedValue = "-1";
            LblSaveStatus.Text = "";
        }
    }
}