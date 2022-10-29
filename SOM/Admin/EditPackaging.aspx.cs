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
    public partial class EditPackaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
                Session["URL"] = "~/Admin/EditPackaging.aspx";

                //Session["ProductPackagingID"]

                DataTable dtPackageDetails = DataViewer.viewSpecificPackaging(Convert.ToInt32(Session["ProductPackagingID"]));
                txtMRP.Text = Convert.ToString(dtPackageDetails.Rows[0]["MRP"]);
                txtWeightInGrams.Text = Convert.ToString(dtPackageDetails.Rows[0]["WeightInGrams"]);
                chkIsActive.Checked = Convert.ToBoolean(dtPackageDetails.Rows[0]["IsActive"]);

                DataTable dtProduct = new DataTable();
                dtProduct = DataViewer.DdlProduct();
                ddlProductName.DataSource = dtProduct;
                ddlProductName.DataTextField = Convert.ToString(dtProduct.Columns["ProductName"]);
                ddlProductName.DataValueField = Convert.ToString(dtProduct.Columns["ProductID"]);
                ddlProductName.DataBind();
                ddlProductName.Items.FindByValue(Convert.ToString(dtPackageDetails.Rows[0]["ProductID"])).Selected = true;


            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int intProductID = 0;
                if (ddlProductName.SelectedIndex == 0)
                {
                    lblError.Text = "Please Insert Weight!!";
                    txtWeightInGrams.Focus();
                    return;
                }
                else
                {
                    intProductID = Convert.ToInt32(ddlProductName.SelectedItem.Value);
                }

                if (string.IsNullOrEmpty(txtWeightInGrams.Text.Trim()))
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

                if (Convert.ToInt32(txtWeightInGrams.Text) == 0 && Convert.ToInt32(txtWeightInGrams.Text) > 999999)
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

                if (regex.IsMatch(txtMRP.Text.Trim()))
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

                if (chkIsActive.Checked == true)
                {
                    IsActive = true;
                }

                bool IsRecommended = false;
                bool IsInStock = false;

                int intResult = 0;
                intResult = DataHandler.UpdatePackages(intProductID, intWeight, dblMRP, IsRecommended, IsInStock, IsActive,Convert.ToInt32(Session["ProductPackagingID"]));

                if (intResult > 0)
                {
                    lblError.Text = "Package Updated successfully!";
                    lblError.CssClass = "success-messege";
                    ddlProductName.SelectedIndex = 0;
                    txtWeightInGrams.Text = string.Empty;
                    txtMRP.Text = string.Empty;
                    chkIsActive.Checked = false;
                    intProductID = 0;
                }
                else
                {
                    lblError.Text = "Package is not Updated!";
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

        protected void lnkViewPackagings_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ViewProductPackaging.aspx");
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}