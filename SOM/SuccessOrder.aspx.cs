using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class SuccessOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                int intLocalCustomerID = 0;

                int.TryParse(Convert.ToString(Session["CustomerID"]), out intLocalCustomerID);

                if (intLocalCustomerID == 0)
                {
                    Response.Redirect("~/Login.aspx");
                }
                Session["URL"] = "~/SuccessOrder.aspx";

                Session["dtCartData"] = null;
                Session["intItems"] = null;
                Session["TotalBillAmount"] = null;
            }
        }
    }
}