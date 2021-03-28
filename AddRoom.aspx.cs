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

            string query = "INSERT INTO [ADDROOM] (RoomName, OtherRoom, RideMower, PushMower, LargeTools, AtticAccessibility, PullDownSteps, " +
                "BasementEntrance, TruckToDoor, DinningServer, HighValue, Sideboard, MirrorBack, MarbleTop, ChinaPress, BowFront, HighValue1, " +
                "TwoPiece, DinningTable, NumberOfLeaves, NumberOfChairs, HighValue2, Pedestal, SilverChest, HighValue3, Rug, Breakfront, " +
                "HighValue4, TwoPiece1, NumberOfSofas, LeatherSofas, NumberOfSofas1, LeatherSofas1, Identifier, RoomFloor, OtherFloor, Boxes, NumberOfBoxes, BoxType, Blankets, Notes, CustomerID, ServiceTicketID) VALUES (@RoomName, @OtherRoom, @RideMower, @PushMower, " +
                "@LargeTools, @AtticAccessibility, @PullDownSteps, " +
                "@BasementEntrance, @TruckToDoor, @DiningServer, @HighValue, @Sideboard, @MirrorBack, @MarbleTop, @ChinaPress, @BowFront, @HighValue1, " +
                "@TwoPiece, @DiningTable, @NumberOfLeaves, @NumberOfChairs, @HighValue2, @Pedestal, @SilverChest, @HighValue3, @Rug, @Breakfront, " +
                "@HighValue4, @TwoPiece1, @NumberOfSofas, @LeatherSofas, @NumberOfSofas1, @LeatherSofas1, @Identifier, @RoomFloor, @OtherFloor, @Boxes, @NumberOfBoxes, @BoxType, @Blankets, @Notes, @CustomerID, @ServiceTicketID)";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            sqlConnect.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnect);

            sqlCommand.Parameters.Add(new SqlParameter("@RoomName", HttpUtility.HtmlEncode(DDLCreateRoom.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@OtherRoom", HttpUtility.HtmlEncode(TxtOtherRoom.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@RideMower", HttpUtility.HtmlEncode(ChkBoxRideMower.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@PushMower", HttpUtility.HtmlEncode(ChkBoxPushMower.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@LargeTools", HttpUtility.HtmlEncode(ChkLrgTools.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@AtticAccessibility", HttpUtility.HtmlEncode(ChkBoxAccess.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@PullDownSteps", HttpUtility.HtmlEncode(ChkBoxPullDown.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@BasementEntrance", HttpUtility.HtmlEncode(ChkBoxEntrance.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@TruckToDoor", HttpUtility.HtmlEncode(ChkBoxTrucktoDoor.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@DiningServer", HttpUtility.HtmlEncode(ChkBoxServer.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@HighValue", HttpUtility.HtmlEncode(ChkBoxHigh.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Sideboard", HttpUtility.HtmlEncode(ChkBoxSideboard.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@MirrorBack", HttpUtility.HtmlEncode(ChkBoxMirror.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@MarbleTop", HttpUtility.HtmlEncode(ChkBoxMarble.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@ChinaPress", HttpUtility.HtmlEncode(ChkBoxChina.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@BowFront", HttpUtility.HtmlEncode(ChkBoxBowFront.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@HighValue1", HttpUtility.HtmlEncode(ChkBoxHighValue.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@TwoPiece", HttpUtility.HtmlEncode(ChkBox2Piece.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@DiningTable", HttpUtility.HtmlEncode(ChkBoxTable.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@NumberOfLeaves", HttpUtility.HtmlEncode(TxtLeaves.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@NumberOfChairs", HttpUtility.HtmlEncode(TxtBoxChairs.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@HighValue2", HttpUtility.HtmlEncode(ChkBoxHighValue2.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Pedestal", HttpUtility.HtmlEncode(ChkBoxPedestal.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@SilverChest", HttpUtility.HtmlEncode(ChkBoxSilver.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@HighValue3", HttpUtility.HtmlEncode(ChkBoxHighValue3.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Rug", HttpUtility.HtmlEncode(ChkBoxRug.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Breakfront", HttpUtility.HtmlEncode(ChkBoxBreakfront.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@HighValue4", HttpUtility.HtmlEncode(HighValue5.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@TwoPiece1", HttpUtility.HtmlEncode(ChkBox2Piece2.Checked)));
            //sqlCommand.Parameters.Add(new SqlParameter("@NumberOfSofas", HttpUtility.HtmlEncode(TxtSofas.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@LeatherSofas", HttpUtility.HtmlEncode(TxtLeatherSofas.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@NumberOfSofas1", HttpUtility.HtmlEncode(TxtSofas1.Text)));
            //sqlCommand.Parameters.Add(new SqlParameter("@LeatherSofas1", HttpUtility.HtmlEncode(TxtLeatherSofas1.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Identifier", HttpUtility.HtmlEncode(TxtRoomIdentify.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@RoomFloor", HttpUtility.HtmlEncode(DDLFloor.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@OtherFloor", HttpUtility.HtmlEncode(BoxOther.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@Boxes", HttpUtility.HtmlEncode(RBBtnBox.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@NumberOfBoxes", HttpUtility.HtmlEncode(TxtQty.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@BoxType", HttpUtility.HtmlEncode(DDLType.SelectedValue)));
            //sqlCommand.Parameters.Add(new SqlParameter("@Blankets", HttpUtility.HtmlEncode(RBBlanket.SelectedValue)));
            sqlCommand.Parameters.Add(new SqlParameter("@Notes", HttpUtility.HtmlEncode(TxtAdditional.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", Session["SelectedCustomerID"].ToString()));
            sqlCommand.Parameters.Add(new SqlParameter("@ServiceTicketID", Session["ServiceTicketID"].ToString()));

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