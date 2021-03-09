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
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnComplete_Click(object sender, EventArgs e)
        {
            try
            {


                string query = "INSERT INTO [INVENTORY] (ServiceTicketID, ItemDescription, ItemCost, ItemDate) VALUES ((Select ServiceTicket.ServiceTicketID FROM ServiceTicket WHERE ServiceTicket.ServiceTicketID ='" + DDLType.SelectedValue + "'), @ItemDescription, @ItemCost, @ItemDate)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                string item = TxtItem.Text;
                com.Parameters.AddWithValue("ItemDescription", item);
                string cost = TxtCost.Text;
                com.Parameters.AddWithValue("ItemCost", cost);
                string date = TxtDate.Text;
                com.Parameters.AddWithValue("ItemDate", date);

                com.ExecuteNonQuery();
                sqlConnect.Close();

                TxtItem.Text = "";
                TxtCost.Text = "";
                TxtDate.Text = "";

                DDLType_SelectedIndexChanged(sender, e);
                LblStatus.Text = "Item sucessfully added!";

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }

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
            try
            {
                String Query = "Select ItemDescription, ItemCost, ItemDate FROM Inventory join ServiceTicket on ServiceTicket.serviceticketID = inventory.ServiceTicketID where inventory.ServiceTicketID = " + DDLType.SelectedValue;
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(Query, sqlConnect);

                DataTable listData = new DataTable();
                sqlAdapter.Fill(listData);
                GridItem.DataSource = listData;
                GridItem.DataBind();

                TxtItem.Visible = true;
                TxtCost.Visible = true;
                TxtDate.Visible = true;
                LblItem.Visible = true;
                LblCost.Visible = true;
                LblDate.Visible = true;
                BtnComplete.Visible = true;
            } 
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }
    }
}