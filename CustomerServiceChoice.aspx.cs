using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Lab3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void BtnRequestAppraisal_Click(object sender, EventArgs e)
        {

        }

        protected void BtnRequestMove_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPreMoveAssessment.aspx");
        }

        protected void BtnRequestAuction_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerPreAuctionAssessment.aspx");
        }
    }
}