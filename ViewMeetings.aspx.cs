using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class ViewMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            GridviewMeeting.Visible = true;
            GRDShowAllMeetings.Visible = false;
        }

        protected void BtnLoadAll_Click(object sender, EventArgs e)
        {
            GridviewMeeting.Visible = false;
            GRDShowAllMeetings.Visible = true;
        }
    }
}