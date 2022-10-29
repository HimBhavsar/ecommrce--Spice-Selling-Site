using SOM.Admin.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM.Admin
{
    public partial class AddProducts : System.Web.UI.Page
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
                    Session["URL"] = "~/Admin/AddProducts.aspx";

                    DataTable dtCategory = new DataTable();
                    dtCategory = DataViewer.DdlProductCategory();
                    ddlCategory.DataSource = dtCategory;
                    ddlCategory.DataTextField = Convert.ToString(dtCategory.Columns["ProductCategory"]);
                    ddlCategory.DataValueField = Convert.ToString(dtCategory.Columns["ProductCategoryID"]);
                    ddlCategory.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Abandon();
                Response.Redirect("~/admin/Login.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }

        }

        protected void lblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Home.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(lblError.Text))
                {
                    lblError.Text = "";
                }
                if (string.IsNullOrEmpty(txtName.Text.Trim()))
                {
                    lblError.Text = "Name is Required!";
                    return;
                }

                if (txtName.Text == " " || txtName.Text == "  ")
                {
                    lblError.Text = "Invalid Product Name!";
                    return;
                }

                if (ddlCategory.SelectedIndex == 0)
                {
                    lblError.Text = "Please Select Product Category";
                    return;
                }

                string strName = txtName.Text.Trim();
                int intCategory = Convert.ToInt32(ddlCategory.SelectedValue);
                //string strDescription = txtDescription.Text.Trim();
                bool boolNewLaunch = false;
                bool boolSpeciality = true;
                bool boolPopular = true;
                bool boolInStock = true;
                bool boolIsActive = false;

                string strProductImagePath = string.Empty;


                if (FileUpload1.HasFile)
                {

                    string extension = Path.GetExtension(FileUpload1.FileName);
                    if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                    {
                        string savePath = Server.MapPath(@"\ProductImages");
                        //string fileName = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(savePath + "\\" + FileUpload1.FileName);
                        strProductImagePath = "ProductImages\\" + FileUpload1.FileName;
                    }
                    else
                    {
                        lblError.Text = "Only .jpg, .jpeg or .png Images are allowed";
                        lblError.CssClass = "error-messege";
                        return;
                    }
                }
                else
                {
                    strProductImagePath = "ProductImages/TemporaryImage.png";

                }


                //if (chkNewLaunch.Checked == true)
                //{
                //    boolNewLaunch = true;
                //}

                //if (chkSpeciality.Checked == true)
                //{
                //    boolSpeciality = true;
                //}

                //if (chkPopular.Checked == true)
                //{
                //    boolPopular = true;
                //}

                //if (chkInStock.Checked == true)
                //{
                //    boolInStock = true;
                //}

                if (chkIsActive.Checked == true)
                {
                    boolIsActive = true;
                }

                int intResult = DataHandler.AddProduct(strName, intCategory, strProductImagePath, boolNewLaunch, boolSpeciality, boolPopular, boolInStock, boolIsActive);
                if(intResult>0)
                {
                    lblError.Text = "Product Added Successfully";
                    lblError.CssClass = "success-messege";
                    txtName.Text = string.Empty;
                    ddlCategory.SelectedIndex = 0;
                    //txtDescription.Text = string.Empty;
                    //chkInStock.Checked = false;
                    chkIsActive.Checked = false;
                    //chkNewLaunch.Checked = false;
                    //chkPopular.Checked = false;
                    //chkSpeciality.Checked = false;

                }
                else
                {
                    lblError.Text = "Product Is not Inserted!!";
                    return;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}