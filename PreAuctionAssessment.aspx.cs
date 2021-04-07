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
                rblLookat.ClearSelection();
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
                txtTrashDescription.Text = "";
            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtWhatToSell.Text = "I have some collectibles and big drawers and bowls";
            ddlWhy.SelectedIndex = 1;
            txtDeadline.Text = "2021-04-07";
            ChkbxBringin.Checked = true;
            ChkbxAuctionWalkthrough.Checked = true;
            ChkbxAuctionWalkthrough_CheckedChanged(sender, e);
            rblLookat.SelectedIndex = 0;
            ChkbxPickup.Checked = true;
            ChkbxTrash.Checked = true;
            ChkbxTrash_CheckedChanged(sender, e);
            txtTrashDescription.Text = "There's a ton of broken plywood by our dumpster";
            ChkbxPhotos.Checked = true;
            ChkbxItems.Checked = true;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String sqlQuery = "insert into PreAuctionAssessment values " +
                "(@HaveToSell, @Reason, @Deadline, @BringInCB, @AuctionWalkCB, @RequestLookat, @PickupCB, @TrashCB, @TrashDesc, @PhotosCB, @ItemCB)";
            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlCommand.Parameters.Add(new SqlParameter("@HaveToSell", HttpUtility.HtmlEncode(txtWhatToSell.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Reason", HttpUtility.HtmlEncode(ddlWhy.SelectedItem.Text.ToString())));
            sqlCommand.Parameters.Add(new SqlParameter("@Deadline", HttpUtility.HtmlEncode(txtDeadline.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@BringInCB", HttpUtility.HtmlEncode(ChkbxBringin.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@AuctionWalkCB", HttpUtility.HtmlEncode(ChkbxAuctionWalkthrough.Checked)));
            if (rblLookat.SelectedIndex == 0 || rblLookat.SelectedIndex == 1)
            {
                sqlCommand.Parameters.Add(new SqlParameter("@RequestLookat", HttpUtility.HtmlEncode(rblLookat.SelectedItem.Text.ToString())));
            }
            else
            {
                sqlCommand.Parameters.Add(new SqlParameter("@RequestLookat", ""));
            }
            
            sqlCommand.Parameters.Add(new SqlParameter("@PickupCB", HttpUtility.HtmlEncode(ChkbxPickup.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashCB", HttpUtility.HtmlEncode(ChkbxTrash.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashDesc", HttpUtility.HtmlEncode(txtTrashDescription.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@PhotosCB", HttpUtility.HtmlEncode(ChkbxPhotos.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@ItemCB", HttpUtility.HtmlEncode(ChkbxItems.Checked)));


            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            sqlConnect.Close();

            string sqlService = "INSERT INTO ServiceTicket (CustomerID, TicketOpenDate, ServiceType, PreAuctionAssessmentID) VALUES (@CustomerID, @TicketOpenDate, @ServiceType, (Select TOP 1 PreAuctionAssessmentID from PreAuctionAssessment order by PreAuctionAssessmentID desc))";
            //Define the Connection to the Database
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect1;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlService;

            sqlCommand1.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand1.Parameters.Add(new SqlParameter("@ServiceType", "Auction"));
            sqlCommand1.Parameters.Add(new SqlParameter("@TicketOpenDate", DateTime.Now.ToString("yyyy-MM-dd")));

            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();

            // Close all related connections
            sqlConnect1.Close();

            lblSaveStatus.Text = "Pre-Auction Assessment Saved Successfully";
            lblSaveStatus.ForeColor = Color.Green;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtWhatToSell.Text = "";
            ddlWhy.SelectedIndex = 0;
            txtDeadline.Text = "";
            ChkbxBringin.Checked = false;
            ChkbxAuctionWalkthrough.Checked = false;
            ChkbxAuctionWalkthrough_CheckedChanged(sender, e);
            rblLookat.ClearSelection();
            ChkbxPickup.Checked = false;
            ChkbxTrash.Checked = false;
            ChkbxTrash_CheckedChanged(sender, e);
            txtTrashDescription.Text = "";
            ChkbxPhotos.Checked = false;
            ChkbxItems.Checked = false;
        }
    }
}
