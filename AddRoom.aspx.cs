using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                divServer.Visible = false;
                divChinaPress.Visible = false;
                divTable.Visible = false;
                divSilver.Visible = false;
                divBreakfront.Visible = false;
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
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            divOtherRoom.Visible = false;
            divOtherFloor.Visible = false;
            divYesBox.Visible = false;
        }

        protected void ChkBoxServer_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxServer.Checked)
            {
                divServer.Visible = true;
            }
        }

        protected void ChkBoxChina_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxChina.Checked)
            {
                divChinaPress.Visible = true;
            }
        }

        protected void ChkBoxTable_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxTable.Checked)
            {
                divTable.Visible = true;
            }
        }

        protected void ChkBoxSilver_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxSilver.Checked)
            {
                divSilver.Visible = true;
            }
        }

        protected void ChkBoxBreakfront_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkBoxBreakfront.Checked)
            {
                divBreakfront.Visible = true;
            }
        }
    }
}