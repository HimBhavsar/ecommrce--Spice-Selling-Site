using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class DataLost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["CustomerID"] != null || Convert.ToInt32(Session["CustomerID"]) > 0) || (Session["dtCartData"] != null) || Session["intItems"] != null)
            {
                Response.Redirect(Convert.ToString(Session["URL"]));
            }
        }

        

        protected void ImgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }

        protected void BtnReLogin_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}