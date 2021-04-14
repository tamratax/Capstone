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
using System.Net;
using System.Net.Mail;

namespace Lab3
{
    public partial class CustomerPreMoveAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["CustomerUsername"] == null)
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("CustomerPortal.aspx");


            }
            else
            {
                //lblselected.Text = Session["SelectedCustomerName"].ToString();

                //Pulling in customer's record
                String sqlQuery = "Select * from customer where customerid = " + Session["CustomerUsername"].ToString();

                //Establishes the connection between our web form and database
                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                //This creates a datatable and fills it
                //DataTable dtForSelect = new DataTable();
                //sqlAdapter.Fill(dtForSelect);
                //LblCustName.Text = Session["SelectedCustomerName"].ToString();
                //LblHomeNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                //LblCellNumber.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                //LblWorkNumber.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                //LblEmailText.Text = Convert.ToString(dtForSelect.Rows[0]["Email"]);


                //lblselected.Text = Convert.ToString(dtForSelect.Rows[0]["Name"]);
                //LblID.Text = Session["SelectedCustomerID"].ToString();

                //}
            }






        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "insert into PreMoveAssessment values (@PotentialDate, @MustBeOut, @Range1, @Range2, @MlSListing, @SendPhotos, @Packing, @TrashRemoval, @TrashRemovalDescription, @Donation, @Auction)";
            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlCommand.Parameters.Add(new SqlParameter("@PotentialDate", HttpUtility.HtmlEncode(DateOutTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@MustBeOut", HttpUtility.HtmlEncode(DateOutTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Range1", HttpUtility.HtmlEncode(TxtRange1.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Range2", HttpUtility.HtmlEncode(TxtRange2.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@MlSListing", HttpUtility.HtmlEncode(MLSBTN.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@SendPhotos", HttpUtility.HtmlEncode(PhotosBtn.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@Packing", HttpUtility.HtmlEncode(PackingChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashRemoval", HttpUtility.HtmlEncode(TrashChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashRemovalDescription", HttpUtility.HtmlEncode(TrashDescriptionTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Donation", HttpUtility.HtmlEncode(DonationChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@Auction", HttpUtility.HtmlEncode(AuctionChk.Checked)));


            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            sqlConnect.Close();

            string sqlService = "INSERT INTO ServiceTicket (CustomerID, TicketOpenDate, ServiceType, PreMoveAssessmentID ) VALUES (@CustomerID, @TicketOpenDate, @ServiceType, (Select TOP 1 PreMoveAssessmentID from PreMoveAssessment order by PreMoveAssessmentID desc))";
            //Define the Connection to the Database
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect1;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlService;

            sqlCommand1.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand1.Parameters.Add(new SqlParameter("@ServiceType", "Move"));
            sqlCommand1.Parameters.Add(new SqlParameter("@TicketOpenDate", DateTime.Now.ToString("yyyy-MM-dd")));
            //sqlCommand1.Parameters.Add(new SqlParameter("@InitiatingEmp", ddlInitiating.SelectedValue.ToString()));

            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();

            // Close all related connections
            sqlConnect1.Close();

            LblSaveStatus.Text = "Pre-Move Assessment Saved Successfully";
            LblSaveStatus.ForeColor = Color.Green;


            LblSaveStatus.Text = "Move Assessment Saved Successfully";
            LblSaveStatus.ForeColor = Color.Green;

        }

        protected void PopBtn_Click(object sender, EventArgs e)
        {
            DateOutTxt.Text = "2021-04-07";
            TxtRange1.Text = "2021-04-03";
            TxtRange2.Text = "2021-04-05";
            DestAddressTxt.Text = "123 S Main St";
            DestCityTxt.Text = "Harrisonburg";
            DestStateTxt.Text = "Virginia";
            DestZipTxt.Text = "22801";
            MLSBTN.SelectedValue = "Yes";
            PhotosBtn.SelectedValue = "No";
            PackingChk.Checked = true;
            //ddlInitiating.SelectedIndex = 1;
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            DateOutTxt.Text = "";
            TxtRange1.Text = "";
            TxtRange2.Text = "";
            DestAddressTxt.Text = "";
            DestCityTxt.Text = "";
            DestStateTxt.Text = "";
            DestZipTxt.Text = "";
            MLSBTN.SelectedIndex = -1;
            PhotosBtn.SelectedIndex = -1;
            PackingChk.Checked = false;
            //ddlInitiating.SelectedIndex = 0;
        }

        //protected void ddlInitiating_DataBound(object sender, EventArgs e)
        //{
        //    //Sets emp list ddl to default of select
        //    ListItem blankOption = new ListItem("Select", "-1");
        //    ddlInitiating.Items.Insert(0, blankOption);
        //    ddlInitiating.SelectedIndex = 0;
        //}

        protected void TrashChk_CheckedChanged(object sender, EventArgs e)
        {
            if (TrashChk.Checked)
            {
                TrashDescriptionTxt.Visible = true;
            }
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerServiceChoice.aspx");
        }
    }
}
