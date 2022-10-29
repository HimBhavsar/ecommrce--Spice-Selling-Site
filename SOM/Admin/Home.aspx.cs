using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM.Admin
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["AdminUserID"] == null)
                {
                    Response.Redirect("~/Admin/Login.aspx");
                }

                int intAdminUserID = 0;

                int.TryParse(Convert.ToString(Session["AdminUserID"]), out intAdminUserID);

                if (intAdminUserID == 0)
                {
                    Response.Redirect("~/Admin/Login.aspx");
                }
                Session["URL"] = "~/Admin/Home.aspx";
            }
            catch (Exception ex)
            {
                return;
            }
            
        }


        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}