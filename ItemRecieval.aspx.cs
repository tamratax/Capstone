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
    public partial class ItemRecieval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateGridView();
        }

        protected void BringInBtn_CheckedChanged(object sender, EventArgs e)
        {
            if (BringInBtn.Checked)
            {
                BringIndateLbl.Visible = true;
                TxtBringInDate.Visible = true;
                CloseOutDateLbl.Visible = true;
                TxtCloseOutDate.Visible = true;

                DateLbl.Visible = false;
                TxtDate.Visible = false;
                TimeLbl.Visible = false;
                TxtTime.Visible = false;
                LeaveAtLbl.Visible = false;
                TxtLeaveAt.Visible = false;
               
            }

        }

        protected void PickupBtn_CheckedChanged(object sender, EventArgs e)
        {
           if(PickupBtn.Checked)
            {

                DateLbl.Visible = true;
                TxtDate.Visible = true;
                TimeLbl.Visible = true;
                TxtTime.Visible = true;
                LeaveAtLbl.Visible = true;
                TxtLeaveAt.Visible = true;

                BringIndateLbl.Visible = false;
                TxtBringInDate.Visible = false;
                CloseOutDateLbl.Visible = false;
                TxtCloseOutDate.Visible = false;

            }

        }

        protected void BtnComplete_Click(object sender, EventArgs e)
        {
            try
            {


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


                string query = "INSERT into Inventory(ServiceTicketID, ItemName,ItemDescription, Quantity ) " +
                    "values (2, @ItemName, @ItemDescription, @ItemQuantity) ";
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);




                com.Parameters.AddWithValue("ItemName", TxtItem.Text.ToString());
                com.Parameters.AddWithValue("ItemDescription", TxtItemNotes.Text.ToString());
                com.Parameters.AddWithValue("ItemQuantity", TxtQuantity.Text.ToString());



                com.ExecuteNonQuery();
                sqlConnect.Close();

                TxtItem.Text = "";
                TxtItemNotes.Text = "";
                TxtQuantity.Text = "";

                UpdateGridView();

                LblStatus.Text = "Item sucessfully added!";

            }
            catch
            {
                LblStatus.Text = "Database Error!";
            }
        }
        protected void UpdateGridView()
        {
            String Query = "Select  ItemName,ItemDescription, Quantity  FROM Inventory join ServiceTicket on ServiceTicket.serviceticketID = inventory.ServiceTicketID where inventory.ServiceTicketID = 2" ;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(Query, sqlConnect);

            DataTable listData = new DataTable();
            sqlAdapter.Fill(listData);
            GridItem.DataSource = listData;
            GridItem.DataBind();
        }
    }
}