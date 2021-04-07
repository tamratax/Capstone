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
    public partial class PreAuctionAssessment : System.Web.UI.Page
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
                }
            }
        }


        protected void ChkbxAuctionWalkthrough_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkbxAuctionWalkthrough.Checked)
            {
                rblLookat.Visible = true;
            }
            else
            {
                rblLookat.Visible = false;
            }
        }

        protected void ChkbxTrash_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkbxTrash.Checked)
            {
                lblTrashDescription.Visible = true;
                txtTrashDescription.Visible = true;
            }
            else
            {
                lblTrashDescription.Visible = false;
                txtTrashDescription.Visible = false;
            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String sqlQuery = "insert into PreAuctionAssessment values ()";
            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            //sqlCommand.Parameters.Add(new SqlParameter("@PotentialDate", HttpUtility.HtmlEncode(DateOutTxt.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@MustBeOut", HttpUtility.HtmlEncode(DateOutTxt.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Range1", HttpUtility.HtmlEncode(TxtRange1.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Range2", HttpUtility.HtmlEncode(TxtRange2.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@MlSListing", HttpUtility.HtmlEncode(MLSBTN.SelectedValue)));
            //sqlCommand.Parameters.Add(new SqlParameter("@SendPhotos", HttpUtility.HtmlEncode(PhotosBtn.SelectedValue)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Packing", HttpUtility.HtmlEncode(PackingChk.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@TrashRemoval", HttpUtility.HtmlEncode(TrashChk.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@TrashRemovalDescription", HttpUtility.HtmlEncode(TrashDescriptionTxt.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Donation", HttpUtility.HtmlEncode(DonationChk.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Auction", HttpUtility.HtmlEncode(AuctionChk.Checked)));


            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            sqlConnect.Close();

            string sqlService = "INSERT INTO ServiceTicket (CustomerID, TicketOpenDate, ServiceType, PreMoveAssessmentID) VALUES (@CustomerID, @TicketOpenDate, @ServiceType, (Select TOP 1 PreMoveAssessmentID from PreMoveAssessment order by PreMoveAssessmentID desc))";
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

            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();

            // Close all related connections
            sqlConnect1.Close();

            lblSaveStatus.Text = "Pre-Auction Assessment Saved Successfully";
            lblSaveStatus.ForeColor = Color.Green;
        }
    }
}
