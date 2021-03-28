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
                    String sqlQuery = "Select FirstName + ' ' + LastName as Name from customer where customerid = " + Session["SelectedCustomerID"].ToString();

                    //Establishes the connection between our web form and database
                    SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                    //This creates a datatable and fills it
                    DataTable dtForSelect = new DataTable();
                    sqlAdapter.Fill(dtForSelect);

                    lblselected.Text = Convert.ToString(dtForSelect.Rows[0]["Name"]);
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

                    //Make Divs Invisible
                    divapartment.Visible = false;
                    divstorageinfo.Visible = false;
                    divbusiness.Visible = false;
                    divbuttons.Visible = false;

                    divgeneralinfo.Visible = false;
                    divspecial.Visible = false;
                    divvehicles.Visible = false;
                    divsave.Visible = false;


                    //Blankoption
                    ListItem blankOption = new ListItem("Select", "-1");
                    DDLTypeofHome.Items.Insert(0, blankOption);
                    DDLTypeofHome.SelectedIndex = 0;
                }
                else
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");
                }
                
            }
        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                String sqlQueryService = "SELECT * FROM MOVEINFO WHERE ServiceTicketID = @ServiceTicketID";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(sqlQueryService, sqlConnect);

                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());
                com.ExecuteNonQuery();
                sqlConnect.Close();

                divbuttons.Visible = true;

                //SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnect);

                //DataTable dtforMoveInfo = new DataTable();
                //sqlAdapterService.Fill(dtforMoveInfo);
                //LblMoveID.Text = dtforMoveInfo.Rows[0].ToString(); 



            }
            catch
            {
                BtnMoveInfo.Visible = true;
                LblMoveInfo.Visible = true;
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
            ListItem blankOption = new ListItem("Select", "-1");
            DDLVehicle.Items.Insert(0, blankOption);
            DDLVehicle.SelectedIndex = 0;
        }

        protected void BtnAddCar_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [MOVEEQUIPMENT] (EquipmentID, EquipmentType, ServiceTicketID) Values (@EquipmentID, @EquipmentType, @ServiceTicketID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("EquipmentID", DDLVehicle.SelectedValue.ToString());
                com.Parameters.AddWithValue("EquipmentType", DDLVehicle.SelectedItem.ToString());
                com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Vehicle sucessfully added!";
                grdvwvehicles.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error";
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string additionalinfo = "";
            try
            {
                string query = "UPDATE [MOVEINFO] SET NumberOfStories = @NumberofStories, DistanceFromTruck = @DistanceFromTruck, TypeOfHome = @TypeofHome, TypeofHomeAdd = @TypeAdd, TruckAccessibility = @TruckAccessibility, LoadingDoorWalk = @LoadingDoorWalk, StepsToHouse = @StepsToHouse WHERE ServiceTicketID = @ServiceTicketID";
                
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("NumberOfStories", TxtNumberofStories.Text);
                com.Parameters.AddWithValue("DistanceFromTruck", TxtDistance.Text);
                com.Parameters.AddWithValue("TypeOfHome", DDLTypeofHome.SelectedValue);
                if (divapartment.Visible == true)
                {
                    additionalinfo = TxtNumberofStories.Text + " " + TxtElevator.Text + " " + TxtElevatorWalk.Text;
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

            LblSuccess.Text = "Move Info Added";

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

        protected void LblMoveInfo_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO [MOVEINFO] (ServiceTicketID) VALUES (@ServiceTicketID)";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand com = new SqlCommand(query, sqlConnect);

            com.Parameters.AddWithValue("ServiceTicketID", DDLType.SelectedValue.ToString());

            com.ExecuteNonQuery();
            sqlConnect.Close();

            BtnMoveInfo.Visible = false;
            LblMoveInfo.Visible = false;
        }

        protected void BtnGeneralInfo_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = true;
            divspecial.Visible = false;
            divvehicles.Visible = false;
            divsave.Visible = true;
        }

        protected void BtnVehicles_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = false;
            divvehicles.Visible = true;
            divsave.Visible = false;
        }

        protected void BtnSpecialEquipment_Click(object sender, EventArgs e)
        {
            divgeneralinfo.Visible = false;
            divspecial.Visible = true;
            divvehicles.Visible = false;
            divsave.Visible = false;
        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            Session["ServiceTicketID"] = DDLType.SelectedValue.ToString();
            Response.Redirect("AddRoom.aspx");

        }
    }
}