using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class DeliveryTrackingSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                Session["URL"] = "~/DeliveryTrackingSystem.aspx";
            }
        }

        protected void ImgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void LblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}