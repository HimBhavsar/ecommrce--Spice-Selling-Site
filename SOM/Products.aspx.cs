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
    public partial class DataListView : System.Web.UI.Page
    {
        DataTable cartData;
        double dblTotalAmount = 0.00;
        int intItems = 0;
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
                    Session["URL"] = "~/Products.aspx";

                    btnPlaceOrder.Enabled = false;
                    btnPlaceOrder.CssClass = "login100-form-btn";

                    if (Session["TotalBillAmount"] == null)
                        dblTotalAmount = 0.00;
                    else
                        double.TryParse(Convert.ToString(Session["TotalBillAmount"]), out dblTotalAmount);
                    lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", dblTotalAmount);
                    if (dblTotalAmount >= 600)
                    {
                        btnPlaceOrder.Enabled = true;
                        btnPlaceOrder.CssClass = "login100-form-btn";

                    }

                    if (Session["intItems"] == null)
                        intItems = 0;
                    else
                        int.TryParse(Convert.ToString(Session["intItems"]), out intItems);
                    lblItemsCount.Text = intItems + " Items";


                    if (Session["dtCartData"] != null)
                        cartData = Session["dtCartData"] as DataTable;

                    if (cartData == null || cartData.Columns.Count != 9)
                    {
                        cartData = new DataTable();
                        cartData.Columns.AddRange(new DataColumn[]
                            {
                            new DataColumn("ItemID"),
                            new DataColumn("ProductPackagingID"),
                            new DataColumn("Grams"),
                            new DataColumn("Value"),
                            new DataColumn("qty"),
                            new DataColumn("PriceParQty"),
                            new DataColumn("Discouunt"),
                            new DataColumn("ProductName"),
                            new DataColumn("Path")
                        });
                        Session["dtCartData"] = cartData;
                    }

                    DataTable dtProducts = DataViewer.ViewProducts();
                    dgvProducts.DataSource = dtProducts;
                    dgvProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.ForeColor = Color.Red;
                return;
            }
        }

        protected void ImgLogout_Click(object sender, ImageClickEventArgs e)
        {

            Session.Abandon();
            Response.Redirect("Login.aspx");
            //if (Session["dtCartData"] == null)
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    modal2.Visible = true;
            //    //modal2.Attributes["aria-hidden"] = "false";
            //}
        }

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dtProducts = DataViewer.filterProducts(txtSearch.Text.Trim());
                dgvProducts.DataSource = dtProducts;
                dgvProducts.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void DdlPackaging_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList ddl = (DropDownList)sender;

                cartData = Session["dtCartData"] as DataTable;


                Label lblQtyAndRate = (Label)ddl.NamingContainer.FindControl("lblQtyAndRate");
                Button btnRemoveProduct = (Button)ddl.NamingContainer.FindControl("btnRemoveProduct");
                //DataRow[] rows = cartData.Select("ProductPackagingID = " + ddlPackaging.SelectedItem.Value);
                //lblTotalAmount.Text = "Rs. " + string.Format("{0:0.00}", Convert.ToDouble(Session["TotalBillAmount"] as string));
                //lblItemsCount.Text = Convert.ToInt32(Session["intItems"] as string) + " Items";
                if (cartData != null)
                {
                    for (int counter = 0; counter < cartData.Rows.Count; counter++)
                    {
                        if (Convert.ToInt32(cartData.Rows[counter]["ProductPackagingID"]) == Convert.ToInt32(ddl.SelectedItem.Value))
                        {
                            double ppq = Convert.ToDouble(cartData.Rows[counter]["PriceParQty"]);
                            lblQtyAndRate.Text = Convert.ToString(cartData.Rows[counter]["qty"]) + " / Rs. " + string.Format("{0:0.00}", ppq);
                            break;
                        }
                        else
                        {
                            lblQtyAndRate.Text = "0 / Rs. 0.00";

                        }
                    }
                }

                //if (rows.Length > 0)
                //{
                //    double ppq = Convert.ToDouble(rows[0].ItemArray[5]);
                //    lblQtyAndRate.Text = rows[0].ItemArray[4] + " / Rs. " + string.Format("{0:0.00}", ppq);
                //}
                //else
                //{
                //    lblQtyAndRate.Text = "0 / Rs. 0.00";
                //}

                string[] values = lblQtyAndRate.Text.Split('/');
                int q = Convert.ToInt32(values[0]);

                if (q > 0)
                {
                    btnRemoveProduct.Enabled = true;
                }
                else
                {
                    btnRemoveProduct.Enabled = false;
                }


            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void BtnRemoveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                btn.Enabled = false;
                dblTotalAmount = Convert.ToDouble(Session["TotalBillAmount"]);
                intItems = Convert.ToInt32(Session["intItems"]);

                int add = Convert.ToInt32(btn.CommandArgument);

                Label lblQtyAndRate = (Label)btn.NamingContainer.FindControl("lblQtyAndRate");
                string[] lblText = lblQtyAndRate.Text.Split('/');
                int qty = Convert.ToInt32(lblText[0]);
                cartData = Session["dtCartData"] as DataTable;
                if (cartData == null)
                {
                    Response.Redirect("DataLost.aspx");
                }
                //Button btnRemoveProduct = (Button)row.FindControl("btnRemoveProduct");

                if (cartData.Rows.Count > 0)
                {
                    Button btnRemoveProduct = (Button)btn.NamingContainer.FindControl("btnRemoveProduct");
                    DropDownList ddlPackaging = (DropDownList)btn.NamingContainer.FindControl("ddlPackaging");
                    if (ddlPackaging.SelectedItem.Value == "0")
                    {
                        btn.Attributes["data-modal"] = "#modal1";
                        lblErrorMsg.Text = "Please Select Package";

                        lblError.Text = "Please Select Package";
                        lblError.CssClass = "error-messege";
                        return;
                    }
                    else
                    {
                        lblError.Text = "";
                        lblError.CssClass = "error-messege";
                    }
                    for (int count = 0; count < cartData.Rows.Count; count++)
                    {
                        if (Convert.ToString(cartData.Rows[count]["ProductPackagingID"]) == Convert.ToString(ddlPackaging.SelectedItem.Value))
                        {
                            if (qty >= 1)
                            {
                                qty--;

                                string strProductPackagingID = ddlPackaging.SelectedValue;

                                string selectedText = ddlPackaging.SelectedItem.Text;
                                string[] values = selectedText.Split('-');
                                double value = Convert.ToDouble(values[1].Replace("Rs.", ""));
                                double PricePerQty = qty * value;
                                double dblDiscount = 0.00;

                                cartData.Rows[count]["ItemID"] = add;
                                cartData.Rows[count]["ProductPackagingID"] = ddlPackaging.SelectedItem.Value;
                                cartData.Rows[count]["Grams"] = values[0];
                                cartData.Rows[count]["Value"] = value;
                                cartData.Rows[count]["qty"] = qty;
                                cartData.Rows[count]["PriceParQty"] = PricePerQty;
                                cartData.Rows[count]["Discouunt"] = dblDiscount;
                                Session["dtCartData"] = cartData;

                                lblQtyAndRate.Text = qty + " / Rs. " + string.Format("{0:0.00}", PricePerQty);
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
                                            if (dr["qty"].ToString() == "0" && dr["ProductPackagingID"].ToString() == ddlPackaging.SelectedItem.Value.ToString())
                                            {
                                                dr.Delete();
                                            }
                                        }
                                        cartData.AcceptChanges();
                                    }
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
                                if (dblTotalAmount >= 600)
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

                    btn.Attributes["data-modal"] = "#modal1";
                    lblErrorMsg.Text = "There is error in something please Try after some time";
                    lblError.Text = "There is error in something please Try after some time";
                    lblError.CssClass = "error-messege";
                    return;
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }


        List<int> itemList = new List<int>();
        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            btn.Enabled = false;
            cartData = Session["dtCartData"] as DataTable;
            if (cartData == null)
            {
                Response.Redirect("DataLost.aspx");
            }
            try
            {
                btn.Enabled = false;
                int add = Convert.ToInt32(btn.CommandArgument);

                Label lblQtyAndRate = (Label)btn.NamingContainer.FindControl("lblQtyAndRate");
                string[] lblText = lblQtyAndRate.Text.Split('/');
                int qty = Convert.ToInt32(lblText[0]);
                dblTotalAmount = Convert.ToDouble(Session["TotalBillAmount"]);
                intItems = Convert.ToInt32(Session["intItems"]);

                //Button btnRemoveProduct = (Button)row.FindControl("btnRemoveProduct");
                if (cartData.Rows.Count == 0)
                {
                    if (qty >= 0)
                    {
                        Button btnRemoveProduct = (Button)btn.NamingContainer.FindControl("btnRemoveProduct");
                        DropDownList ddlPackaging = (DropDownList)btn.NamingContainer.FindControl("ddlPackaging");
                        if (ddlPackaging.SelectedItem.Value == "0")
                        {
                            btn.Attributes["data-modal"] = "#modal1";
                            lblErrorMsg.Text = "Please Select Package";
                            lblError.Text = "Please Select Package";
                            lblError.CssClass = "error-messege";
                            btn.Enabled = true;
                            return;
                        }
                        else
                        {
                            lblError.Text = "";
                            lblError.CssClass = "error-messege";

                        }
                        if (itemList.Count == 0)
                        {
                            itemList.Add(add);

                        }
                        else
                        {
                            if (!itemList.Contains(add))
                            {
                                itemList.Add(add);
                            }
                        }
                        qty++;

                        string strProductPackagingID = ddlPackaging.SelectedValue;

                        string selectedText = ddlPackaging.SelectedItem.Text;
                        string[] values = selectedText.Split('-');
                        double value = Convert.ToDouble(values[1].Replace("Rs.", ""));
                        double PricePerQty = qty * value;
                        double dblDiscount = 0.00;
                        DataRow dr = cartData.NewRow();
                        dr["ItemID"] = add;
                        dr["ProductPackagingID"] = ddlPackaging.SelectedItem.Value;
                        dr["Grams"] = values[0];
                        dr["Value"] = value;
                        dr["qty"] = qty;
                        dr["PriceParQty"] = PricePerQty;
                        dr["Discouunt"] = dblDiscount;
                        cartData.Rows.Add(dr);

                        Session["dtCartData"] = cartData;

                        lblQtyAndRate.Text = qty + " / Rs. " + string.Format("{0:0.00}", PricePerQty);
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
                    }

                }
                else
                {
                    Button btnRemoveProduct = (Button)btn.NamingContainer.FindControl("btnRemoveProduct");
                    DropDownList ddlPackaging = (DropDownList)btn.NamingContainer.FindControl("ddlPackaging");
                    if (ddlPackaging.SelectedItem.Value == "0")
                    {
                        btn.Attributes["data-modal"] = "#modal1";
                        lblErrorMsg.Text = "Please Select Package";
                        lblError.Text = "Please Select Package";
                        lblError.CssClass = "error-messege";
                        btn.Enabled = true;
                        return;

                    }
                    else
                    {
                        lblError.Text = "";
                        lblError.CssClass = "error-messege";

                    }
                    for (int count = 0; count < cartData.Rows.Count; count++)
                    {
                        bool Isfound = false;
                        if (Convert.ToString(cartData.Rows[count]["ProductPackagingID"]) == Convert.ToString(ddlPackaging.SelectedItem.Value))
                        {
                            Isfound = true;
                            if (qty >= 0)
                            {
                                qty++;

                                string strProductPackagingID = ddlPackaging.SelectedValue;

                                string selectedText = ddlPackaging.SelectedItem.Text;
                                string[] values = selectedText.Split('-');
                                double value = Convert.ToDouble(values[1].Replace("Rs.", ""));
                                double PricePerQty = qty * value;
                                double dblDiscount = 0.00;

                                cartData.Rows[count]["ItemID"] = add;
                                cartData.Rows[count]["ProductPackagingID"] = ddlPackaging.SelectedItem.Value;
                                cartData.Rows[count]["Grams"] = values[0];
                                cartData.Rows[count]["Value"] = value;
                                cartData.Rows[count]["qty"] = qty;
                                cartData.Rows[count]["PriceParQty"] = PricePerQty;
                                cartData.Rows[count]["Discouunt"] = dblDiscount;
                                Session["dtCartData"] = cartData;

                                lblQtyAndRate.Text = qty + " / Rs. " + string.Format("{0:0.00}", PricePerQty);
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

                                    string strProductPackagingID = ddlPackaging.SelectedValue;

                                    string selectedText = ddlPackaging.SelectedItem.Text;
                                    string[] values = selectedText.Split('-');
                                    double value = Convert.ToDouble(values[1].Replace("Rs. ", ""));
                                    double PricePerQty = qty * value;
                                    double dblDiscount = 0.00;

                                    DataRow dr = cartData.NewRow();
                                    dr["ItemID"] = add;
                                    dr["ProductPackagingID"] = ddlPackaging.SelectedItem.Value;
                                    dr["Grams"] = values[0];
                                    dr["Value"] = value;
                                    dr["qty"] = qty;
                                    dr["PriceParQty"] = PricePerQty;
                                    dr["Discouunt"] = dblDiscount;
                                    cartData.Rows.Add(dr);

                                    Session["dtCartData"] = cartData;

                                    lblQtyAndRate.Text = qty + " / Rs. " + string.Format("{0:0.00}", PricePerQty);
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
                        }
                    }
                }
                btn.Enabled = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                btn.Enabled = true;
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void BtnPlaceOrder_Click(object sender, EventArgs e)
        {
            cartData = Session["dtCartData"] as DataTable;
            if (cartData == null || cartData.Rows.Count == 0)
            {
                Response.Redirect("DataLost.aspx");
            }
            Response.Redirect("Viewcart2.aspx");
        }

        protected void DgvProducts_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string strPID = string.Empty;
            Label lblPID = (Label)e.Item.FindControl("lblPID");
            strPID = lblPID.Text;

            DataTable dtPackaging = DataViewer.ProductPackagingDDL(strPID);

            Label lblQtyAndRate = (Label)e.Item.FindControl("lblQtyAndRate");

            dtPackaging.Columns.Add(new DataColumn("W&P"));
            for (int count = 0; count < dtPackaging.Rows.Count; count++)
            {
                if (count == 0)
                {
                    dtPackaging.Rows[count]["W&P"] = dtPackaging.Rows[count]["WeightInGrams"];
                    continue;
                }
                if (Convert.ToInt32(dtPackaging.Rows[count]["WeightInGrams"]) < 1000)
                {
                    dtPackaging.Rows[count]["W&P"] = Convert.ToString(dtPackaging.Rows[count]["WeightInGrams"]) + " g. - Rs. " + Convert.ToString(dtPackaging.Rows[count]["MRP"]);
                }
                else
                {
                    dtPackaging.Rows[count]["W&P"] = Convert.ToDouble(Convert.ToInt32(dtPackaging.Rows[count]["WeightInGrams"]) / 1000) + " kg. - Rs. " + Convert.ToString(dtPackaging.Rows[count]["MRP"]);
                }
            }
            DropDownList ddlPackaging = (DropDownList)e.Item.FindControl("ddlPackaging");
            ddlPackaging.DataSource = dtPackaging;

            ddlPackaging.DataTextField = Convert.ToString(dtPackaging.Columns["W&P"]);
            ddlPackaging.DataValueField = Convert.ToString(dtPackaging.Columns["ProductPackagingID"]);

            ddlPackaging.DataBind();

            cartData = Session["dtCartData"] as DataTable;
            //When Coming back from ViewDetails Page To Products Page the selected product should be shown as it is
            if (cartData.Rows.Count > 0)
            {
                List<int> lstProductPackages = new List<int>();

                for (int count = 0; count < cartData.Rows.Count; count++)
                {
                    if(Convert.ToInt32(strPID) == Convert.ToInt32(cartData.Rows[count]["ItemID"]))
                    {
                        lstProductPackages.Add(Convert.ToInt32(cartData.Rows[count]["ProductPackagingID"]));

                    }
                    
                }
                if(lstProductPackages.Count > 0 )
                {
                    int intMax = lstProductPackages.Max();
                    ddlPackaging.Items.FindByValue(Convert.ToString(intMax)).Selected = true;
                    for (int counter = 0; counter < cartData.Rows.Count; counter++)
                    {
                        if (Convert.ToInt32(cartData.Rows[counter]["ProductPackagingID"]) == intMax)
                        {
                            double dblPPQ = Convert.ToDouble(cartData.Rows[counter]["PriceParQty"]);
                            lblQtyAndRate.Text = cartData.Rows[counter]["qty"] + " / Rs. " + string.Format("{0:0.00}", dblPPQ);
                            break;
                        }
                    }
                }
                
            }


            string[] values = lblQtyAndRate.Text.Split('/');
            int strQty = Convert.ToInt32(values[0]);
            if (strQty <= 0)
            {
                Button btnRemoveProduct = (Button)e.Item.FindControl("btnRemoveProduct");
                btnRemoveProduct.Enabled = false;
            }
            else
            {
                Button btnRemoveProduct = (Button)e.Item.FindControl("btnRemoveProduct");
                btnRemoveProduct.Enabled = true;
            }
        }

        protected void LblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void ImgCartIcon_Click(object sender, ImageClickEventArgs e)
        {
            cartData = Session["dtCartData"] as DataTable;
            if (cartData == null )
            {
                Response.Redirect("DataLost.aspx");
            }
            if(cartData.Rows.Count >= 0)
            {
                Response.Redirect("Viewcart2.aspx");

            }
        }

        protected void BtnYes_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void BtnNo_Click(object sender, EventArgs e)
        {

        }
    }
}