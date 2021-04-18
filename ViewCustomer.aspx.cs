//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WalkerS_Lab1Part3
{
    public partial class ViewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            
            GridviewCusts.Visible = true;
            GRDShowAllCust.Visible = false;
        }

        protected void GridviewMoves_RowEditing(object sender, GridViewEditEventArgs e)
        {
            

        }

        protected void BtnLoadAll_Click(object sender, EventArgs e)
        {
            GridviewCusts.Visible = false;
            GRDShowAllCust.Visible = true;

        }

        public object FormatPhoneNumber(string phoneNumber)
        {
            // return nothing if the string is null
            if (String.IsNullOrEmpty(phoneNumber))
            {
                return "N/A";
            }

            // if the int is valid, return the formatted phone number
            return string.Format("({0}) {1}-{2}",
                   phoneNumber.Substring(0, 3),
                   phoneNumber.Substring(3, 3),
                   phoneNumber.Substring(6));
        }
    }
}