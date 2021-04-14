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
    public partial class CustomerAppraisel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checks to see if there is a customer selected
            if (Session["SelectedCustomerID"] == null)
            {
                Session["NoCustSelected"] = "true";
                Response.Redirect("CustomerPortal.aspx");


            }

            DeadlineHidden.Visible = false;
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
        protected void BtnUploadPhotos_Click(object sender, EventArgs e)
        {
            if (FilesUpload.HasFile)
                foreach (HttpPostedFile uploadedFile in FilesUpload.PostedFiles)
                    try
                    {
                        uploadedFile.SaveAs(Server.MapPath("~/uploads/") +
                                            uploadedFile.FileName);
                        FileUploadedList.Text += "File name: " +
                           uploadedFile.FileName + "<br>" +
                           uploadedFile.ContentLength + " kb<br>" +
                           "Content type: " + uploadedFile.ContentType + "<br><br>";
                    }
                    catch (Exception ex)
                    {
                        FileUploadedList.Text = "ERROR: " + ex.Message.ToString();
                    }
            else
            {
                FileUploadedList.Text = "You have not specified a file.";
            }
        }
        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            ChkBoxEstate.Checked = true;
            ChkBoxDeadline.Checked = true;
            DeadlineHidden.Visible = true;
            TxtDeadline.Visible = true;
            TxtDeadline.Text = "2021-03-04";
            TxtAppraisalSize.Text = "We have a room of old war collectibles! 200 plus items";
            TxtInventory.Text = "10 guns, 3 helmets, 50 pins, lots of smaller things";
            ChkBoxMove.Checked = true;
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ChkBoxEstate.Checked = false;
            ChkBoxDeadline.Checked = false;
            DeadlineHidden.Visible = false;
            TxtDeadline.Text = "";
            TxtAppraisalSize.Text = "";
            TxtInventory.Text = "";
            ChkBoxMove.Checked = false;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            //try
            //{
                //Inserts service order
                String sqlQuery = "insert into Appraisal values (@Estate, @FamilyDivision, @Deadline, @DeadlineDate, @AppraisalSize, @Inventory, @MoveAssessment, @AuctionAssessment)";

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
                //sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));


                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                LblSaveStatus.Text = "Appraisal Service Order Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            //catch
            //{
            //    LblSaveStatus.Text = "Error Saving Appraisal Service Order";
            //    LblSaveStatus.ForeColor = Color.Red;
            //}
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerServiceChoice.aspx");
        }
       

    }
    }
