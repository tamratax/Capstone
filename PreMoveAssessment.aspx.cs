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
    public partial class PreMoveAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SelectedCustomerID"] == null)
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("Navigation.aspx");


            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "insert into MoveAssessment values (@MustBeOut, @Range1, @Range2, @DestAddress, @DestCity, @DestState, @DestZipCode, @MlSListing, @SendPhotos, @Packing,@TrashRemoval,@TrashRemovalDescription, @Donation, @Auction, @CustomerID )";
            //Define the Connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlCommand.Parameters.Add(new SqlParameter("@MustBeOut", HttpUtility.HtmlEncode(DateOutTxt.Text)));
          

            sqlCommand.Parameters.Add(new SqlParameter("@Range1", HttpUtility.HtmlEncode(TxtRange1.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Range2", HttpUtility.HtmlEncode(TxtRange2.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@DestAddress", HttpUtility.HtmlEncode(DestAddressTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@DestCity", HttpUtility.HtmlEncode(DestCityTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@DestState", HttpUtility.HtmlEncode(DestStateTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@DestZipCode", HttpUtility.HtmlEncode(DestZipTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@MlSListing", HttpUtility.HtmlEncode(MLSBTN.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@SendPhotos", HttpUtility.HtmlEncode(PhotosBtn.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@Packing", HttpUtility.HtmlEncode(PackingChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashRemoval", HttpUtility.HtmlEncode(TrashChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@TrashRemovalDescription", HttpUtility.HtmlEncode(TrashDescriptionTxt.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Donation", HttpUtility.HtmlEncode(DonationChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@Auction", HttpUtility.HtmlEncode(AuctionChk.Checked)));
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));


            // Open your connection, send the query 
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            // Close all related connections
            sqlConnect.Close();

            string sqlService = "INSERT INTO ServiceTicket (CustomerID, ServiceDate, PotentialDate, ServiceType) VALUES (@CustomerID, @ServiceDate, @PotentialDate, @ServiceType)";
            //Define the Connection to the Database
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect1;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlService;

            sqlCommand1.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand1.Parameters.Add(new SqlParameter("@PotentialDate", HttpUtility.HtmlEncode(DateOutTxt.Text)));
            sqlCommand1.Parameters.Add(new SqlParameter("@ServiceType", "Move"));
            sqlCommand1.Parameters.Add(new SqlParameter("@ServiceDate", DateTime.Now.ToString("dd/MM/yyyy")));

            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();

            // Close all related connections
            sqlConnect1.Close();







            if (AuctionChk.Checked)
            {
                LblSaveStatus.Text = "Move Assessment Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;
                Response.Redirect("AddServiceOrder.aspx");
            }
            else
            {
                LblSaveStatus.Text = "Move Assessment Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
        }

        protected void TrashChk_CheckedChanged(object sender, EventArgs e)
        {
            if (TrashChk.Checked)
            {
                TrashDescriptionTxt.Visible = true;
            }

        }
    }
}