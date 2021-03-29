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
    public partial class AddRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divOtherRoom.Visible = false;
                divOtherFloor.Visible = false;
                divYesBox.Visible = false;
                divOutBuilding.Visible = false;
                divAttic.Visible = false;
                divBasement.Visible = false;
                divDiningRoom.Visible = false;
                //divServer.Visible = false;
                //divChinaPress.Visible = false;
                //divTable.Visible = false;
                //divSilver.Visible = false;
                //divBreakfront.Visible = false;
                divDen.Visible = false;
                divLivingRoom.Visible = false;
            }
        }

        protected void DDLCreateRoom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLCreateRoom.SelectedValue == "Other")
            {
                divOtherRoom.Visible = true;
            }
            else
            {
                divOtherFloor.Visible = false;
            }

        }

        protected void DDLFloor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLFloor.SelectedValue == "Other")
            {
                divOtherFloor.Visible = true;
            }
            else
            {
                divOtherFloor.Visible = false;
            }
        }

        protected void RBBtnBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBBtnBox.SelectedValue == "Yes")
            {
                divYesBox.Visible = true;
            }
            else
            {
                divYesBox.Visible = false;
            }
        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
        {
            try
            {
                divOtherRoom.Visible = false;
                divOtherFloor.Visible = false;
                divYesBox.Visible = false;

                string query = "INSERT INTO [ROOM] (RoomName, RoomIdentity, RoomFloor, Blankets, RoomNotes, HighValue, Large, Collectible, Electronics, ServiceTicketID, CustomerID) " +
                    "VALUES (@RoomName, @RoomIdentity, @RoomFloor, @Blankets, @RoomNotes, @HighValue, @Large, @Collectible, @Electronics, @ServiceTicketID, @CustomerID)";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand sqlCommand = new SqlCommand(query, sqlConnect);

                //Finds roomName if Other is selected
                String roomName = DDLCreateRoom.Text;
                if (roomName == "Other")
                {
                    roomName = TxtOtherRoom.Text;
                }

                //Finds floorName if Other is selected
                String floorName = DDLFloor.Text;
                if (floorName == "Other")
                {
                    floorName = TxtFloorOther.Text;
                }

                sqlCommand.Parameters.Add(new SqlParameter("@RoomName", HttpUtility.HtmlEncode(roomName)));
                sqlCommand.Parameters.Add(new SqlParameter("@RoomIdentity", HttpUtility.HtmlEncode(TxtRoomIdentify.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@RoomFloor", HttpUtility.HtmlEncode(floorName)));
                sqlCommand.Parameters.Add(new SqlParameter("@Blankets", HttpUtility.HtmlEncode(TxtBlanket.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@RoomNotes", HttpUtility.HtmlEncode(TxtAdditional.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@HighValue", HttpUtility.HtmlEncode(TxtHighValue.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Large", HttpUtility.HtmlEncode(TxtLargeItems.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Collectible", HttpUtility.HtmlEncode(TxtCollectibles.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Electronics", HttpUtility.HtmlEncode(TxtAppliances.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@ServiceTicketID", Session["ServiceTicketID"].ToString()));
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));


                // Open your connection, send the query 
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                sqlConnect.Close();

                LblAddRoomStatus.Text = "Room Added Sucessfully!";
                LblAddRoomStatus.ForeColor = Color.Green;


                //Clears everything
                DDLCreateRoom.SelectedIndex = 0;
                DDLFloor.SelectedIndex = 0;
                TxtOtherRoom.Text = "";
                TxtFloorOther.Text = "";
                TxtRoomIdentify.Text = "";
                TxtBlanket.Text = "";
                TxtAdditional.Text = "";
                TxtHighValue.Text = "";
                TxtLargeItems.Text = "";
                TxtCollectibles.Text = "";
                TxtAppliances.Text = "";
                DDLType.SelectedIndex = 0;
                TxtQty.Text = "";
                RBBtnBox.ClearSelection();

                //Refreshes Detailsview
                dtvRoom.DataBind();

            }
            catch
            {
                LblAddRoomStatus.Text = "Database Error!";
                LblAddRoomStatus.ForeColor = Color.Red;
            }


        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            divOtherRoom.Visible = false;
            divOtherFloor.Visible = false;
            divYesBox.Visible = false;
            Response.Redirect("MoveAssessment.aspx");
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [BOXES] (BoxType, BoxQuantity) Values (@BoxType, @BoxQuantity)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("@BoxType", DDLType.SelectedValue.ToString());
                com.Parameters.Add(new SqlParameter("@BoxQuantity", HttpUtility.HtmlEncode(TxtQty.Text)));

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Box successfully added!";
                grvBox.DataBind();

                DDLType.SelectedIndex = 0;
                TxtQty.Text = "";

            }
            catch
            {
                LblStatus.Text = "Database Error";
            }
        }

        protected void dtvRoom_PageIndexChanged(object sender, EventArgs e)
        {


        }

        protected void dtvRoom_DataBound(object sender, EventArgs e)
        {

            grvRoomBoxes.DataBind();


        }

        protected void BtnPop_Click(object sender, EventArgs e)
        {
            DDLCreateRoom.SelectedValue = "Bedroom";
            TxtRoomIdentify.Text = "#1";
            DDLFloor.SelectedValue = "Ground Floor";
            RBBtnBox.SelectedValue = "Yes";
            divYesBox.Visible = true;
            DDLType.SelectedValue = "Medium";
            TxtQty.Text = "2";
            TxtBlanket.Text = "Yes";
            TxtAdditional.Text = "1 dresser, mini fridge, bed, full size bed frame, futon.";
            TxtHighValue.Text = "No";
            TxtLargeItems.Text = "Futon";
            TxtCollectibles.Text = "No";
            TxtAppliances.Text = "Gaming Console";

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            DDLCreateRoom.SelectedIndex = -1;
            TxtRoomIdentify.Text = "";
            DDLFloor.SelectedIndex = -1;
            RBBtnBox.SelectedIndex = -1;
            divYesBox.Visible = false; 
            DDLType.SelectedIndex = -1;
            TxtQty.Text = "";
            TxtBlanket.Text = "";
            TxtAdditional.Text = "";
            TxtHighValue.Text = "";
            TxtLargeItems.Text = "";
            TxtCollectibles.Text = "";
            TxtAppliances.Text = "";
        }

        //protected void ChkBoxServer_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ChkBoxServer.Checked)
        //    {
        //        divServer.Visible = true;
        //    }
        //}

        //protected void ChkBoxChina_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ChkBoxChina.Checked)
        //    {
        //        divChinaPress.Visible = true;
        //    }
        //}

        //protected void ChkBoxTable_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ChkBoxTable.Checked)
        //    {
        //        divTable.Visible = true;
        //    }
        //}

        //protected void ChkBoxSilver_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ChkBoxSilver.Checked)
        //    {
        //        divSilver.Visible = true;
        //    }
        //}

        //protected void ChkBoxBreakfront_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ChkBoxBreakfront.Checked)
        //    {
        //        divBreakfront.Visible = true;
        //    }
        //}
    }
}