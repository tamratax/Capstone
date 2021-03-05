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

        //Button loads all data from Database into gridview
        protected void btnLoadAllCustomer_Click(object sender, EventArgs e)
        {
            //This query selects everything from customer
            String sqlQuery = "Select FirstName + ' ' + LastName as 'Name', ";
            sqlQuery += "phone as 'Phone', PhoneType as 'Phone Type', email as 'Email', ";
            sqlQuery += "InterestedIn as 'Interested In', OriginStreet + ' ' + OriginCity + ' ' + OriginState as 'Origin Address', DestinationStreet + ' ' + DestinationCity + ' ' + DestinationState as 'Destination Address', InitialContact as 'Initial Contact', ReferralChannel as 'Referral Channel', TotalEarnings as 'Total Earnings', DateContacted as 'Date Contacted', DeadlineStart as 'Deadline Start', DeadlineEnd as 'Deadline End' from Customer";
            

            //Establishes the connection between our web form and database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

            //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            //This creates a datatable and fills it
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            //Sends the results from the datatable to the gridview
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();
            grdOrderResults.Visible = true;
        }

        //Navigates to Navigation Web form after button is clicked
        protected void BtnNavigation_Click(object sender, EventArgs e)
        {
            Response.Redirect("Navigation.aspx");
        }

        //Navigates to AddCustomer Web form after button is clicked
        protected void BtnAddCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCustomer.aspx");
        }

        //Populates Customer Gridview When The Customer Name is Selected
        protected void ddlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //If the selected value in drop list is not "select" (-1) then run the query to populate table
            if (ddlCustomerList.SelectedValue != "-1")
            {
                //Selects First Name, Last Name, Phone, Email, Street, City, State and Total Customers from Customer Table
                //Where the CustomerID matches up with the selection from the drop down list
                String sqlQuery = "Select FirstName + ' ' + LastName as 'Name', ";
                sqlQuery += "phone as 'Phone', PhoneType as 'Phone Type', email as 'Email', ";
                sqlQuery += "InterestedIn as 'Interested In', OriginStreet + ' ' + OriginCity + ' ' + OriginState as 'Origin Address', DestinationStreet + ' ' + DestinationCity + ' ' + DestinationState as 'Destination Address', InitialContact as 'Initial Contact', ReferralChannel as 'Referral Channel', TotalEarnings as 'Total Earnings', DateContacted as 'Date Contacted', DeadlineStart as 'Deadline Start', DeadlineEnd as 'Deadline End' from Customer ";
                sqlQuery += "where Customer.CustomerID = " + ddlCustomerList.SelectedValue;

                //Establishes the connection between our web form and database
                SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab3;Trusted_Connection=Yes;");

                //The adapter is the bridge that pulls in both the query and the connection and stores it in adapter
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                //This creates a datatable and fills it
                DataTable dtForGridView = new DataTable();
                sqlAdapter.Fill(dtForGridView);

                //Sends the results from the datatable to the gridview
                grdOrderResults.DataSource = dtForGridView;
                grdOrderResults.DataBind();
                grdOrderResults.Visible = true;
            }
            else
            {
                //Hides gridview when no customer is selected
                grdOrderResults.Visible = false;
            }
        }

        protected void ddlCustomerList_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //When page first loads, set the customer ddl to the default of Select
                ListItem blankOption = new ListItem("Select", "-1");
                ddlCustomerList.Items.Insert(0, blankOption);
                ddlCustomerList.SelectedIndex = 0;

            }
        }
    }
}