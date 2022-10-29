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
    public partial class ViewOrderDetails : System.Web.UI.Page
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
                Session["URL"] = "~/Admin/ViewOrderDetails.aspx";
                DataTable dtOrderDetails = new DataTable();
                DataTable dtOrder = new DataTable();
                dtOrder = DataViewer.ViewSpecificOrder(Convert.ToString(Session["OrderID"]));
                Session["OrderNumber"] = Convert.ToString(dtOrder.Rows[0]["OrderNumber"]);
                DateTime dtOrderDateTime = Convert.ToDateTime(dtOrder.Rows[0]["OrderDateTime"]);
                Session["CustomerName"] = dtOrder.Rows[0]["Name"];
                Session["CustomerMobile"] = dtOrder.Rows[0]["MobileNumber"];
                Session["Address"] = dtOrder.Rows[0]["Address"];
                Session["OrderDate"] = dtOrderDateTime.ToString("dd-MMM-yyyy hh:mm tt");
                Session["OrderValue"] = Convert.ToString(dtOrder.Rows[0]["OrderValue"]);
                
                dtOrderDetails = DataViewer.ViewOrderDetails(Convert.ToString(Session["OrderID"]));
                dtOrderDetails.Columns.Add(new DataColumn("ItemNo"));
                Session["OrderItems"] = Convert.ToInt32(dtOrderDetails.Rows.Count);
                dtOrderDetails.Columns.Add(new DataColumn("Weight"));
                for (int count = 0; count < dtOrderDetails.Rows.Count; count++)
                {

                    if (Convert.ToInt32(dtOrderDetails.Rows[count]["WeightInGrams"]) < 1000)
                    {
                        dtOrderDetails.Rows[count]["ItemNo"] = count + 1;
                        dtOrderDetails.Rows[count]["Weight"] = Convert.ToString(dtOrderDetails.Rows[count]["WeightInGrams"]) + " g.";
                    }
                    else
                    {
                        dtOrderDetails.Rows[count]["ItemNo"] = count + 1;

                        dtOrderDetails.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtOrderDetails.Rows[count]["WeightInGrams"]) / 1000) + " kg.";

                    }

                }
                dgvOrderDetails.DataSource = dtOrderDetails;
                dgvOrderDetails.DataBind();

            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        protected void dgvOrderDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }

        protected void lnkGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Home.aspx");
        }

        protected void lnkGoOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/ViewOrders.aspx");
        }

        protected void lblItem_Click(object sender, EventArgs e)
        {

        }


        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}