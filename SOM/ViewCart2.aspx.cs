using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class ViewCart2 : System.Web.UI.Page
    {
        double dblTotalAmount = 0.00;
        int intItems = 0;

        DataTable cartData;

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
                Session["URL"] = "~/ViewCart2.aspx";
                cartData = new DataTable();
                cartData = Session["dtCartData"] as DataTable;
                
                if (cartData == null || cartData.Rows.Count == 0)
                {
                    lblNoData.Visible = true;
                    imgEmptyCart.Visible = true;
                    divCartItems.Visible = false;
                    
                    if(cartData == null)
                    {
                        Response.Redirect("DataLost.aspx");
                    }
                }

                for (int i = 0; i < cartData.Rows.Count; i++)
                {
                    DataTable dtProduct = DataViewer.GetProductDetails(Convert.ToInt32(cartData.Rows[i]["ItemID"]));
                    cartData.Rows[i]["ProductName"] = Convert.ToString(dtProduct.Rows[0]["ProductName"]);
                    cartData.Rows[i]["Path"] = Convert.ToString(dtProduct.Rows[0]["ProductImagePath"]);
                }

                dgvViewCart.DataSource = cartData;
                dgvViewCart.DataBind();

                if (Session["TotalBillAmount"] == null)
                    dblTotalAmount = 0.00;
                else
                    double.TryParse(Convert.ToString(Session["TotalBillAmount"]), out dblTotalAmount);
                lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);

                if(dblTotalAmount > 600)
                {
                    btnPlaceOrder.Enabled = true;
                    btnPlaceOrder.CssClass = "login100-form-btn";
                }
                else
                {
                    btnPlaceOrder.Enabled = false;
                    btnPlaceOrder.CssClass = "login100-form-btn";
                }
                if (Session["intItems"] == null)
                    intItems = 0;
                else
                    int.TryParse(Convert.ToString(Session["intItems"]), out intItems);
                lblItemsCount.Text = intItems + " Items";
                lblItemsCount.Text = Convert.ToString(intItems) + " Items";
                lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);

            }
        }


        protected void DgvViewCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }
        int RowIndex = 0;

        List<int> itemList = new List<int>();
        protected void BtnRemoveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                btn.Enabled = false;
                dblTotalAmount = Convert.ToDouble(Session["TotalBillAmount"]);
                intItems = Convert.ToInt32(Session["intItems"]);
                int intProductPackagingID = Convert.ToInt32(btn.CommandArgument);
                int add = Convert.ToInt32(btn.CommandArgument);
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                RowIndex = gvr.RowIndex;
                Label lblQty = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblQty");
                Label lblPriceParQty = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblPriceParQty");
                Label lblWeight = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblWeight");

                int qty = Convert.ToInt32(lblQty.Text);


                cartData = Session["dtCartData"] as DataTable;
                if (cartData == null || cartData.Rows.Count == 0)
                {
                    Response.Redirect("DataLost.aspx");
                }
                //Button btnRemoveProduct = (Button)row.FindControl("btnRemoveProduct");

                if (cartData.Rows.Count > 0)
                {
                    Button btnRemoveProduct = (Button)dgvViewCart.Rows[RowIndex].FindControl("btnRemoveProduct");

                    for (int count = 0; count < cartData.Rows.Count; count++)
                    {
                        if (Convert.ToString(cartData.Rows[count]["ProductPackagingID"]) == Convert.ToString(intProductPackagingID))
                        {
                            if (qty >= 1)
                            {
                                qty--;

                                string strGrams = lblWeight.Text;
                                double value = Convert.ToDouble(cartData.Rows[count]["Value"]);
                                double PricePerQty = qty * value;
                                double dblDiscount = 0.00;

                                cartData.Rows[count]["ItemID"] = add;
                                cartData.Rows[count]["ProductPackagingID"] = intProductPackagingID;
                                cartData.Rows[count]["Grams"] = strGrams;
                                cartData.Rows[count]["Value"] = value;
                                cartData.Rows[count]["qty"] = qty;
                                cartData.Rows[count]["PriceParQty"] = PricePerQty;
                                cartData.Rows[count]["Discouunt"] = dblDiscount;
                                Session["dtCartData"] = cartData;

                                lblQty.Text = Convert.ToString(qty);
                                lblPriceParQty.Text = "PPQ. " + string.Format("{0:0.00}", PricePerQty);
                                //Session["TotalBillAmount"] = dblTotalAmount;
                                if (qty <= 0)
                                {
                                    if (qty == 0)
                                    {
                                        if (itemList.Contains(add))
                                        {
                                            itemList.Remove(add);
                                        }
                                        for (int i = cartData.Rows.Count - 1; i >= 0; i--)
                                        {
                                            DataRow dr = cartData.Rows[i];
                                            if (dr["qty"].ToString() == "0" && dr["ProductPackagingID"].ToString() == intProductPackagingID.ToString())
                                            {
                                                dr.Delete();
                                            }
                                        }
                                        cartData.AcceptChanges();
                                    }
                                    Session["dtCartData"] = cartData;

                                    dblTotalAmount = dblTotalAmount - value;
                                    Session["TotalBillAmount"] = dblTotalAmount;
                                    btnRemoveProduct.Enabled = false;
                                }
                                else
                                {
                                    dblTotalAmount = dblTotalAmount - value;
                                    Session["TotalBillAmount"] = dblTotalAmount;
                                    btnRemoveProduct.Enabled = true;
                                }
                                intItems = cartData.Rows.Count;
                                Session["intItems"] = intItems;
                                lblItemsCount.Text = Convert.ToString(intItems) + " Items";
                                lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);
                                if (dblTotalAmount > 600)
                                {
                                    btnPlaceOrder.Enabled = true;
                                    btnPlaceOrder.CssClass = "login100-form-btn";
                                }
                                else
                                {
                                    btnPlaceOrder.Enabled = false;
                                    btnPlaceOrder.CssClass = "login100-form-btn";
                                }
                                break;
                            }
                        }
                    }
                }
                else
                {
                    lblError.Text = "There is error in something please Try after some time";
                    lblError.CssClass = "error-messege";
                    return;
                }
                if (dblTotalAmount > 600)
                {
                    btnPlaceOrder.Enabled = true;
                    btnPlaceOrder.CssClass = "login100-form-btn";
                }
                else
                {
                    btnPlaceOrder.Enabled = false;
                    btnPlaceOrder.CssClass = "login100-form-btn";
                }
                if (cartData.Rows.Count == 0)
                {
                    lblNoData.Visible = true;
                    imgEmptyCart.Visible = true;
                    divCartItems.Visible = false;
                }

                dgvViewCart.DataSource = cartData;
                dgvViewCart.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            cartData = Session["dtCartData"] as DataTable;
            if (cartData == null || cartData.Rows.Count == 0)
            {
                Response.Redirect("DataLost.aspx");
            }
            try
            {
                btn.Enabled = false;
                
                GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                RowIndex = gvr.RowIndex;
                Label lblQty = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblQty");
                Label lblPrice = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblPrice");
                Label lblPriceParQty = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblPriceParQty");
                Label lblWeight = (Label)dgvViewCart.Rows[RowIndex].FindControl("lblWeight");
                int intProductPackagingID = Convert.ToInt32(btn.CommandArgument);
                int qty = Convert.ToInt32(lblQty.Text);
                dblTotalAmount = Convert.ToDouble(Session["TotalBillAmount"]);
                intItems = Convert.ToInt32(Session["intItems"]);

                //Button btnRemoveProduct = (Button)row.FindControl("btnRemoveProduct");


                Button btnRemoveProduct = (Button)dgvViewCart.Rows[RowIndex].FindControl("btnRemoveProduct");

                for (int count = 0; count < cartData.Rows.Count; count++)
                {
                    bool Isfound = false;
                    if (Convert.ToString(cartData.Rows[count]["ProductPackagingID"]) == Convert.ToString(intProductPackagingID))
                    {
                        Isfound = true;
                        if (qty >= 0)
                        {
                            qty++;

                            string strWeight = lblWeight.Text;
                            double value = Convert.ToDouble(cartData.Rows[count]["Value"]);
                            double PricePerQty = qty * value;
                            double dblDiscount = 0.00;

                            cartData.Rows[count]["ItemID"] = cartData.Rows[count]["ItemID"];
                            cartData.Rows[count]["ProductPackagingID"] = intProductPackagingID;
                            cartData.Rows[count]["Grams"] = strWeight;
                            cartData.Rows[count]["Value"] = value;
                            cartData.Rows[count]["qty"] = qty;
                            cartData.Rows[count]["PriceParQty"] = PricePerQty;
                            cartData.Rows[count]["Discouunt"] = dblDiscount;
                            Session["dtCartData"] = cartData;

                            lblQty.Text = Convert.ToString(qty);
                            lblPriceParQty.Text = "PPQ. " + string.Format("{0:0.00}", PricePerQty);
                            dblTotalAmount = dblTotalAmount + value;
                            Session["TotalBillAmount"] = dblTotalAmount;
                            btnRemoveProduct.Enabled = true;
                            intItems = cartData.Rows.Count;
                            Session["intItems"] = intItems;
                            lblItemsCount.Text = Convert.ToString(intItems) + " Items";
                            lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);
                            if (dblTotalAmount >= 600)
                            {
                                btnPlaceOrder.Enabled = true;
                                btnPlaceOrder.CssClass = "login100-form-btn";
                            }
                            break;
                        }

                    }
                    if ((count + 1) == cartData.Rows.Count)
                    {
                        if (Isfound == false)
                        {
                            if (qty >= 0)
                            {
                                qty++;

                                string strWeight = lblWeight.Text;
                                double value = Convert.ToDouble(cartData.Rows[count]["Value"]);
                                double PricePerQty = qty * value;
                                double dblDiscount = 0.00;

                                DataRow dr = cartData.NewRow();
                                dr["ItemID"] = cartData.Rows[count]["ItemID"];
                                dr["ProductPackagingID"] = intProductPackagingID;
                                dr["Grams"] = strWeight;
                                dr["Value"] = value;
                                dr["qty"] = qty;
                                dr["PriceParQty"] = PricePerQty;
                                dr["Discouunt"] = dblDiscount;
                                cartData.Rows.Add(dr);

                                Session["dtCartData"] = cartData;

                                lblQty.Text = Convert.ToString(qty);
                                lblPriceParQty.Text = "PPQ. " + string.Format("{0:0.00}", PricePerQty);
                                dblTotalAmount = dblTotalAmount + value;
                                Session["TotalBillAmount"] = dblTotalAmount;
                                btnRemoveProduct.Enabled = true;
                                intItems = cartData.Rows.Count;
                                Session["intItems"] = intItems;
                                lblItemsCount.Text = Convert.ToString(intItems) + " Items";
                                lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);
                                if (dblTotalAmount > 600)
                                {
                                    btnPlaceOrder.Enabled = true;
                                    btnPlaceOrder.CssClass = "login100-form-btn";
                                }
                                break;
                            }
                        }
                    }
                }

                btn.Enabled = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void LnkViewProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void LnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void LnkGoToProductsPage_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                int intSuccess = 0;

                if (Session["TotalBillAmount"] == null)
                    dblTotalAmount = 0.00;
                else
                    double.TryParse(Convert.ToString(Session["TotalBillAmount"]), out dblTotalAmount);
                lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);


                if (Session["intItems"] == null)
                    intItems = 0;
                else
                    int.TryParse(Convert.ToString(Session["intItems"]), out intItems);
                lblItemsCount.Text = intItems + " Items";

                cartData = Session["dtCartData"] as DataTable;
                if (cartData == null || cartData.Rows.Count == 0)
                {
                    Response.Redirect("DataLost.aspx");
                }

                if (Session["CustomerID"] == null)
                {
                    lblError.Text = "You can't place order without Login";
                    lblError.Focus();
                    return;
                }
                int CustomerID = 0;
                int.TryParse(Convert.ToString(Session["CustomerID"]), out CustomerID);

                if (CustomerID == 0)
                {
                    lblError.Text = "You can't place order without Login";
                    lblError.Focus();
                    return;
                }

                if (lblTotalAmount.Text.Trim() == "" || string.IsNullOrEmpty(lblTotalAmount.Text.Trim()))
                {
                    lblError.Text = "Please Select Item to Buy!!";
                    lblError.Focus();
                    return;
                }

                if (lblItemsCount.Text.Trim() == "" || string.IsNullOrEmpty(lblItemsCount.Text.Trim()))
                {
                    lblError.Text = "Please Select Item To Buy!!";
                    lblError.Focus();
                    return;
                }

                if (lblItemsCount.Text == "0 Items" || lblTotalAmount.Text == "Rs. 0.00")
                {
                    lblError.Text = "Please Select Item To Buy!!";
                    lblError.Focus();
                    return;
                }

                if (lblTotalAmount.Text != "Rs. 0.00")
                {
                    if (lblItemsCount.Text == "0 Items")
                    {
                        lblError.Text = "There is error in someting! Please relogin and try again!";
                        lblError.Focus();
                        return;
                    }
                }

                if (cartData.Rows.Count == 0 || cartData == null)
                {
                    lblError.Text = "Please Select Item To Buy!!";
                    lblError.Focus();
                    return;
                }

                int intOrder = DataHandler.addOrder(Convert.ToString(CustomerID), dblTotalAmount.ToString(), "False", "");
                if (intOrder > 0)
                {
                    for (int i = 0; i < cartData.Rows.Count; i++)
                    {
                        double dblTotalAmountOfProduct = Convert.ToDouble(cartData.Rows[i]["Value"]) * Convert.ToDouble(cartData.Rows[i]["qty"]);
                        int intresult = DataHandler.addOrderDetails(intOrder, Convert.ToInt32(cartData.Rows[i]["ProductPackagingID"]), Convert.ToInt32(cartData.Rows[i]["qty"]), Convert.ToDouble(cartData.Rows[i]["Value"]), Convert.ToDouble(cartData.Rows[i]["Discouunt"]));


                        if (intresult > 0)
                        {
                            intSuccess++;
                            lblError.Text = "Order Placed!!";
                            lblError.CssClass = "success-messege";

                        }
                        else
                        {
                            lblError.Text = "There is error while placing Order from";
                            lblError.CssClass = "error-messege";
                            return;

                        }
                    }
                }

                if (intSuccess == cartData.Rows.Count)
                {

                    DataTable dtOrder = DataViewer.ViewSpecificOrder(Convert.ToString(Session["CustomerID"]), Convert.ToString(intOrder));
                    string OrderNumber = Convert.ToString(dtOrder.Rows[0]["OrderNumber"]);
                    SMS sms = new SMS();
                    sms.SendSMS(Convert.ToString(Session["MobileNumber"]), "Hi " + Convert.ToString(Session["Username"]) + ", Your new order has been placed. Your Order: "+ OrderNumber +" will Arriving Soon.");

                    cartData.Clear();
                    itemList.Clear();
                    Session["dtCartData"] = cartData;
                    Session["dtCartData"] = null;
                    cartData = null;
                    itemList = null;
                    

                    intItems = 0;
                    Session["intItems"] = intItems;
                    Session["intItems"] = null;

                    dblTotalAmount = 0.00;
                    Session["TotalBillAmount"] = dblTotalAmount;
                    Session["TotalBillAmount"] = null;

                    Response.Redirect("~/SuccessOrder.aspx");
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void DgvViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddItem")
            {
                GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                RowIndex = gvr.RowIndex;
            }
            if (e.CommandName == "RemoveItem")
            {
                GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                RowIndex = gvr.RowIndex;
            }
        }

        protected void ImgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void DgvViewCart_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvViewCart.PageIndex = e.NewPageIndex;
            dgvViewCart.DataBind();
        }

        protected void LnkProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}