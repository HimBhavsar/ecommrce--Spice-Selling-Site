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
    public partial class ViewProductPackaging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    Session["URL"] = "~/Admin/ViewProductPackaging.aspx";
                    DataTable dtProductPackaging = new DataTable();
                    dtProductPackaging = DataViewer.ViewProdutPackaging();
                    dtProductPackaging.Columns.Add(new DataColumn("SrNo"));
                    dtProductPackaging.Columns.Add(new DataColumn("Weight"));

                    for (int count = 0; count < dtProductPackaging.Rows.Count; count++)
                    {
                        dtProductPackaging.Rows[count]["SrNo"] = count + 1;
                        if (Convert.ToInt32(dtProductPackaging.Rows[count]["WeightInGrams"]) >= 1000)
                        {
                            dtProductPackaging.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtProductPackaging.Rows[count]["WeightInGrams"]) / 1000) + " kg.";
                        }
                        else
                        {
                            dtProductPackaging.Rows[count]["Weight"] = Convert.ToString(dtProductPackaging.Rows[count]["WeightInGrams"]) + " g.";
                        }
                    }

                    dgvProductPackagings.DataSource = dtProductPackaging;
                    dgvProductPackagings.DataBind();

                    DataTable dtWeight = new DataTable();
                    dtWeight.Columns.Add(new DataColumn("WeightInGrams"));
                    dtWeight.Columns.Add(new DataColumn("Weight"));
                    DataRow drNewHeader = dtWeight.NewRow();
                    drNewHeader["WeightInGrams"] = "--- Select Packaging ---";
                    dtWeight.Rows.InsertAt(drNewHeader, 0);
                    //dtWeight = DataViewer.ddlWeightList();
                    //dtWeight.Merge(dtWeightList);
                    DataTable dtWeightList = new DataTable();
                    dtWeightList = DataViewer.ddlWeightList();
                    dtWeight.Merge(dtWeightList, true, MissingSchemaAction.Ignore);
                    for (int count = 0; count < dtWeight.Rows.Count; count++)
                    {
                        if (count == 0)
                        {
                            dtWeight.Rows[count]["Weight"] = dtWeight.Rows[count]["WeightInGrams"];
                            continue;
                        }
                        if (Convert.ToInt32(dtWeight.Rows[count]["WeightInGrams"]) >= 1000)
                        {
                            dtWeight.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtWeight.Rows[count]["WeightInGrams"]) / 1000) + " kg.";
                        }
                        else 
                        {
                            dtWeight.Rows[count]["Weight"] = dtWeight.Rows[count]["WeightInGrams"] + " g.";
                        }
                    }
                    ddlFilterWeight.DataSource = dtWeight;
                    ddlFilterWeight.DataTextField = Convert.ToString(dtWeight.Columns["Weight"]);
                    ddlFilterWeight.DataValueField = Convert.ToString(dtWeight.Columns["WeightInGrams"]);
                    ddlFilterWeight.DataBind();
                }
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
                DataTable dtFilterPackaging = new DataTable();
                string strWeight = string.Empty;
                string strText = string.Empty;
                if (!string.IsNullOrEmpty(txtSearch.Text))
                    strText = txtSearch.Text.Trim();
                if (ddlFilterWeight.SelectedIndex != 0)
                    dtFilterPackaging = DataViewer.FilterProdutPackaging(strText, Convert.ToInt32(ddlFilterWeight.SelectedItem.Value));
                else
                    dtFilterPackaging = DataViewer.FilterProdutPackaging(strText);
                
                dtFilterPackaging.Columns.Add(new DataColumn("SrNo"));
                dtFilterPackaging.Columns.Add(new DataColumn("Weight"));
                for (int count = 0; count < dtFilterPackaging.Rows.Count; count++)
                {
                    dtFilterPackaging.Rows[count]["SrNo"] = count + 1;
                    if (Convert.ToInt32(dtFilterPackaging.Rows[count]["WeightInGrams"]) >= 1000)
                    {
                        dtFilterPackaging.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtFilterPackaging.Rows[count]["WeightInGrams"]) / 1000) + " kg.";
                    }
                    else
                    {
                        dtFilterPackaging.Rows[count]["Weight"] = Convert.ToString(dtFilterPackaging.Rows[count]["WeightInGrams"]) + " g.";
                    }
                }

                DataTable dtWeight = new DataTable();
                dtWeight.Columns.Add(new DataColumn("WeightInGrams"));
                dtWeight.Columns.Add(new DataColumn("Weight"));
                DataRow drNewHeader = dtWeight.NewRow();
                drNewHeader["WeightInGrams"] = "--- Select Packaging --- ";
                dtWeight.Rows.InsertAt(drNewHeader, 0);
                List<int> lstWeight = new List<int>();
                for (int count = 0; count < dtFilterPackaging.Rows.Count; count++)
                {
                    int intVal = Convert.ToInt32(Convert.ToString(dtFilterPackaging.Rows[count]["WeightInGrams"]));
                    if(count == 0)
                    {
                        lstWeight.Add(intVal);
                        continue;
                    }
                    if (!lstWeight.Contains(intVal))
                    {
                        lstWeight.Add(intVal);
                    }   
                }
                lstWeight.Sort();

                for (int count = 0; count < lstWeight.Count; count++)
                {
                    DataRow drNewRow = dtWeight.NewRow();
                    drNewRow["WeightInGrams"] = lstWeight[count];
                    dtWeight.Rows.Add(drNewRow);
                }


                for (int counter = 0; counter < dtWeight.Rows.Count; counter++)
                {
                    if(counter == 0)
                    {
                        dtWeight.Rows[counter]["Weight"] = dtWeight.Rows[counter]["WeightInGrams"];
                        continue;
                    }
                    if (Convert.ToInt32(dtWeight.Rows[counter]["WeightInGrams"]) >= 1000)
                    {
                        dtWeight.Rows[counter]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtWeight.Rows[counter]["WeightInGrams"]) / 1000) + " kg.";
                    }
                    else
                    {
                        dtWeight.Rows[counter]["Weight"] = Convert.ToString(dtWeight.Rows[counter]["WeightInGrams"]) + " g.";
                    }
                }

                ddlFilterWeight.DataSource = dtWeight;
                ddlFilterWeight.DataTextField = Convert.ToString(dtWeight.Columns["Weight"]);
                ddlFilterWeight.DataValueField = Convert.ToString(dtWeight.Columns["WeightInGrams"]);
                ddlFilterWeight.DataBind();

                dgvProductPackagings.DataSource = dtFilterPackaging;
                dgvProductPackagings.DataBind();
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
            Response.Redirect("~/Admin/Home.aspx");
        }

        protected void dgvProductPackagings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dgvProductPackagings.PageIndex = e.NewPageIndex;
                DataTable dtProductPackaging = new DataTable();
                dtProductPackaging = DataViewer.ViewProdutPackaging();
                dtProductPackaging.Columns.Add(new DataColumn("SrNo"));
                dtProductPackaging.Columns.Add(new DataColumn("Weight"));

                for (int count = 0; count < dtProductPackaging.Rows.Count; count++)
                {
                    dtProductPackaging.Rows[count]["SrNo"] = count + 1;
                    if (Convert.ToInt32(dtProductPackaging.Rows[count]["WeightInGrams"]) >= 1000)
                    {
                        dtProductPackaging.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtProductPackaging.Rows[count]["WeightInGrams"]) / 1000) + " kg.";
                    }
                    else
                    {
                        dtProductPackaging.Rows[count]["Weight"] = Convert.ToString(dtProductPackaging.Rows[count]["WeightInGrams"]) + " g.";
                    }
                }

                dgvProductPackagings.DataSource = dtProductPackaging;
                dgvProductPackagings.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void dgvProductPackagings_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = sender as LinkButton;
                int view = Convert.ToInt32(btn.CommandArgument);
                Session["ProductPackagingID"] = view;
                Response.Redirect("~/Admin/EditPackaging.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
                return;
            }
        }

        protected void ddlFilterWeight_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string strText = "";
                
                if (!string.IsNullOrEmpty(txtSearch.Text))
                    strText = txtSearch.Text.Trim();
                DataTable dtFilterPackaging = new DataTable();
                if (ddlFilterWeight.SelectedIndex != 0)
                    dtFilterPackaging = DataViewer.FilterProdutPackaging(strText, Convert.ToInt32(ddlFilterWeight.SelectedItem.Value));
                else
                    dtFilterPackaging = DataViewer.FilterProdutPackaging(strText);


                dtFilterPackaging.Columns.Add(new DataColumn("SrNo"));
                dtFilterPackaging.Columns.Add(new DataColumn("Weight"));
                for (int count = 0; count < dtFilterPackaging.Rows.Count; count++)
                {
                    dtFilterPackaging.Rows[count]["SrNo"] = count + 1;
                    if (Convert.ToInt32(dtFilterPackaging.Rows[count]["WeightInGrams"]) >= 1000)
                    {
                        dtFilterPackaging.Rows[count]["Weight"] = Convert.ToDouble(Convert.ToInt32(dtFilterPackaging.Rows[count]["WeightInGrams"]) / 1000) + " kg.";
                    }
                    else
                    {
                        dtFilterPackaging.Rows[count]["Weight"] = Convert.ToString(dtFilterPackaging.Rows[count]["WeightInGrams"]) + " g.";
                    }
                }

                dgvProductPackagings.DataSource = dtFilterPackaging;
                dgvProductPackagings.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                lblError.CssClass = "error-messege";
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