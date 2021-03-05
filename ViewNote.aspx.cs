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
using System.Drawing;

namespace Lab2
{
    public partial class ViewTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FromPage"] is null)
            {
                Session["FromPage"] = "ViewNote";
            }
        }

        protected void DdlCustomerList_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Sets Customer list ddl to default of select
                ListItem blankOption = new ListItem("Select", "-1");
                DdlCustomerList.Items.Insert(0, blankOption);
                DdlCustomerList.SelectedIndex = 0;

                //If coming from viewservices, fills ddl
                if (Session["FromPage"].ToString() == "ViewService")
                {
                    DdlCustomerList.SelectedValue = Session["SelectedCustomerID"].ToString();
                    DdlCustomerList_SelectedIndexChanged(sender, e);
                }


            }
        }
        protected void DdlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlCustomerList.SelectedValue != "-1")
            {
                //Populates service Ddl
                DdlServiceList.DataTextField = "Services";
                DdlServiceList.DataValueField = "ServiceTicketID";

                String sqlQueryService = "Select ServiceTicketID, ServiceType + ' ' + ServiceDate 'Services' from ServiceTicket where customerID = " + DdlCustomerList.SelectedValue;


                SqlConnection sqlConnectService = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterService = new SqlDataAdapter(sqlQueryService, sqlConnectService);

                DataTable dtForDdlServiceList = new DataTable();
                sqlAdapterService.Fill(dtForDdlServiceList);

                DdlServiceList.DataSource = dtForDdlServiceList;
                DdlServiceList.DataBind();



                //Clears listbox
                if (IsPostBack)
                {
                    LstBoxNoteSelect.Items.Clear();
                    LblChangeDate.Text = "";
                    LblNoteCreator.Text = "";
                    TxtTitle.Text = "";
                    TxtDetails.Text = "";
                }
            }
            else
            {
                //DdlServiceList.SelectedValue = "-1";
                DdlServiceList.Items.Clear();
                LstBoxNoteSelect.Items.Clear();
                LblChangeDate.Text = "";
                LblNoteCreator.Text = "";
                TxtTitle.Text = "";
                TxtDetails.Text = "";
            }
        }

        protected void DdlServiceList_DataBound(object sender, EventArgs e)
        {

            //Sets Service list ddl to default of select
            ListItem blankOption = new ListItem("Select", "-1");
            DdlServiceList.Items.Insert(0, blankOption);
            DdlServiceList.SelectedIndex = 0;

            //If coming from viewservices, fills ddl
            if (Session["FromPage"].ToString() == "ViewService")
            {
                DdlServiceList.SelectedValue = Session["SelectedServiceTicketID"].ToString();
                DdlServiceList_SelectedIndexChanged(sender, e);
            }

        }

        protected void DdlServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if Select is not selected...
            if (DdlServiceList.SelectedValue != "-1")
            {
                LstBoxNoteSelect.DataTextField = "Note Title";
                LstBoxNoteSelect.DataValueField = "TicketHistoryID";

                String sqlQueryTicket = "Select TicketHistoryID, NoteTitle 'Note Title' from TicketHistory where ServiceTicketID = " + DdlServiceList.SelectedValue;


                SqlConnection sqlConnectTicket = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                SqlDataAdapter sqlAdapterTicket = new SqlDataAdapter(sqlQueryTicket, sqlConnectTicket);

                DataTable dtForListBox = new DataTable();
                sqlAdapterTicket.Fill(dtForListBox);

                LstBoxNoteSelect.DataSource = dtForListBox;
                LstBoxNoteSelect.DataBind();
            }
            else
            {
                LstBoxNoteSelect.Items.Clear();
                LblChangeDate.Text = "";
                LblNoteCreator.Text = "";
                TxtTitle.Text = "";
                TxtDetails.Text = "";
            }
        }

        protected void LstBoxNoteSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            //When a note is selected from the listbox, Populate the page with its contents
            LblSaveStatus.Text = "";

            String sqlQueryNoteInfo = "Select TicketHistoryID, TicketChangeDate, th.EmployeeID, NoteTitle, NoteDetails, EmpFirstName +' '+ EmpLastName 'EmpName' from TicketHistory th join EMPLOYEE e on th.EmployeeID = e.EmployeeID where TicketHistoryID = " + LstBoxNoteSelect.SelectedValue;


            SqlConnection sqlConnectNoteInfo = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapterNoteInfo = new SqlDataAdapter(sqlQueryNoteInfo, sqlConnectNoteInfo);

            DataTable dtForNoteInfo = new DataTable();
            sqlAdapterNoteInfo.Fill(dtForNoteInfo);

            LblChangeDate.Text = Convert.ToString(dtForNoteInfo.Rows[0]["TicketChangeDate"]);
            LblNoteCreator.Text = Convert.ToString(dtForNoteInfo.Rows[0]["EmpName"]);
            TxtTitle.Text = Convert.ToString(dtForNoteInfo.Rows[0]["NoteTitle"]);
            TxtDetails.Text = Convert.ToString(dtForNoteInfo.Rows[0]["NoteDetails"]);



        }
        
        protected void LstBoxNoteSelect_DataBound(object sender, EventArgs e)
        {
            //If coming from viewservice, selects previous item in listbox
            if (Session["FromPage"].ToString() == "ViewService")
            {
                LstBoxNoteSelect.SelectedValue = Session["SelectedTicketHistoryID"].ToString();
                LstBoxNoteSelect_SelectedIndexChanged(sender, e);
                Session["FromPage"] = "";
            }
        }

        protected void BtnSaveNote_Click(object sender, EventArgs e)
        {
            try
            {
                //Concatenate Sql Query Insert Statements
                String sqlQuery = "UPDATE TicketHistory SET NoteTitle = @NoteTitle, NoteDetails = @NoteDetails WHERE TicketHistoryID = " + LstBoxNoteSelect.SelectedValue;

                //Define the Connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // Create the SQL Command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                sqlCommand.Parameters.Add(new SqlParameter("@NoteTitle", HttpUtility.HtmlEncode(TxtTitle.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@NoteDetails", HttpUtility.HtmlEncode(TxtDetails.Text)));

                // Open your connection, send the query 
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                // Close all related connections
                queryResults.Close();
                sqlConnect.Close();

                LblSaveStatus.Text = "Note Updated Successfully";
                LblSaveStatus.ForeColor = Color.Green;
            }
            catch
            {
                LblSaveStatus.Text = "Error Saving Service, Check Data Fields";
                LblSaveStatus.ForeColor = Color.Red;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            DdlCustomerList.SelectedValue = "-1";
            DdlServiceList.SelectedValue = "-1";
            LstBoxNoteSelect.Items.Clear();
            LblChangeDate.Text = "";
            LblNoteCreator.Text = "";
            TxtTitle.Text = "";
            TxtDetails.Text = "";



        }

        protected void BtnAddNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNote.aspx");
        }
    }
}


