using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["CustomerID"] == null || Convert.ToInt32(Session["CustomerID"]) == 0)
                {
                    Response.Redirect("~/Login.aspx");
                }

                int IntLocalCustomerID = 0;

                int.TryParse(Convert.ToString(Session["CustomerID"]), out IntLocalCustomerID);

                if (IntLocalCustomerID == 0)
                {
                    Response.Redirect("~/Login.aspx");
                }
                Session["URL"] = "~/Home.aspx";
            }
            
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            // Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
            //if (Session["dtCartData"] as DataTable != null)
            //{
            //    modal2.Attributes["aria-hidden"] = "false";
            //}
            //else
            //{
            //    Session.RemoveAll();
            //    Response.Redirect("~/Login.aspx");
            //}
        }

        protected void BtnYes_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void BtnNo_Click(object sender, EventArgs e)
        {
            modal2.Attributes["aria-hidden"] = "true";
        }

        protected void ImgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}