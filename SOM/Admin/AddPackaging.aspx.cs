using SOM.Admin.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM.Admin
{
    public partial class AddPackaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
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
                    Session["URL"] = "~/Admin/AddPackaging.aspx";

                    DataTable dtProduct = new DataTable();
                    dtProduct = DataViewer.DdlProduct();
                    ddlProductName.DataSource = dtProduct;
                    ddlProductName.DataTextField = Convert.ToString(dtProduct.Columns["ProductName"]);
                    ddlProductName.DataValueField = Convert.ToString(dtProduct.Columns["ProductID"]);
                    ddlProductName.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int intProductID = 0;
                if(ddlProductName.SelectedIndex == 0)
                {
                    lblError.Text = "Please Insert Weight!!";
                    txtWeightInGrams.Focus();
                    return;
                }
                else
                {
                    intProductID = Convert.ToInt32(ddlProductName.SelectedItem.Value);
                }

                if(string.IsNullOrEmpty(txtWeightInGrams.Text.Trim()))
                {
                    lblError.Text = "Please Insert Weight!!";
                    txtWeightInGrams.Focus();
                    return;

                }


                Regex regex = new Regex("^[a-zA-Z]+$");
                if (regex.IsMatch(txtWeightInGrams.Text))
                {
                    lblError.Text = "You are adding Letters which is not valid!";
                    txtWeightInGrams.Focus();
                    return;
                }

                if(Convert.ToInt32(txtWeightInGrams.Text) == 0 && Convert.ToInt32(txtWeightInGrams.Text) > 999999)
                {
                    lblError.Text = "Insert Gram between 1 to 999999";
                    txtWeightInGrams.Focus();
                    return;

                }

                int intWeight = Convert.ToInt32(txtWeightInGrams.Text.Trim());

                if (string.IsNullOrEmpty(txtMRP.Text.Trim()))
                {
                    lblError.Text = "Please Insert MRP!!";
                    txtMRP.Focus();
                    return;
                }

                if(regex.IsMatch(txtMRP.Text.Trim()))
                {
                    lblError.Text = "You are adding Letters which is not valid!";
                    txtMRP.Focus();
                    return;
                }

                if (Convert.ToDouble(txtMRP.Text) <= 0)
                {
                    lblError.Text = "MRP is not valid!!";
                    lblError.CssClass = "error-messege";
                    txtMRP.Focus();
                    return;

                }

                double dblMRP = Convert.ToDouble(txtMRP.Text.Trim());

                bool IsActive = false;

                if(chkIsActive.Checked == true)
                {
                    IsActive = true;
                }

                bool IsRecommended = false;
                bool IsInStock = false;

                int intResult = 0;
                intResult = DataHandler.AddPackages(intProductID, intWeight, dblMRP, IsRecommended, IsInStock, IsActive);
                
                if(intResult > 0 )
                {
                    lblError.Text = "New Package added successfully!";
                    lblError.CssClass = "success-messege";
                    ddlProductName.SelectedIndex = 0;
                    txtWeightInGrams.Text = string.Empty;
                    txtMRP.Text = string.Empty;
                    chkIsActive.Checked = false;
                    intProductID = 0;
                }
                else
                {
                    lblError.Text = "Package is not Added!";
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

        protected void lblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Home.aspx");
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}