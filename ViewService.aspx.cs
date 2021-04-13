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
    public partial class ViewService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }





        protected void DdlServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if Select is not selected...
            
                //Deals with status bar of service ticket

               

            



                //        //updates Employee details in gridview
                //        String sqlQuery1 = "select EmpFirstName + ' ' + EmpLastName as EmployeeName, ";
                //        sqlQuery1 += "TicketChangeDate as 'Ticket Change Date' from employee emp join tickethistory th on emp.EmployeeID = th.EmployeeID ";
                //        sqlQuery1 += "join serviceticket st on st.ServiceTicketID = th.ServiceTicketID ";
                //        sqlQuery1 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                //        SqlConnection sqlConnect1 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //        SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery1, sqlConnect1);

                //        DataTable dtForGridView1 = new DataTable();
                //        sqlAdapter1.Fill(dtForGridView1);

                //        GrdEmployeeResults.DataSource = dtForGridView1;
                //        GrdEmployeeResults.DataBind();

                //        //updates Equipment details in gridview
                //        String sqlQuery2 = "select equipmenttype as 'Type' ";
                //        sqlQuery2 += "from EQUIPMENT join ASSIGNMENT on EQUIPMENT.EquipmentID = ASSIGNMENT.EquipmentID ";
                //        sqlQuery2 += "join ServiceTicket st on ASSIGNMENT.ServiceTicketID = st.ServiceTicketID ";
                //        sqlQuery2 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                //        SqlConnection sqlConnect2 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //        SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery2, sqlConnect2);

                //        DataTable dtForGridView2 = new DataTable();
                //        sqlAdapter2.Fill(dtForGridView2);

                //        GrdEquipmentResults.DataSource = dtForGridView2;
                //        GrdEquipmentResults.DataBind();


                //        //Updates Inventory details in gridview
                //        String sqlQuery3 = "select ItemDescription as 'Item Description', ItemCost as 'Item Cost' from Inventory ";
                //        sqlQuery3 += "join ServiceTicket st on inventory.ServiceTicketID = st.ServiceTicketID ";
                //        sqlQuery3 += "where st.ServiceTicketID = " + DdlServiceList.SelectedValue;

                //        SqlConnection sqlConnect3 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //        SqlDataAdapter sqlAdapter3 = new SqlDataAdapter(sqlQuery3, sqlConnect3);

                //        DataTable dtForGridView3 = new DataTable();
                //        sqlAdapter3.Fill(dtForGridView3);

                //        GrdInventory.DataSource = dtForGridView3;
                //        GrdInventory.DataBind();

                //        //Displays gridviews
                //        GrdEmployeeResults.Visible = true;
                //        GrdEquipmentResults.Visible = true;
                //        GrdInventory.Visible = true;

                //        //Populates ticket listbox
                //        LstBoxNoteSelect.DataTextField = "Note Title";
                //        LstBoxNoteSelect.DataValueField = "TicketHistoryID";

                //        String sqlQueryTicket = "Select TicketHistoryID, NoteTitle + ' ->' 'Note Title' from TicketHistory where ServiceTicketID = " + DdlServiceList.SelectedValue;


                //        SqlConnection sqlConnectTicket = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //        SqlDataAdapter sqlAdapterTicket = new SqlDataAdapter(sqlQueryTicket, sqlConnectTicket);

                //        DataTable dtForListBox = new DataTable();
                //        sqlAdapterTicket.Fill(dtForListBox);

                //        LstBoxNoteSelect.DataSource = dtForListBox;
                //        LstBoxNoteSelect.DataBind();



                //    }
                //    else
                //    {
                //        //hides gridboxes if you select "select" on the dropdownlist
                //        GrdEmployeeResults.Visible = false;
                //        GrdEquipmentResults.Visible = false;
                //        GrdInventory.Visible = false;
                //        StatusPercent.Text = "";
                //        divStatus.Style.Value = "background-color:Green;width:0%;";
                //    }
                //}




                //protected void LstBoxNoteSelect_SelectedIndexChanged(object sender, EventArgs e)
                //{
                //    Session["SelectedTicketHistoryID"] = LstBoxNoteSelect.SelectedValue.ToString();
                //    Session["SelectedCustomerID"] = DdlCustomerList.SelectedValue.ToString();
                //    Session["SelectedServiceTicketID"] = DdlServiceList.SelectedValue.ToString();
                //    Session["FromPage"] = "ViewService";
                //    Response.Redirect("ViewNote.aspx");


            }


            protected void BtnSearch_Click(object sender, EventArgs e)
        {

            //Check to see if customer is in the database
            String sqlQueryDuplicate = "Select CustomerID, FirstName + ' ' + LastName as 'Name', email, homephone, workphone, cellphone from customer WHERE FirstName + ' ' +  LastName like @Name";



            //Establishes the connection between our web form and database
            SqlConnection sqlConnectDuplicate = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //Creates sqlcommand with query and email parameter for security
            SqlCommand sqlCommandInsert = new SqlCommand();
            sqlCommandInsert.Connection = sqlConnectDuplicate;
            sqlCommandInsert.CommandType = CommandType.Text;
            sqlCommandInsert.CommandText = sqlQueryDuplicate;
            sqlCommandInsert.Parameters.Add(new SqlParameter("@Name", "%" + HttpUtility.HtmlEncode(TxtSearch.Text) + "%"));


            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlCommandInsert);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GridViewCustomers.DataSource = dtForDuplicate;
            GridViewCustomers.DataBind();
            GridViewCustomers.Visible = true;

        }


        protected void GridViewCustomers_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
            String sqlQuery = "Select SERVICETICKETID, TicketOpenDate, CompletedDate, ServiceType from ServiceTicket WHERE CustomerID = @CustomerID";
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com = new SqlCommand();
            com.Connection = sqlConnect;
            com.CommandType = CommandType.Text;
            com.CommandText = sqlQuery;
            com.Parameters.Add(new SqlParameter("@CustomerID", GridViewCustomers.SelectedDataKey.Value.ToString()));

            SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(com);
            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            //SqlDataAdapter sqlAdapterDuplicate = new SqlDataAdapter(sqlQueryDuplicate, sqlConnectDuplicate); <- This is how we originally did it with a DataAdapter

            //This creates a datatable and fills it
            DataTable dtForDuplicate = new DataTable();
            sqlAdapterDuplicate.Fill(dtForDuplicate);


            GrdServices.DataSource = dtForDuplicate;
            GrdServices.DataBind();
            GrdServices.Visible = true;


        }

        protected void GrdServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Employee Table 
            String sqlQuery1 = "select emp.EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName, ";
            sqlQuery1 += "TicketChangeDate as 'Ticket Change Date' from employee emp join tickethistory th on emp.EmployeeID = th.EmployeeID ";
            sqlQuery1 += "join serviceticket st on st.ServiceTicketID = th.ServiceTicketID ";
            sqlQuery1 += "where st.ServiceTicketID = @ServiceID";

            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com = new SqlCommand();
            com.Connection = sqlConnect;
            com.CommandType = CommandType.Text;
            com.CommandText = sqlQuery1;
            com.Parameters.Add(new SqlParameter("@ServiceID", GrdServices.SelectedDataKey.Value.ToString()));

            SqlDataAdapter sqlAdapteremp = new SqlDataAdapter(com);

            DataTable dtemp = new DataTable();
            sqlAdapteremp.Fill(dtemp);

            GrdEmployeeResults.DataSource = dtemp;
            GrdEmployeeResults.DataBind();
            GrdEmployeeResults.Visible = true;

            //Equipment Table 
            String sqlQuery2 = "select equipment.EquipmentID, equipmenttype as 'Type' ";
            sqlQuery2 += "from EQUIPMENT join ServiceTicketEquipment on EQUIPMENT.EquipmentID = ServiceTicketEquipment.EquipmentID ";
            sqlQuery2 += "join ServiceTicket st on ServiceTicketEquipment.ServiceTicketID = st.ServiceTicketID ";
            sqlQuery2 += "where st.ServiceTicketID = @ServiceID";

            SqlConnection sqlConnect2 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com2 = new SqlCommand();
            com2.Connection = sqlConnect2;
            com2.CommandType = CommandType.Text;
            com2.CommandText = sqlQuery2;
            com2.Parameters.Add(new SqlParameter("@ServiceID", GrdServices.SelectedDataKey.Value.ToString()));


            SqlDataAdapter sqlAdaptereq = new SqlDataAdapter(com2);

            DataTable dtForeq = new DataTable();
            sqlAdaptereq.Fill(dtForeq);

            GrdEquipmentResults.DataSource = dtForeq;
            GrdEquipmentResults.DataBind();

            //Notes Table
            String sqlQueryTicket = "Select TicketHistoryID, TicketChangeDate, NoteTitle + ' ->' 'Note Title' from TicketHistory where ServiceTicketID = @ServiceID";
            SqlConnection sqlConnect3 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com3 = new SqlCommand();
            com3.Connection = sqlConnect3;
            com3.CommandType = CommandType.Text;
            com3.CommandText = sqlQueryTicket;
            com3.Parameters.Add(new SqlParameter("@ServiceID", GrdServices.SelectedDataKey.Value.ToString()));

            SqlDataAdapter sqlAdapternote = new SqlDataAdapter(com3);

            DataTable dtFornote = new DataTable();
            sqlAdapternote.Fill(dtFornote);

            GrdNotes.DataSource = dtFornote;
            GrdNotes.DataBind();

            String sqlQueryBar = "select status_service from serviceticket where serviceticketID = " + GrdServices.SelectedValue.ToString();

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

        protected void GrdNotes_SelectedIndexChanged(object sender, EventArgs e)
        {

            notespacing.Visible = true;
            String sqlQuerydescription = "Select NoteDetails from TicketHistory where TicketHistoryID = @TicketID";

            SqlConnection sqlConnect4 = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            SqlCommand com4 = new SqlCommand();
            com4.Connection = sqlConnect4;
            com4.CommandType = CommandType.Text;
            com4.CommandText = sqlQuerydescription;
            com4.Parameters.Add(new SqlParameter("@TicketID", GrdNotes.SelectedDataKey.Value.ToString()));

                sqlConnect4.Open();
                using (com4)
                {
                    SqlDataReader reader = com4.ExecuteReader();
                    while (reader.Read())
                    {
                        lbldescription.Text = reader[0] as string;

                        //break for single row or you can continue if you have multiple rows...
                        break;
                    }
                }
                sqlConnect4.Close();





            
        }
    }
}



