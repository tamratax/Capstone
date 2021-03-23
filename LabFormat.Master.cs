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
            ////If not logged in, will kick user to Unauthorized page
            //if (Session["User"] == null)
            //{
            //    Response.Redirect("UnauthorizedAccess.aspx");
            //}
            //else
            //{
            //    LblActiveUser.Text = "You Are Logged In As: " + Session["User"].ToString();
            //}

        }

        protected void Home_OnClick(object sender, EventArgs e)
        {
            //Changes page to main navigation page
            //Session["ServiceRequestID"] = null;
            //Session["ServiceTicketID"] = null;
            Session["Customer ID"] = null;
            //Response.Redirect("Navigation.aspx");
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            //Set the session data for user to null
            Session.RemoveAll();
            Response.Redirect("UserLogin.aspx");
        }

        protected void LblSelectedCust_PreRender(object sender, EventArgs e)
        {
            if (Session["SelectedCustomerName"] != null)
            {
                LblSelectedCust.Text = Session["SelectedCustomerName"].ToString();
            }
            else
            {
                LblSelectedCust.Text = "No Customer Selected!";
            }
        }

        protected void BtnClearCust_Click(object sender, EventArgs e)
        {
            Session.Remove("SelectedCustomerID");
            Session.Remove("SelectedCustomerName");
            Response.Redirect("Navigation.aspx");
        }
    }
}