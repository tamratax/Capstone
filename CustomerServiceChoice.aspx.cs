﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AppraisalServiceOrder.aspx");
        }

        protected void PreMoveAssessmentBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddServiceRequest.aspx");

        }
    }
}