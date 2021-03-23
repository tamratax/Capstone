//Coded By:Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
<<<<<<< HEAD
            ////If not logged in, will kick user to Unauthorized page
=======
            //////If not logged in, will kick user to Unauthorized page
>>>>>>> parent of fb3ebe4 (staged)
            //if (Session["User"] == null)
            //{
            //    Response.Redirect("UnauthorizedAccess.aspx");
            //}
            //else
            //{
            //    LblActiveUser.Text = "You Are Logged In As: " + Session["User"].ToString();
            //}
<<<<<<< HEAD

=======
>>>>>>> parent of fb3ebe4 (staged)
        }

        protected void BtnNavigation_Click(object sender, EventArgs e)
        {
            //Changes page to main navigation page
            Session["ServiceRequestID"] = null;
            Session["ServiceTicketID"] = null;
            Session["Customer ID"] = null;
            Response.Redirect("Navigation.aspx");
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            //Set the session data for user to null
            Session.RemoveAll();
            Response.Redirect("UserLogin.aspx");
        }
    }
}