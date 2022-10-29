using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class My_OrderDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
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
                    Session["URL"] = "~/MyOrderDetails.aspx";

                    Session["dtCartData"] = null;
                    Session["intItems"] = null;
                    Session["TotalBillAmount"] = null;

                    DataTable dtOrderDetails = new DataTable();
                    DataTable dtOrder = new DataTable();

                    int OrderID = 0;
                    if (Session["OrderID"] == null)
                    {
                        Response.Redirect("~/MyOrders.aspx");
                    }

                    int.TryParse(Convert.ToString(Session["OrderID"]), out OrderID);

                    if (OrderID == 0)
                    {
                        Response.Redirect("~/MyOrders.aspx");
                    }

                    dtOrder = DataViewer.ViewSpecificOrder(Convert.ToString(intLocalCustomerID),Convert.ToString(OrderID));
                    ViewState["OrderNumber"] = Convert.ToString(dtOrder.Rows[0]["OrderNumber"]);
                    DateTime dtOrderDateTime = Convert.ToDateTime(dtOrder.Rows[0]["OrderDateTime"]);
                    ViewState["OrderDate"] = dtOrderDateTime.ToString("dd-MMM-yyyy hh:mm tt");
                    ViewState["OrderValue"] = Convert.ToString(dtOrder.Rows[0]["OrderValue"]);
                    ViewState["DeliveryAddress"] = Convert.ToString(dtOrder.Rows[0]["Address"]);
                    dtOrderDetails = DataViewer.ViewOrderDetails(Convert.ToString(intLocalCustomerID), Convert.ToString(OrderID));
                    dtOrderDetails.Columns.Add(new DataColumn("ItemNo"));
                    dtOrderDetails.Columns.Add(new DataColumn("Weight"));
                    ViewState["OrderItems"] = Convert.ToInt32(dtOrderDetails.Rows.Count);
                    
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

                    dgvMyOrder.DataSource = dtOrderDetails;
                    dgvMyOrder.DataBind();
                    //dgvMyOrder.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        protected void dgvMyOrder_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }

        protected void lnkGoOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyOrders.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void lnkGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void LnkViewItems_Click(object sender, EventArgs e)
        {
            //if (dgvMyOrder.Visible)
            //{
            //    dgvMyOrder.Visible = false;
            //    lnkViewItems.Text = "View Items";
            //}
            //else
            //{
            //    dgvMyOrder.Visible = true;
            //    lnkViewItems.Text = "Hide Items";
            //}
        }

    }
}