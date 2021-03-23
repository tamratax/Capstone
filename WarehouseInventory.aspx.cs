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

namespace Lab3
{
    public partial class WarehouseInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DDLCust_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DDLCust.SelectedValue != "-1")
                {
                    //Populates service Ddl
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where customerID = " + DDLCust.SelectedValue;


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLType.DataSource = dtForDdlServiceList;
                    DDLType.DataBind();
                }

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void DDLCust_DataBound(object sender, EventArgs e)
        {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLCust.Items.Insert(0, blankOption);
            DDLCust.SelectedIndex = 0;
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
            GridItem.Visible = true;
         
            try
            {
                if (DDLType.SelectedValue != "-1")
                {
                    

                    String sqlQueryService = "Select ItemID, ItemName from INVENTORY where ServiceTicketID = " + DDLType.SelectedValue;

                    //Populates service Ddl
                    DDLItem.DataTextField = "ItemName";
                    DDLItem.DataValueField = "ItemID";

                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLItem.DataSource = dtForDdlServiceList;
                    DDLItem.DataBind();
                }

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }

        protected void Savebtn_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [WAREHOUSE] (Date, Lot, Control, Description, Quantity, ItemID, CustomerID) Values (@Date, @Lot, @Control, @Description, @Quantity, @ItemID, @CustomerID)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("Date", TxtDate.Text.ToString());
                com.Parameters.AddWithValue("Lot", TxtLot.Text.ToString());
                com.Parameters.AddWithValue("Control", TxtControl.Text.ToString());
                com.Parameters.AddWithValue("Description", TxtDescription.Text.ToString());
                com.Parameters.AddWithValue("Quantity", TxtQuantity.Text.ToString());
                string itemid = DDLItem.SelectedValue.ToString();
                com.Parameters.AddWithValue("ItemID", itemid);
                com.Parameters.AddWithValue("CustomerID", DDLCust.SelectedValue.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                TxtDate.Text = "";
                TxtLot.Text = "";
                TxtControl.Text = "";
                TxtDescription.Text = "";
               


        
                LblStatus.Text = "Item sucessfully added!";
                GridItem.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }

        }
    }
    }
