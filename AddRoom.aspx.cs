using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            if (DDLCreateRoom.SelectedValue == "Outbuilding")
            {
                divOutBuilding.Visible = true;
            }
            if (DDLCreateRoom.SelectedValue == "Attic")
            {
                divAttic.Visible = true;
            }
            if (DDLCreateRoom.SelectedValue == "Basement")
            {
                divBasement.Visible = true;
            }
            if (DDLCreateRoom.SelectedValue == "Dining Room")
            {
                divDiningRoom.Visible = true;
            }
            if (DDLCreateRoom.SelectedValue == "Den")
            {
                divDen.Visible = true;
            }
            if (DDLCreateRoom.SelectedValue == "Living Room")
                divLivingRoom.Visible = true;
        }

        protected void DDLFloor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLFloor.SelectedValue == "Other")
            {
                divOtherFloor.Visible = true;
            }
        }

        protected void RBBtnBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBBtnBox.SelectedValue == "Yes")
            {
                divYesBox.Visible = true;
            }
        }

        protected void BtnAddRoom_Click(object sender, EventArgs e)
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
            //try
            //{
                string query = "INSERT INTO [BOXES] (BoxType, BoxQuantity) Values (@BoxType, @BoxQuantity)";
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                sqlConnect.Open();
                SqlCommand com = new SqlCommand(query, sqlConnect);

                com.Parameters.AddWithValue("@BoxType", DDLType.SelectedValue.ToString());
                com.Parameters.Add(new SqlParameter("@BoxQuantity", HttpUtility.HtmlEncode(TxtQty.Text)));

                com.ExecuteNonQuery();
                sqlConnect.Close();

                LblStatus.Text = "Box sucessfully added!";
                grvBox.DataBind();

            //}
            //catch
            //{
            //    LblStatus.Text = "Database Error";
            //}
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