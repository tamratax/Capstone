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

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + TicketOpenDate 'Services' from ServiceTicket where ServiceType = 'Auction' AND customerID = " + Session["SelectedCustomerID"].ToString();


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
            if (ddlService.SelectedIndex != 0)
            {
                String sqlQuery = "Select PreAuctionAssessment.PreAuctionAssessmentID, TrashCB, TrashDesc from PreAuctionAssessment join serviceticket st on st.PreAuctionAssessmentID = PreAuctionAssessment.PreAuctionAssessmentID where ServiceTicketID = " + ddlService.SelectedValue.ToString();


                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                DataTable dtForSelect = new DataTable();
                sqlAdapter.Fill(dtForSelect);

                if (dtForSelect.Rows[0]["TrashCB"].ToString() == "True")
                {
                    CheckBoxTrash.Checked = true;
                    CheckBoxTrash_CheckedChanged(sender, e);
                    txtdesc.Text = dtForSelect.Rows[0]["TrashDesc"].ToString();
                }

            }
        }

        protected void BtnAddOrigin_Click(object sender, EventArgs e)
        {
            //Concatenate Sql Query Update Statements
            String sqlQuery = "Insert into address values (@CustomerID, @Street, @City, @State, @Zip, @Description)";

            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            //Parameterizes all the strings
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand.Parameters.Add(new SqlParameter("@Street", HttpUtility.HtmlEncode(TxtStreet.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@City", HttpUtility.HtmlEncode(TxtCity.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@State", HttpUtility.HtmlEncode(TxtState.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Zip", HttpUtility.HtmlEncode(TxtZip.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(TxtDescription.Text)));

            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
            GridAddress.DataBind();

            //Clears textboxes
            TxtStreet.Text = "";
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtZip.Text = "";
            TxtDescription.Text = "";
        }

        protected void BtnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [ServiceTicketEmployee] (EmployeeID, ServiceTicketID) Values (@EmployeeID, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EmployeeID", DdlInitiatingEmp.SelectedValue.ToString());
                com.Parameters.AddWithValue("ServiceTicketID", ddlService.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                //LblStatus.Text = "Item sucessfully added!";
                GridEmployees.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void CheckBoxTrash_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxTrash.Checked)

                hiddentext1.Visible = true;

            else

                hiddentext1.Visible = false;
        }

        protected void ddlService_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            ddlService.Items.Insert(0, blankOption);
            ddlService.SelectedIndex = 0;
        }

        protected void DdlInitiatingEmp_DataBound(object sender, EventArgs e)
        {
            //Sets drop down list to default Select option
            DdlInitiatingEmp.Items.Insert(0, new ListItem("Select", "-1"));
            DdlInitiatingEmp.SelectedIndex = 0;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Concatenate Sql Query Update Statements
            String sqlQuery = "Insert into AUCTIONSERVICEORDER values (@PotentialDate, @PotentialTime, @Dumpster, @NumberEmp, @Charging, @TrashDescription, @FinalDate, @FinalTime)";

            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            //Parameterizes all the strings
            sqlCommand.Parameters.Add(new SqlParameter("@PotentialDate", HttpUtility.HtmlEncode(TxtPotentialDate.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@PotentialTime", HttpUtility.HtmlEncode(TxtPotentialTime.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Dumpster", HttpUtility.HtmlEncode(CheckBoxDumpster.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@NumberEmp", HttpUtility.HtmlEncode(TxtNumberEmp.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Charging", HttpUtility.HtmlEncode(TxtCharging.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashDescription", HttpUtility.HtmlEncode(txtdesc.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@FinalDate", HttpUtility.HtmlEncode(TxtAuctionDate.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@FinalTime", HttpUtility.HtmlEncode(txtAuctionTime.Text)));

            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();





            //Add form ID to serviceTicket
            string query1 = "UPDATE Serviceticket set AuctionServiceOrderID = (select TOP 1 AuctionServiceOrderID from AuctionServiceOrder order by AuctionServiceOrderID desc) where ServiceTicketID = " + ddlService.SelectedValue.ToString();

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);


            com1.ExecuteNonQuery();
            sqlConnect1.Close();


            lblSaveStatus.Text = "Auction Service Order Saved Successfully!";
            lblSaveStatus.ForeColor = Color.Green;
        }
    }
}