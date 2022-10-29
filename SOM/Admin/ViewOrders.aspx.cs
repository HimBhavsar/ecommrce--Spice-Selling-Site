using SOM.Admin.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM.Admin
{
    public partial class ViewOrders : System.Web.UI.Page
    {
        DataTable dtOrderList = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
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
            Session["URL"] = "~/Admin/ViewOrders.aspx";

            if (!IsPostBack)
            {
                dtOrderList = DataViewer.ViewOrder();
                dgvOrdersList.DataSource = dtOrderList;
                dgvOrdersList.DataBind();
            }
        }

        protected void dgvOrdersList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }

        protected void lblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Home.aspx");
        }
        public static int OrderID = 0;

        protected void OrderNumber_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = sender as LinkButton;
                OrderID = Convert.ToInt32(btn.CommandArgument);
                Session["OrderID"] = OrderID;
                Response.Redirect("~/Admin/ViewOrderDetails.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }


        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}