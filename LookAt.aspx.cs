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
    public partial class LookAt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadButton_Click(object sender, EventArgs e)
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
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //Check to see if customer is in the database
            String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name', email, homephone, workphone, cellphone from customer WHERE FirstName + ' ' +  LastName like @Name";



            //Establishes the connection between our web form and database
            SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //Creates sqlcommand with query and email parameter for security
            SqlCommand sqlCommandInsert = new SqlCommand();
            sqlCommandInsert.Connection = sqlConnectDuplicate;
            sqlCommandInsert.CommandType = CommandType.Text;
            sqlCommandInsert.CommandText = sqlQueryDuplicate;
            sqlCommandInsert.Parameters.Add(new SqlParameter("@Name", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));


            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GridViewCustomers.DataSource = dtForDuplicate;
            GridViewCustomers.DataBind();
            GridViewCustomers.Visible = true;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sqlQuery = "Select SERVICETICKETID, ServiceDate, CompletionDate, ServiceType from ServiceTicket WHERE CustomerID = @CustomerID";
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com = new SqlCommand();
            com.Connection = sqlConnect;
            com.CommandType = CommandType.Text;
            com.CommandText = sqlQuery;
            com.Parameters.Add(new SqlParameter("@CustomerID", GridViewCustomers.SelectedDataKey.Value.ToString()));

            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(com);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GrdServices.DataSource = dtForDuplicate;
            GrdServices.DataBind();
            GrdServices.Visible = true;

        }

        protected void GrdServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Count serviceticketIDs in DB
            //string check = "select *  from LookAt where ServiceTicketID =" + GrdServices.SelectedValue;
            //SqlConnection sqlConnectAddress1 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            //SqlDataAdapter sqlAdapterAddress1 = new SqlDataAdapter(check, sqlConnectAddress1);

            //DataTable checkdt = new DataTable();
            //sqlAdapterAddress1.Fill(checkdt);
            //if (checkdt.Rows.Count == 1)
            //{
            //Check to see if the service already has a look at

            string sqlquer3 = "Select TruckAccess, Supplies, Boxes, Crew, Trucks from LookAt where CustomerID =" + GridViewCustomers.SelectedValue + " AND ServiceTicketID =" + GrdServices.SelectedValue;

            SqlConnection sqlConnectAddress = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapterAddress = new SqlDataAdapter(sqlquer3, sqlConnectAddress);



            DataTable dt = new DataTable();
            sqlAdapterAddress.Fill(dt);



            if (dt.Rows.Count != 0)
            {

                TruckAccTxt.Text = Convert.ToString(dt.Rows[0]["TruckAccess"]);
                SuppliesTxt.Text = Convert.ToString(dt.Rows[0]["Supplies"]);
                BoxesTxt.Text = Convert.ToString(dt.Rows[0]["Boxes"]);
                CrewTxt.Text = Convert.ToString(dt.Rows[0]["Crew"]);
                TrucksTxt.Text = Convert.ToString(dt.Rows[0]["Trucks"]);
            }


            sqlConnectAddress.Close();
            //sqlConnectAddress1.Close();





            //}



        }

        protected void Save_Click(object sender, EventArgs e)
        {

            //Count serviceticketIDs in DB
            string check = "select *  from LookAt where ServiceTicketID =" + GrdServices.SelectedValue;
            SqlConnection sqlConnectAddress1 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");
            SqlDataAdapter sqlAdapterAddress1 = new SqlDataAdapter(check, sqlConnectAddress1);

            DataTable checkdt = new DataTable();
            sqlAdapterAddress1.Fill(checkdt);

            if (checkdt.Rows.Count == 1)
            {
                //Check to see if the service already has a look at

                //string sqlquer3 = "Select TruckAccess, Supplies, Boxes, Crew, Trucks from LookAt where CustomerID =" + GridViewCustomers.SelectedValue + " AND ServiceTicketID =" + GrdServices.SelectedValue;

                //SqlConnection sqlConnectAddress = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                ////The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                //SqlDataAdapter sqlAdapterAddress = new SqlDataAdapter(sqlquer3, sqlConnectAddress);



                //DataTable dt = new DataTable();
                //sqlAdapterAddress.Fill(dt);



                //if (checkdt.Rows.Count != 0)

                //    TruckAccTxt.Text = Convert.ToString(checkdt.Rows[0]["TruckAccess"]);
                //SuppliesTxt.Text = Convert.ToString(checkdt.Rows[0]["Supplies"]);
                //BoxesTxt.Text = Convert.ToString(checkdt.Rows[0]["Boxes"]);
                //CrewTxt.Text = Convert.ToString(checkdt.Rows[0]["Crew"]);
                //TrucksTxt.Text = Convert.ToString(checkdt.Rows[0]["Trucks"]);



                //update command
                string sqlquery2 = "UPDATE LookAt SET TruckAccess = @TruckAccess, Supplies = @Supplies, Boxes = @Boxes, Crew = @Crew, Trucks = @Trucks WHERE ServiceTicketID = @ServiceTicketID ";

                SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand sqlCommand2 = new SqlCommand();
                sqlCommand2.Connection = sqlConnect2;
                sqlConnect2.Open();
                sqlCommand2.CommandType = CommandType.Text;
                sqlCommand2.CommandText = sqlquery2;
                sqlCommand2.Parameters.Add(new SqlParameter("@TruckAccess", HttpUtility.HtmlEncode(TruckAccTxt.Text)));
                sqlCommand2.Parameters.Add(new SqlParameter("@Supplies", HttpUtility.HtmlEncode(SuppliesTxt.Text)));
                sqlCommand2.Parameters.Add(new SqlParameter("@Boxes", HttpUtility.HtmlEncode(BoxesTxt.Text)));
                sqlCommand2.Parameters.Add(new SqlParameter("@Crew", HttpUtility.HtmlEncode(CrewTxt.Text)));
                sqlCommand2.Parameters.Add(new SqlParameter("@Trucks", HttpUtility.HtmlEncode(TrucksTxt.Text)));
                sqlCommand2.Parameters.Add(new SqlParameter("@ServiceTicketID", HttpUtility.HtmlEncode(GrdServices.SelectedValue)));

                SqlDataReader queryResults = sqlCommand2.ExecuteReader();
                //sqlConnectAddress.Close();
                sqlConnect2.Close();

                LblSaveStatus.Text = "Look At Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;


            }
            else
            {

                //insert textbox values into the DB
                string sqlQuery = "insert into LookAt Values(@TruckAccess, @Supplies, @Boxes, @Crew, @Trucks, @CustomerID, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                sqlCommand.Parameters.Add(new SqlParameter("@TruckAccess", HttpUtility.HtmlEncode(TruckAccTxt.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Supplies", HttpUtility.HtmlEncode(SuppliesTxt.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Boxes", HttpUtility.HtmlEncode(BoxesTxt.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Crew", HttpUtility.HtmlEncode(CrewTxt.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Trucks", HttpUtility.HtmlEncode(TrucksTxt.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(GridViewCustomers.SelectedValue)));
                sqlCommand.Parameters.Add(new SqlParameter("@ServiceTicketID", HttpUtility.HtmlEncode(GrdServices.SelectedValue)));

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();


                LblSaveStatus.Text = "Look At Saved Successfully";
                LblSaveStatus.ForeColor = Color.Green;

                //other side if else

                ////update command
                //string sqlquery2 = "UPDATE LookAt SET TruckAccess = @TruckAccess, Supplies = @Supplies, Boxes = @Boxes, Crew = @Crew, Trucks = @Trucks, CustomerID = @CustomerID, ServiceTicketID = @ServiceTicketID)";

                //SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                //SqlCommand sqlCommand2 = new SqlCommand();
                //sqlCommand2.Connection = sqlConnect2;
                //sqlCommand2.CommandType = CommandType.Text;
                //sqlCommand2.CommandText = sqlquery2;
                //sqlCommand2.Parameters.Add(new SqlParameter("@TruckAccess", HttpUtility.HtmlEncode(TruckAccTxt.Text)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@Supplies", HttpUtility.HtmlEncode(SuppliesTxt.Text)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@Boxes", HttpUtility.HtmlEncode(BoxesTxt.Text)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@Crew", HttpUtility.HtmlEncode(CrewTxt.Text)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@Trucks", HttpUtility.HtmlEncode(TrucksTxt.Text)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(GridViewCustomers.SelectedValue)));
                //sqlCommand2.Parameters.Add(new SqlParameter("@ServiceTicketID", HttpUtility.HtmlEncode(GrdServices.SelectedValue)));

                
            }
            sqlConnectAddress1.Close();


        }
    }
}