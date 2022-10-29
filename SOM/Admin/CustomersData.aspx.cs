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
    public partial class CustomersData : System.Web.UI.Page
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
                Session["URL"] = "~/Admin/CustomersData.aspx";

                DataTable dtCustomers = new DataTable();

                dtCustomers = DataViewer.ViewCustomers();
                dtCustomers.Columns.Add(new DataColumn("SrNo"));

                for (int count = 0; count < dtCustomers.Rows.Count; count++)
                {
                    dtCustomers.Rows[count]["SrNo"] = count + 1;
                }


                dgvCustomers.DataSource = dtCustomers;
                dgvCustomers.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }


        protected void lnkGoOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/Home.aspx");
        }

        protected void dgvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
            }
        }

        protected void dgvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvCustomers.PageIndex = e.NewPageIndex;
            dgvCustomers.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            
            try
            {
                DataTable dtFilterCustomer = new DataTable();
                dtFilterCustomer = DataViewer.FilterCustomers(txtSearch.Text.Trim());
                dtFilterCustomer.Columns.Add(new DataColumn("SrNo"));
                for (int count = 0; count < dtFilterCustomer.Rows.Count; count++)
                {
                    dtFilterCustomer.Rows[count]["SrNo"] = count + 1;
                }
                dgvCustomers.DataSource = dtFilterCustomer;
                dgvCustomers.DataBind();
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