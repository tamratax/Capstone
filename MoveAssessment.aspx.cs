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
    public partial class MoveAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedCustomerID"] != null)
                {
                    lblselected.Text = Session["SelectedCustomerName"].ToString();

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


                   
                    LblID.Text = Session["SelectedCustomerID"].ToString();

                    //Populates service Ddl
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + TicketOPenDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + Session["SelectedCustomerID"].ToString();


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


                    //Blank option for Home DDL
                    ListItem blankOption = new ListItem("Select", "-1");
                    DDLTypeofHome.Items.Insert(0, blankOption);
                    DDLTypeofHome.SelectedIndex = 0;
                }
                else
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");
                }

                divClearSave.Visible = false;
                
            }
        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Selects Service Ticket record based off of what is selected in the DDL
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

                //If Move Assessment doesn't exist for Service Ticket, Makes User create one. 
                if (dtforMoveInfo.Rows[0]["MoveAssessmentID"].ToString() != "")
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

        protected void DDLType_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;           


        }

        protected void DDLVehicle_DataBound(object sender, EventArgs e)
        {
            //Adds Blank Options for the Vehicle DDL
            ListItem blankOption = new ListItem("Select", "-1");
            DDLVehicle.Items.Insert(0, blankOption);
            DDLVehicle.SelectedIndex = 0;
        }

        protected void BtnAddCar_Click(object sender, EventArgs e)
        {
            try
            {
                //Query that adds Service Vehicles to the associated Service Ticket 
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

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string additionalinfo = "";
            try
            {
                //Query that updates Move Assessment table with information customer provides
                string query = "UPDATE [MOVEAssessment] SET NumberOfStories = @NumberofStories, DistanceFromTruck = @DistanceFromTruck, TypeOfHome = @TypeofHome, TypeofHomeAdd = @TypeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse from MOVEAssessment join ServiceTicket on MoveAssessment.MoveAssessmentID = ServiceTicket.MoveAssessmentID WHERE ServiceTicketID = @ServiceTicketID";
                
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("NumberOfStories", TxtNumberofStories.Text);
                com.Parameters.AddWithValue("DistanceFromTruck", TxtDistance.Text);
                com.Parameters.AddWithValue("TypeOfHome", DDLTypeofHome.SelectedValue);
               
                //Fill additional info string based on type of building selected
                if (divapartment.Visible == true)
                {
                    additionalinfo = TxtNumberofStories.Text + "  " + TxtElevator.Text + "  " + TxtElevatorWalk.Text;
                }
                if (divstorageinfo.Visible == true)
                {
                    additionalinfo = TxtStorage.Text;
                }
                if (divbusiness.Visible == true)
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

                DTLMoveInfo.DataBind();

                LblSuccess.Text = "Move Info Added";

            }
            catch
            {
                LblSuccess.Text = "Database Error!";
            }
        }

        protected void DDLTypeofHome_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Changes what textboxes are shown based on type of building selected
            if (DDLTypeofHome.SelectedIndex == 1)
            {
                divapartment.Visible = true;

                divstorageinfo.Visible = false;
                divbusiness.Visible = false;
            }
            if (DDLTypeofHome.SelectedIndex == 2)
            {
                divstorageinfo.Visible = false;
                divapartment.Visible = false;

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
            if (DDLTypeofHome.SelectedIndex == -1)
            {
                divbusiness.Visible = false;
                divapartment.Visible = false;
                divstorageinfo.Visible = false;

            }

        }

        protected void DDLSpecial_DataBound(object sender, EventArgs e)
        {
            //Blank Option for Special Equipment DDL
            ListItem blankOption = new ListItem("Select", "-1");
            DDLSpecial.Items.Insert(0, blankOption);
            DDLSpecial.SelectedIndex = 0;
        }

        protected void BtnSpecial_Click(object sender, EventArgs e)
        {
            //Query that inserts data into SpecialEquipment Table 
            string query = "INSERT INTO [SPECIALEQUIPMENT] (EquipmentType, Quantity, ServiceTicketID) Values (@EquipmentType, @Quantity, @ServiceTicketID)";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("EquipmentType", DDLSpecial.SelectedValue.ToString());
            com.Parameters.AddWithValue("Quantity", TxtQuantitySpecial.Text);
            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com.ExecuteNonQuery();
            sqlConnect.Close();

            //Binds the gridview with the Special Equipment associated with the Move 
            grvEquip.DataBind();
        }

        protected void LblMoveInfo_Click(object sender, EventArgs e)
        {
            //Creates blank moveassessment if one is not generated for the service ticket already 
            string query = "INSERT INTO [MOVEAssessment] (stepstohouse) VALUES (' ')";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);


            com.ExecuteNonQuery();
            sqlConnect.Close();

            //Adds moveassessment id to serviceticket
            string query1 = "UPDATE Serviceticket set MoveassessmentID = (select TOP 1 MoveassessmentID from MoveAssessment order by MoveassessmentID desc) where ServiceTIcketID = " + DDLType.SelectedValue.ToString();

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);


            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            //Creates a Move Charges record associated with the Service Ticket
            string query2 = "INSERT INTO [MOVECHARGES] (ServiceTicketID) VALUES (@ServiceTicketID)";

            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect2.Open();
            SqlCommand com2 = new SqlCommand(query2, sqlConnect2);

            com2.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com2.ExecuteNonQuery();
            sqlConnect2.Close();

            //Makes form accessible once a move assessment has been generated for the service ticket 
            BtnMoveInfo.Visible = false;
            LblMoveInfo.Visible = false;
            divbuttons.Visible = true;
        }

        protected void BtnGeneralInfo_Click(object sender, EventArgs e)
        {
            //Shows the General Information for a Move Assessment 
            divgeneralinfo.Visible = true;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = true;
            divcharges.Visible = false;
            divClearSave.Visible = true;
        }

        protected void BtnVehicles_Click(object sender, EventArgs e)
        {
            //Shows the Vehicle Information for the Move Assessment 
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = true;
            divsave.Visible = false;
            divcharges.Visible = false;
            divClearSave.Visible = false;
        }

        protected void BtnSpecialEquipment_Click(object sender, EventArgs e)
        {
            //Shows the Special Equipment for the Move Assessment 
            divgeneralinfo.Visible = false;
            divspecial.Visible = true;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = false;
            divClearSave.Visible = false;
        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            //Takes user to the Add Room form related to the Move Assessment 
            Session["ServiceTicketID"] = DDLType.SelectedValue.ToString();
            Response.Redirect("AddRoom.aspx");

        }

        protected void BtnMoveEstimate_Click(object sender, EventArgs e)
        {
            //Query that updates the moveestimate for the Move Assessment 
            string query = "UPDATE MOVECHARGES SET MoveEstimate = @MoveEstimate WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.AddWithValue("MoveEstimate", TxtMoveEstimate.Text);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            TxtMoveEstimate.Text = "";

            //Query that updates the totalcharges for the Move Assessment 
            string query1 = "UPDATE MOVECHARGES SET TotalCharges = (COALESCE(MoveEstimate, 0) + COALESCE(FixedRate, 0) + COALESCE(PackingFees, 0) + COALESCE(StorageFees, 0) + COALESCE(TrashRemovalFee, 0)) WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);

            com1.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());


            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            grdCharges.DataBind();
        }

        protected void BtnFixedRate_Click(object sender, EventArgs e)
        {
            //Query that updates the fixed rate for the Move Assessment 
            string query = "UPDATE MOVECHARGES SET FixedRate = @FixedRate WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.AddWithValue("FixedRate", TxtFixedRate.Text);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            TxtFixedRate.Text = "";

            string query1 = "UPDATE MOVECHARGES SET TotalCharges = (COALESCE(MoveEstimate, 0) + COALESCE(FixedRate, 0) + COALESCE(PackingFees, 0) + COALESCE(StorageFees, 0) + COALESCE(TrashRemovalFee, 0)) WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);

            com1.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());


            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            grdCharges.DataBind();
        }

        protected void BtnPackingFee_Click(object sender, EventArgs e)
        {
            //Query that updates the Packing fees for the Move Assessment 
            string query = "UPDATE MOVECHARGES SET PackingFees = @PackingFees WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.AddWithValue("PackingFees", TxtPackingFee.Text);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            string query1 = "UPDATE MOVECHARGES SET TotalCharges = (COALESCE(MoveEstimate, 0) + COALESCE(FixedRate, 0) + COALESCE(PackingFees, 0) + COALESCE(StorageFees, 0) + COALESCE(TrashRemovalFee, 0)) WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);

            com1.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());


            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            grdCharges.DataBind();

            TxtPackingFee.Text = "";
        }

        protected void BtnStorageFee_Click(object sender, EventArgs e)
        {
            //Query that updates the Storage Fees for the Move Assessment 
            string query = "UPDATE MOVECHARGES SET StorageFees = @StorageFees WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.AddWithValue("StorageFees", TxtStorageFee.Text);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            string query1 = "UPDATE MOVECHARGES SET TotalCharges = (COALESCE(MoveEstimate, 0) + COALESCE(FixedRate, 0) + COALESCE(PackingFees, 0) + COALESCE(StorageFees, 0) + COALESCE(TrashRemovalFee, 0)) WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);

            com1.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());


            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            grdCharges.DataBind();

            TxtStorageFee.Text = "";

           
        }

        protected void BtnTrashRemoval_Click(object sender, EventArgs e)
        {
            //Query that updates the Trash Removal Fee for the Move Assessment 
            string query = "UPDATE MOVECHARGES SET TrashRemovalFee = @TrashRemoval WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
            com.Parameters.AddWithValue("TrashRemoval", TxtTrashRemoval.Text);

            com.ExecuteNonQuery();
            sqlConnect.Close();

            TxtTrashRemoval.Text = "";

            string query1 = "UPDATE MOVECHARGES SET TotalCharges = (COALESCE(MoveEstimate, 0) + COALESCE(FixedRate, 0) + COALESCE(PackingFees, 0) + COALESCE(StorageFees, 0) + COALESCE(TrashRemovalFee, 0)) WHERE ServiceTicketID = @ServiceTicketID";

            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect1.Open();
            SqlCommand com1 = new SqlCommand(query1, sqlConnect1);

            com1.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
  

            com1.ExecuteNonQuery();
            sqlConnect1.Close();

            grdCharges.DataBind();
        }

        protected void BtnCharge_Click(object sender, EventArgs e)
        {
            //Displays the Charges information of the Move Assessment 
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = false;
            divcharges.Visible = true;
            divClearSave.Visible = false;

        }

        protected void PopBtn_Click(object sender, EventArgs e)
        {
            //Populates generic data for the page
            DDLTypeofHome.SelectedValue = "House";
            TxtDistance.Text = "25ft";
            TxtAccessibility.Text = "Yes";
            TxtSteps.Text = "5"; 
            TxtConditions.Text = "Gravel driveway, no concerns.";

            TxtMoveEstimate.Text = "250";
            TxtFixedRate.Text = "75";
            TxtPackingFee.Text = "50";
            TxtStorageFee.Text = "50";
            TxtTrashRemoval.Text = "30";
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            //Clears textboxes of the Move Assessment 
            DDLTypeofHome.SelectedIndex = -1;
            TxtDistance.Text = "";
            TxtAccessibility.Text = "";
            TxtSteps.Text = "";
            TxtConditions.Text = "";

            TxtMoveEstimate.Text = "";
            TxtFixedRate.Text = "";
            TxtPackingFee.Text = "";
            TxtStorageFee.Text = "";
            TxtTrashRemoval.Text = "";
        }
    }
}