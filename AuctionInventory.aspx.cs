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
            //If the user is trying to edit a customer, there will be a customerid in this session data
            if (Session["Customer ID"] != null)
            {
                //Pulling in customer's record
                String sqlQuery = "Select FirstName, LastName, CellPhone, WorkPhone, HomePhone, Street, City, State, Zip, DateContacted from customer join Address on Customer.CustomerID = Address.CustomerID where Customer.customerid = " + Session["Customer ID"].ToString();

                //Establishes the connection between our web form and database
                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                //This creates a datatable and fills it
                DataTable dtForSelect = new DataTable();
                sqlAdapter.Fill(dtForSelect);

                //Fills data from editing customer's sql record into InitialConversation page
                TxtFirstName.Text = Convert.ToString(dtForSelect.Rows[0]["FirstName"]);
                TxtLastName.Text = Convert.ToString(dtForSelect.Rows[0]["LastName"]);
                TxtPhoneNumber.Text = Convert.ToString(dtForSelect.Rows[0]["HomePhone"]);
                TxtCellPhone.Text = Convert.ToString(dtForSelect.Rows[0]["CellPhone"]);
                TxtWorkPhone.Text = Convert.ToString(dtForSelect.Rows[0]["WorkPhone"]);
                TxtStreet.Text = Convert.ToString(dtForSelect.Rows[0]["Street"]);
                TxtCity.Text = Convert.ToString(dtForSelect.Rows[0]["City"]);
                TxtState.Text = Convert.ToString(dtForSelect.Rows[0]["State"]);
                TxtZip.Text = Convert.ToString(dtForSelect.Rows[0]["Zip"]);
                TxtContactDate.Text = Convert.ToString(dtForSelect.Rows[0]["DateContacted"]);

            }
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
            if (PickupBtn.Checked)
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
            String Query = "Select  ItemName,ItemDescription, Quantity  FROM Inventory join ServiceTicket on ServiceTicket.serviceticketID = inventory.ServiceTicketID where inventory.ServiceTicketID = 2";
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(Query, sqlConnect);

            DataTable listData = new DataTable();
            sqlAdapter.Fill(listData);
            GridItem.DataSource = listData;
            GridItem.DataBind();
        }
    }
}