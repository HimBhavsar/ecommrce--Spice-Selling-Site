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
    public partial class ViewProducts : System.Web.UI.Page
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
                Session["URL"] = "~/Admin/ViewProducts.aspx";

                DataTable dtProducts = new DataTable();

                dtProducts = DataViewer.ViewProduts();
                dtProducts.Columns.Add(new DataColumn("SrNo"));

                for (int count = 0; count < dtProducts.Rows.Count; count++)
                {
                    dtProducts.Rows[count]["SrNo"] = count + 1;
                }


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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dtSearchValues = new DataTable();
                dtSearchValues = DataViewer.FilterProduts(txtSearch.Text.Trim());
                dtSearchValues.Columns.Add(new DataColumn("SrNo"));

                for (int count = 0; count < dtSearchValues.Rows.Count; count++)
                {
                    dtSearchValues.Rows[count]["SrNo"] = count + 1;
                }
                dgvProducts.DataSource = dtSearchValues;
                dgvProducts.DataBind();

            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }


        protected void dgvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dgvProducts.PageIndex = e.NewPageIndex;
                dgvProducts.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void dgvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                foreach (TableCell tc in e.Row.Cells)
                {
                    tc.BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void lnkProductName_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = sender as LinkButton;
                int view = Convert.ToInt32(btn.CommandArgument);
                Session["ProductID"] = view;
                Response.Redirect("~/Admin/EditProduct.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Admin/Home.aspx");
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void imgLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}