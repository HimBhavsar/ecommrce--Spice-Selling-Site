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
    public partial class MyOrder : System.Web.UI.Page
    {
        DataTable dtOrderList;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    
                    Session["URL"] = "~/MyOrders.aspx";

                    Session["dtCartData"] = null;
                    Session["intItems"] = null;
                    Session["TotalBillAmount"] = null;

                    dtOrderList = DataViewer.ViewMyOrder(Convert.ToString(intLocalCustomerID));
                    dgvMyOrderList.DataSource = dtOrderList;
                    dgvMyOrderList.DataBind();

                    if (dtOrderList.Rows.Count > 0)
                        divEmptyOrder.Visible = false;
                    else
                        divEmptyOrder.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        
        protected void OrderNumber_Click(object sender, EventArgs e)
        {
            try
            {
                if(Session["CustomerID"] == null)
                {
                    Response.Redirect("DataLost.aspx");
                }
                int OrderID = 0;
                LinkButton btn = sender as LinkButton;
                OrderID = Convert.ToInt32(btn.CommandArgument);
                Session["OrderID"] = OrderID;
                Response.Redirect("~/MyOrderDetails.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        protected void dgvMyOrderList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }

        protected void lblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        

        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Products.aspx");
        }

        protected void BtnCancelOrder_Click(object sender, EventArgs e)
        {
            Button BtnCancelOrder = sender as Button;
            
            Image imgCancelledOrder = BtnCancelOrder.NamingContainer.FindControl("imgCancelledOrder") as Image;
            TextBox txtCancelationReason = BtnCancelOrder.NamingContainer.FindControl("txtCancelationReason") as TextBox;
            string intOrderID = Convert.ToString(BtnCancelOrder.CommandArgument);
            bool IsCancelled = true;
            string strCancellationReason = txtCancelationReason.Text;
            if (string.IsNullOrWhiteSpace(strCancellationReason))
                strCancellationReason = string.Empty;

            int intResult = 0;
            intResult = DataHandler.cancelOrder(Convert.ToInt32(intOrderID), IsCancelled, strCancellationReason);
            if (intResult > 0)
            {
                imgCancelledOrder.Visible = true;
                BtnCancelOrder.Visible = false;
            }
            else
            {
                imgCancelledOrder.Visible = false;
                BtnCancelOrder.Visible = true;
            }
        }
    }
}