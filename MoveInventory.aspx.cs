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
                string query = "INSERT INTO [INVENTORY] (ServiceTicketID, ItemName, ItemDescription, ItemCost, Quantity) VALUES (" + DDLType.SelectedValue + ", @ItemName, @ItemDescription, @ItemCost, @ItemQuantity)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Capstone"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("ItemName", TxtItem.Text.ToString());
                com.Parameters.AddWithValue("ItemDescription", TxtItemDescription.Text.ToString());
                com.Parameters.AddWithValue("ItemCost", TxtCost.Text.ToString());
                com.Parameters.AddWithValue("ItemQuantity", TxtQuantity.Text.ToString());

                com.ExecuteNonQuery();
                sqlConnect.Close();

                TxtItem.Text = "";
                TxtItemDescription.Text = "";
                TxtCost.Text = "";
                TxtQuantity.Text = "1";

                DDLType_SelectedIndexChanged(sender, e);
                LblStatus.Text = "Item sucessfully added!";
                GridItem.DataBind();

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }

        }

        protected void DDLCust_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            if (DDLCust.SelectedValue != "-1")
            {
                //Populates service Ddl
                DDLType.DataTextField = "Services";
                DDLType.DataValueField = "ServiceTicketID";

                String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + DDLCust.SelectedValue;


                SqlConnection sqlConnectService = new SqlConnection("Server= aa134xzc8c5axs3, 1433;Database=Capstone;uid=admin;Password=Tobyman98!;Trusted_Connection=Yes;Integrated Security = False;");

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                DataTable dtForDdlServiceList = new DataTable();
                sqlAdapterService.Fill(dtForDdlServiceList);

                DDLType.DataSource = dtForDdlServiceList;
                DDLType.DataBind();
            }

        }
        //catch
        //{
        //    LblStatus.Text = "Database Error!";
        //}




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
                TxtItem.Visible = true;
                TxtCost.Visible = true;
                TxtItemDescription.Visible = true;
                TxtQuantity.Visible = true;
                LblItem.Visible = true;
                LblCost.Visible = true;
                LblItemDescription.Visible = true;
                LblQuantity.Visible = true;
                BtnComplete.Visible = true;
            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }
    }
}

    

