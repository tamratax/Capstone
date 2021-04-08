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
    public partial class AuctionAssessment : System.Web.UI.Page
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
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + TicketOPenDate 'Services' from ServiceTicket where ServiceType = 'Auction' AND customerID = " + Session["SelectedCustomerID"].ToString();


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLType.DataSource = dtForDdlServiceList;
                    DDLType.DataBind();

                    //Make Divs Invisible
                    divapartment.Visible = false;
                    divstorageinfo.Visible = false;
                    divbusiness.Visible = false;
                    divbuttons.Visible = false;


                    divgeneralinfo.Visible = false;
                    divspecial.Visible = false;
                    divvehicles.Visible = false;
                    divsave.Visible = false;
                    divcharges.Visible = false;


                    //Blankoption
                    ListItem blankOption = new ListItem("Select", "-1");
                    DDLTypeofHome.Items.Insert(0, blankOption);
                    DDLTypeofHome.SelectedIndex = 0;
                }
            }
        }

        protected void btnInventory_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = false;
            divBoxes.Visible = false;
            divInventory.Visible = true;

        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            string sqlService = "INSERT INTO Inventory (ItemName, ItemDescription, ItemCost, ServiceTicketID) VALUES (@ItemName, @ItemDescription, @ItemCost, @ServiceTicketID)";
            //Define the Connection to the Database
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            // Create the SQL Command object which will send the query
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect1;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlService;


            sqlCommand1.Parameters.Add(new SqlParameter("@ItemName", HttpUtility.HtmlEncode(txtItemName.Text)));
            sqlCommand1.Parameters.Add(new SqlParameter("@ItemDescription", HttpUtility.HtmlEncode(txtItemDescription.Text)));
            sqlCommand1.Parameters.Add(new SqlParameter("@ItemCost", HttpUtility.HtmlEncode(txtItemCost.Text)));
            sqlCommand1.Parameters.Add(new SqlParameter("@ServiceTicketID", DDLType.SelectedValue.ToString()));

            sqlConnect1.Open();
            SqlDataReader queryResults1 = sqlCommand1.ExecuteReader();

            // Close all related connections
            sqlConnect1.Close();
            gridInventory.DataBind();

            txtItemName.Text = "";
            txtItemDescription.Text = "";
            txtItemCost.Text = "";
        }

        protected void DDLType_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;
        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                
                String sqlQueryService = "SELECT * FROM ServiceTicket WHERE ServiceTicketID = @ServiceTicketID";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(sqlQueryService, sqlConnect);

                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
                com.ExecuteNonQuery();

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter();
                sqlAdapterService.SelectCommand = com;
                DataTable dtforMoveInfo = new DataTable();
                sqlAdapterService.Fill(dtforMoveInfo);

                if (dtforMoveInfo.Rows[0]["AuctionAssessmentID"].ToString() != "")
                {
                    divbuttons.Visible = true;
                }
                else
                {

                    BtnMoveInfo.Visible = true;
                    LblMoveInfo.Visible = true;
                }


                sqlConnect.Close();

            }
            catch
            {

            }
        }

        protected void DDLTypeofHome_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLTypeofHome.SelectedIndex == 1)
            {
                divapartment.Visible = true;

                divstorageinfo.Visible = false;
                divbusiness.Visible = false;
            }
            if (DDLTypeofHome.SelectedIndex == 3)
            {
                divstorageinfo.Visible = true;
                divapartment.Visible = false;

                divbusiness.Visible = false;
            }
            if (DDLTypeofHome.SelectedIndex == 4)
            {
                divbusiness.Visible = true;
                divapartment.Visible = false;
                divstorageinfo.Visible = false;

            }
        }

        protected void BtnGeneralInfo_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = true;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = true;
            divcharges.Visible = false;
            divBoxes.Visible = false;
            divInventory.Visible = false;
        }

        protected void BtnVehicles_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = true;
            divsave.Visible = false;
            divcharges.Visible = false;
            divBoxes.Visible = false;
            divInventory.Visible = false;
        }

        protected void BtnSpecialEquipment_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = true;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = false;
            divBoxes.Visible = false;
            divInventory.Visible = false;
        }

        protected void BtnCharge_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = true;
            divBoxes.Visible = false;
            divInventory.Visible = false;
        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = false;
            divBoxes.Visible = true;
            divInventory.Visible = false;
        }


        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string additionalinfo = "";
            //try
            //{
            string query = "UPDATE [AuctionAssessment] SET NumberOfStories = @NumberofStories, DistanceFromTruck = @DistanceFromTruck, TypeOfHome = @TypeofHome, TypeofHomeAdd = @TypeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse from AuctionAssessment join ServiceTicket on AuctionAssessment.AuctionAssessmentID = ServiceTicket.AuctionAssessmentID WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("NumberOfStories", txtStories.Text);
            com.Parameters.AddWithValue("DistanceFromTruck", TxtDistance.Text);
            com.Parameters.AddWithValue("TypeOfHome", DDLTypeofHome.SelectedValue);
            if (DDLTypeofHome.SelectedIndex == 1)
            {
                additionalinfo = "Apartment Floor:" + txtWhichFloor.Text + "\nElevator?: " + TxtElevator.Text + "\nWalk to Elevator:" + TxtElevatorWalk.Text;
            }
            else if (DDLTypeofHome.SelectedIndex == 3)
            {
                additionalinfo = TxtStorage.Text;
            }
            else if (DDLTypeofHome.SelectedIndex == 4)
            {
                additionalinfo = TxtBusiness.Text;
            }
            else
            {
                additionalinfo = "";
            }
            com.Parameters.AddWithValue("TypeAdd", additionalinfo);

            com.Parameters.AddWithValue("TruckAccessibility", TxtAccessibility.Text);
            com.Parameters.AddWithValue("LoadingDoorWalk", TxtConditions.Text);
            com.Parameters.AddWithValue("StepsToHouse", TxtSteps.Text);
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com.ExecuteNonQuery();
            sqlConnect.Close();

            DTLAuctionInfo.DataBind();

            LblSuccess.Text = "Auction Information Added";

            //}
            //catch
            //{
            //    LblSuccess.Text = "Database Error!";
            //}
        }

        protected void DDLSpecial_DataBound(object sender, EventArgs e)
        {
            ListItem blankOption = new ListItem("Select", "-1");
            DDLSpecial.Items.Insert(0, blankOption);
            DDLSpecial.SelectedIndex = 0;
        }

        protected void BtnSpecial_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO [SPECIALEQUIPMENT] (EquipmentType, Quantity, ServiceTicketID) Values (@EquipmentType, @Quantity, @ServiceTicketID)";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("EquipmentType", DDLSpecial.SelectedValue.ToString());
            com.Parameters.AddWithValue("Quantity", TxtQuantitySpecial.Text);
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com.ExecuteNonQuery();
            sqlConnect.Close();


            grvEquip.DataBind();
        }

        protected void DDLVehicle_DataBound(object sender, EventArgs e)
        {
            ListItem blankOption = new ListItem("Select", "-1");
            DDLVehicle.Items.Insert(0, blankOption);
            DDLVehicle.SelectedIndex = 0;
        }

        protected void BtnAddCar_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [ServiceTicketEQUIPMENT] (EquipmentID, ServiceTicketID) Values (@EquipmentID, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EquipmentID", DDLVehicle.SelectedValue.ToString());
                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.ForeColor = Color.Green;
                LblStatus.Text = "Vehicle sucessfully added!";
                grdvwvehicles.DataBind();

            }
            catch
            {
                LblStatus.ForeColor = Color.Red;
                LblStatus.Text = "Vehicle Already Added!";
            }
        }



        protected void BtnMoveInfo_Click(object sender, EventArgs e)
        {
            //creates blank moveassessment
            string query = "INSERT INTO [AuctionAssessment] (stepstohouse) VALUES ('')";



            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);


            com.ExecuteNonQuery();
            sqlConnect.Close();

            //Adds moveassessment id to serviceticket
            string query1 = "UPDATE Serviceticket set AuctionassessmentID = (select TOP 1 AuctionassessmentID from AuctionAssessment order by AuctionassessmentID desc) where ServiceTIcketID = " + DDLType.SelectedValue.ToString();

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);


            com1.ExecuteNonQuery();
            sqlConnect1.Close();


            string query2 = "INSERT INTO [AUCTIONCHARGES] (ServiceTicketID) VALUES (@ServiceTicketID)";

            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect2.Open();
            SqlCommand com2 = new SqlCommand(query2, sqlConnect2);

            com2.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com2.ExecuteNonQuery();
            sqlConnect2.Close();

            grdCharges.DataBind();


            BtnMoveInfo.Visible = false;
            LblMoveInfo.Visible = false;
            divbuttons.Visible = true;
        }

        protected void btnChargesSave_Click(object sender, EventArgs e)
        {
            //Calculate Total Charges
            double totalCharges = Convert.ToDouble(txtPickupFee.Text) + Convert.ToDouble(txtConsignmentRate.Text) + Convert.ToDouble(TxtTrashRemoval.Text) +
               Convert.ToDouble(txtAdditionalFees.Text);


            string query = "UPDATE AUCTIONCHARGES SET PickupFee = @PickupFee, ConsignmentRate = @ConsignmentRate, TrashRemovalFee = @TrashRemovalFee, AdditionalFees = @AdditionalFees, TotalCharges = @TotalCharges WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.Add(new SqlParameter("@PickupFee", HttpUtility.HtmlEncode(txtPickupFee.Text)));
            com.Parameters.Add(new SqlParameter("@ConsignmentRate", HttpUtility.HtmlEncode(txtConsignmentRate.Text)));
            com.Parameters.Add(new SqlParameter("@TrashRemovalFee", HttpUtility.HtmlEncode(TxtTrashRemoval.Text)));
            com.Parameters.Add(new SqlParameter("@AdditionalFees", HttpUtility.HtmlEncode(txtAdditionalFees.Text)));
            com.Parameters.Add(new SqlParameter("@TotalCharges", totalCharges.ToString()));

            com.ExecuteNonQuery();
            sqlConnect.Close();
            grdCharges.DataBind();

        }

        protected void btnAddBox_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [AuctionBOXES] (BoxType, BoxQuantity, ServiceTicketID) Values (@BoxType, @BoxQuantity, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("@BoxType", ddlBoxType.SelectedValue.ToString());
                com.Parameters.Add(new SqlParameter("@BoxQuantity", HttpUtility.HtmlEncode(TxtQty.Text)));
                com.Parameters.AddWithValue("@ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Box successfully added!";
                grvRoomBoxes.DataBind();

                ddlBoxType.SelectedIndex = 0;
                TxtQty.Text = "";

            }
            catch
            {
                LblStatus.Text = "Database Error";
            }
        }
    }


}