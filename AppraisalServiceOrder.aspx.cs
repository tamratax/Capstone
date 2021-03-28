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
    public partial class AppraisalServiceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checks to see if there is a customer selected
            if (Session["SelectedCustomerID"] == null)
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("Navigation.aspx");


            }

            DeadlineHidden.Visible = false;


            if (!IsPostBack)
            {
                //Sets lable to Session ID of selected user so we can reference it for this form
                //LblSelectedSessionID.Text = Session["SelectedCustomerID"].ToString();



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

      

       

        protected void ChkBoxDeadline_CheckedChanged(object sender, EventArgs e)
        {
            

                if (ChkBoxDeadline.Checked)
                {
                    DeadlineHidden.Visible = true;
                }
                else
                {
                    DeadlineHidden.Visible = false;
                    TxtDeadline.Text = "";
                }
            
        }

     
        protected void BtnOutlook_Click(object sender, EventArgs e)
        {
           
        }

        protected void BtnUploadPhotos_Click(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            try
            {
                //Inserts service order
                String sqlQuery = "insert into Appraisal values (@Estate, @FamilyDivision, @Deadline, @DeadlineDate, @AppraisalSize, @Inventory, @MoveAssessment, @AuctionAssessment, @CustomerID)";

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                //Parameterizes all the strings
                sqlCommand.Parameters.Add(new SqlParameter("@Estate", ChkBoxEstate.Checked.ToString()));
                sqlCommand.Parameters.Add(new SqlParameter("@FamilyDivision", ChkBoxFamily.Checked.ToString()));
                sqlCommand.Parameters.Add(new SqlParameter("@Deadline", ChkBoxDeadline.Checked.ToString()));
                if (TxtDeadline != null)
                {
                    sqlCommand.Parameters.Add(new SqlParameter("@DeadlineDate", HttpUtility.HtmlEncode(TxtDeadline.Text)));
                }
                sqlCommand.Parameters.Add(new SqlParameter("@AppraisalSize", HttpUtility.HtmlEncode(TxtAppraisalSize.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Inventory", HttpUtility.HtmlEncode(TxtInventory.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@MoveAssessment", ChkBoxMove.Checked.ToString()));
                sqlCommand.Parameters.Add(new SqlParameter("@AuctionAssessment", ChkBoxAuction.Checked.ToString()));
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));


                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                LblSaveStatus.Text = "Appraisal Service Order Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
            catch
            {
                LblSaveStatus.Text = "Error Saving Appraisal Service Order";
                LblSaveStatus.ForeColor = Color.Red;
            }
            
        }

       
    }
}