using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Lab3
{
    public partial class FileIOTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void blistFileLinks_Click(object sender, BulletedListEventArgs e)
        {
            //Response.Write("<script>window.open ('" + blistFileLinks.Items + "','_blank');</script>");
        }

        protected void blistFileLinks_PreRender(object sender, EventArgs e)
        {
            string targetDirectory = "C:/Users/smitt/source/repos/walshad/RoCo_Consulting/uploads/";
            // Process the list of files found in the directory.
            string[] fileEntries = Directory.GetFiles(targetDirectory);
            
            foreach (string fileName in fileEntries)
            {
                blistFileLinks.Items.Add(new ListItem(Path.GetFileName(fileName), "uploads/" + Path.GetFileName(fileName)));
            }
        }
    }
}