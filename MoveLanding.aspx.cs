using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace Lab3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedCustomerID"] != null)
                {
                    //Populates service Ddl
                    DDLType.DataTextField = "Services";
                    DDLType.DataValueField = "ServiceTicketID";

                    String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where ServiceType = 'Move' AND customerID = " + Session["SelectedCustomerID"].ToString();


                    SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                    SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                    DataTable dtForDdlServiceList = new DataTable();
                    sqlAdapterService.Fill(dtForDdlServiceList);

                    DDLType.DataSource = dtForDdlServiceList;
                    DDLType.DataBind();

                    divlanding.Visible = false;
                }
                else
                {
                    Session["NoCustSelected"] = "true";
                    Response.Redirect("Navigation.aspx");
                }
            }
        }

            protected void DDLType_DataBound(object sender, EventArgs e)
            {
            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DDLType.Items.Insert(0, blankOption);
            DDLType.SelectedIndex = 0;

        }

        protected void DDLType_SelectedIndexChanged(object sender, EventArgs e)
            {
                divlanding.Visible = true;

            //Progress Bar
            String sqlQueryBar = "select status_service from serviceticket where serviceticketID = " + DDLType.SelectedValue.ToString();

            SqlConnection sqlConnectBar = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapterBar = new SqlDataAdapter(sqlQueryBar, sqlConnectBar);

            DataTable dtForGridViewBar = new DataTable();
            sqlAdapterBar.Fill(dtForGridViewBar);
            int Status_Service = Convert.ToInt32(dtForGridViewBar.Rows[0]["Status_Service"]);

            progressbar.Style.Value = "width:" + Status_Service + "%;";
            String StatusStep = "";
            switch (Status_Service)
            {
                case 15:
                    StatusStep = "Order Form in Progress";
                    break;
                case 25:
                    StatusStep = "Order Form Complete";
                    break;
                case 50:
                    StatusStep = "Scheduling Set";
                    break;
                case 75:
                    StatusStep = "Order In Progress";
                    break;
                case 100:
                    StatusStep = "Service Completed";
                    break;
            }

            StatusPercent.Text = "[" + Status_Service.ToString() + "%] " + StatusStep;
        }

            protected void Btnpremove_Click(object sender, EventArgs e)
            {
            Response.Redirect("PreMoveAssessment.aspx");
            }

            protected void BtnMove_Click(object sender, EventArgs e)
            {
            Response.Redirect("MoveAssessment.aspx");
        }

            protected void BtnMoveService_Click(object sender, EventArgs e)
            {
            Response.Redirect("MoveServiceOrderForm.aspx");
        }

            protected void BtnComplete_Click(object sender, EventArgs e)
            {
            Response.Redirect("CompletionForm.aspx");
        }
        }
    }
