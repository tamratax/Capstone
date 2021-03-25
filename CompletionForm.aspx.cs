using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace Lab3
{
    public partial class CompletionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Sets Vehicle list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DDLTravel.Items.Insert(0, blankOption);
                DDLTravel.SelectedIndex = 0;

                if (Session["SelectedCustomerID"] != null)
                {
                    //Pulling in customer's record
                    String sqlQuery = "Select FirstName + ' ' + LastName as Name from customer where customerid = " + Session["SelectedCustomerID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    LblSelected.Text = Convert.ToString(dtForSelect.Rows[0]["Name"]);
                    LblID.Text = Session["SelectedCustomerID"].ToString();

                    //Populates service Ddl
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + Session["SelectedCustomerID"].ToString();


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLType.DataSource = dtForDdlServiceList;
                    DDLType.DataBind();
                }
                else
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");

                }
            


            }
        }

        //protected void DDLCust_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (DDLCust.SelectedValue != "-1")
        //        {
        //            //Populates service Ddl
        //            DDLType.DataTextField = "Services";
        //            DDLType.DataValueField = "ServiceTicketID";

        //            String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + Session["SelectedCustomerID"].ToString();


        //            SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

        //            SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

        //            DataTable dtForDdlServiceList = new DataTable();
        //            sqlAdapterService.Fill(dtForDdlServiceList);

        //            DDLType.DataSource = dtForDdlServiceList;
        //            DDLType.DataBind();
        //        }

        //    }
        //    catch
        //    {
        //        LblStatus.Text = "Database Error!";
        //    }
        //}

        //protected void DDLCust_DataBound(object sender, EventArgs e)
        //{
        //    //Sets Service list ddl to default of select
        //    ListItem blankOption = new ListItem("Select", "-1");
        //    DDLCust.Items.Insert(0, blankOption);
        //    DDLCust.SelectedIndex = 0;
        //}

        protected void DDLType_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;
        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridCust.Visible = true;
            GridAddress.Visible = true;
            GridEmployee.Visible = true;
            GridTravel.Visible = true;

        }

        protected void Drplst_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Drplst_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            Drplst.Items.Insert(0, blankOption);
            Drplst.SelectedIndex = 0;
        }

        protected void BtnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [MOVEEMPLOYEES] (EmployeeID, EmployeeName, ServiceTicketID) Values (@EmployeeID, @EmployeeName, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EmployeeID", Drplst.SelectedValue.ToString());
                com.Parameters.AddWithValue("EmployeeName", Drplst.SelectedItem.ToString());
                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Item sucessfully added!";
                GridEmployee.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }



        }

        protected void DDLPaynentType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DDLPaynentType_DataBound(object sender, EventArgs e)
        {

        }

        protected void BtnCalculate_Click(object sender, EventArgs e)
        {
            //try
            //{
            string query = "INSERT INTO [CHARGES] (Hours, Amount, Total, ServiceTicketID) Values (@Hours, @Amount, @Total, @ServiceTicketID)";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("Hours", HttpUtility.HtmlEncode(TxtCharge.Text.ToString()));
            com.Parameters.AddWithValue("Amount", HttpUtility.HtmlEncode(TxtAmount.Text.ToString()));
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            double total = Convert.ToDouble(TxtCharge.Text) * Convert.ToDouble(TxtAmount.Text);
            com.Parameters.AddWithValue("Total", total);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            LblStatus.Text = "Item sucessfully added!";
            GridCharges.DataBind();

            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error!";
            //}
        }

        protected void BtnSupplies_Click(object sender, EventArgs e)
        {
            //try
            //{

            //Pulling in customer's record
            string query2 = "SELECT SUM(Total) sum FROM CHARGES WHERE ServiceTicketID = " + DDLType.SelectedValue.ToString();

            //Establishes the connection between our web form and database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(query2, sqlConnect);

            //This creates a datatable and fills it
            DataTable dtForSelect = new DataTable();
            sqlAdapter.Fill(dtForSelect);



            double queryresults = Convert.ToDouble(dtForSelect.Rows[0]["sum"]);
            if (TxtSupplies.Text == "")
            {
                TxtSupplies.Text = "0";
            }
            double trueTotal = Convert.ToDouble(TxtSupplies.Text) + Convert.ToDouble(queryresults);
            LblCalculate.Text = "$"+trueTotal.ToString();



            sqlConnect.Close();

            LblStatus.Text = "Item sucessfully added!";


            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error!";
            //}
        }

        protected void DDLVehicle_DataBound(object sender, EventArgs e)
        {
            //Sets Vehicle list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLVehicle.Items.Insert(0, blankOption);
            DDLVehicle.SelectedIndex = 0;

        }

        protected void BtnAddVehicle_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [MOVEEQUIPMENT] (EquipmentID, EquipmentType, Mileage, ServiceTicketID) Values (@EquipmentID, @EquipmentType, @Mileage, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EquipmentID", DDLVehicle.SelectedValue.ToString());
                com.Parameters.AddWithValue("EquipmentType", DDLVehicle.SelectedItem.ToString());
                com.Parameters.AddWithValue("Mileage", TxtMileage.Text);
                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Equipment sucessfully added!";
                grdvwvehicles.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

       

        protected void BtnAddAddress_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [ADDRESS] (CustomerID, ServiceTicketID, Street, City, State, Zip, Description) Values (@CustomerID, @ServiceID, @Street, @City, @State, @Zip, @Description)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("CustomerID", Session["SelectedCustomerID"].ToString());
                com.Parameters.AddWithValue("ServiceID", DDLType.SelectedValue.ToString());
                com.Parameters.AddWithValue("Street", TxtStreet.Text);
                com.Parameters.AddWithValue("City", TxtCity.Text);
                com.Parameters.AddWithValue("State", TxtState.Text);
                com.Parameters.AddWithValue("Zip", TxtZip.Text);
                com.Parameters.AddWithValue("Description", TxtDescription.Text);


                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Address sucessfully added!";
                GridAddresses.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void DDLTravel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLTravel.SelectedIndex == 1)
            {
                lblStart.Visible = true;
                lblEnd.Visible = true;
                lblhrs.Visible = true;
                TxtStart.Visible = true;
                Txtend.Visible = true;
                txthrs.Visible = true;


                lblStart.Text = "Travel Time Start: ";
                lblEnd.Text = "Travel Time End: ";
                lblhrs.Text = "Hours: ";
            }
            else
            {
                if (DDLTravel.SelectedIndex == 2)
                {
                    lblStart.Visible = true;
                    lblEnd.Visible = true;
                    lblhrs.Visible = true;
                    TxtStart.Visible = true;
                    Txtend.Visible = true;
                    txthrs.Visible = true;

                    lblStart.Text = "Load Time Start: ";
                    lblEnd.Text = "Load Time End: ";
                    lblhrs.Text = "Hours: ";
                }
                else
                {
                    if (DDLTravel.SelectedIndex == 3)
                    {
                        lblStart.Visible = true;
                        lblEnd.Visible = true;
                        lblhrs.Visible = true;
                        TxtStart.Visible = true;
                        Txtend.Visible = true;
                        txthrs.Visible = true;

                        lblStart.Text = "Unload Time Start: ";
                        lblEnd.Text = "Unload Time End: ";
                        lblhrs.Text = "Hours: ";
                    }
                    else
                    {

                    }
                }
            }
        }

        protected void DDLTravel_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void btntravel_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [TRAVEL] (Description, StartTime, EndTime, Hours, ServiceTicketID) Values (@Description, @StartTime, @EndTime, @Hours, @ServiceID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("Description", DDLTravel.SelectedValue.ToString());
                com.Parameters.AddWithValue("StartTime", TxtStart.Text);
                com.Parameters.AddWithValue("EndTime", Txtend.Text);
                com.Parameters.AddWithValue("Hours", txthrs.Text);
                com.Parameters.AddWithValue("ServiceID", DDLType.SelectedValue.ToString());
        

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Tracel Log sucessfully updated!";
                GridTravel.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void GridTravel_DataBound(object sender, EventArgs e)
        {
            string query2 = "SELECT SUM(Hours) sum FROM TRAVEL WHERE ServiceTicketID = " + DDLType.SelectedValue.ToString();

            //Establishes the connection between our web form and database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(query2, sqlConnect);

            //This creates a datatable and fills it
            DataTable dtForSelect = new DataTable();
            sqlAdapter.Fill(dtForSelect);

            if (dtForSelect.Rows[0]["sum"] != DBNull.Value)
            {
                double queryresults = Convert.ToDouble(dtForSelect.Rows[0]["sum"]);

                double trueTotal = Convert.ToDouble(queryresults);
                lblcalculatehrs.Text = trueTotal.ToString();
            }
            else
            {

            }

           
            sqlConnect.Close();
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            //try
            //{
                string query = "INSERT INTO [PAYMENT] (PaymentType, Cost, AdditionalExpenses, CompleteStatus, ServiceTicketID) Values (@PaymentType, @Cost, @AdditionalExpenses, @CompleteStatus, @ServiceID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("PaymentType", DDLPaymentType.SelectedValue.ToString());
                com.Parameters.AddWithValue("Cost", TxtFinalCost.Text);
                com.Parameters.AddWithValue("AdditionalExpenses", TxtAdditionalExpense.Text);
                string completed = "";
                if (ChkBoxPayment.Checked)
                {
                    completed = "Yes";
                }
                else
                {
                    completed = "No";
                }
                com.Parameters.AddWithValue("CompleteStatus", completed);
                com.Parameters.AddWithValue("ServiceID", DDLType.SelectedValue.ToString());


                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Payment sucessfully added!";

                GridPayment.DataBind();





            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error!";
            //}
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO [COMPLETED] (CompletedDate, ServiceTicketID, CustomerID) Values (@CompletedDate, @ServiceTicketID, @CustomerID)";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("CompletedDate", System.DateTime.Today.ToString("yyyy-MM-dd"));
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue);
            com.Parameters.AddWithValue("CustomerID", Session["SelectedCustomerID"].ToString());

            var fromAddress = new MailAddress("RoCoConsulting1@gmail.com", "From RoCoConsulting");
            var toAddress = new MailAddress("meharida@dukes.jmu.edu", "To Name");
            const string fromPassword = "RoCo703757";
            const string subject = "Completion Form has been Completed!";
            const string body = "Thank you for your business," +
                " We would be very greatful if you could fill out our survey and let us know how we did." +
                "https://forms.gle/xo8Wt5nk1bnUidX66";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress) { Subject = subject, Body = body })
            {
                smtp.Send(message);
            }


            com.ExecuteNonQuery();
            sqlConnect.Close();
        }
    }
}