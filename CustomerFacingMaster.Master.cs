//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class CustomerFacingMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checks to see if the Session data for the customer username is null
            if (Session["CustomerUsername"] == null)
                {
                    Response.Redirect("CustomerUnauthorized.aspx");
                }
                else
                {
                    LblActiveUser.Text = "You Are Logged In As: " + Session["CustomerUsername"].ToString();
                }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            //Deletes all session data for customer and sends back to customer portal
            Session.RemoveAll();
            Response.Redirect("CustomerPortal.aspx");
        }
    }
}