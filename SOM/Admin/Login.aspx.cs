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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["AdminUserID"]) > 0)
                {
                    Response.Redirect(Convert.ToString(Session["URL"]));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtUsername.Text))
                {
                    lblError.Text = "UserName Required!";
                    txtUsername.Focus();
                    txtUsername.CssClass = "warning";
                    return;
                }

                if (txtUsername.Text.Contains(" "))
                {
                    lblError.Text = "You are adding space which is not valid for UserName!";
                    txtUsername.Focus();
                    txtUsername.CssClass = "warning";
                    return;
                }

                if (txtUsername.Text.Length > 20)
                {
                    lblError.Text = "Username not valid!";
                    txtUsername.Focus();
                    txtUsername.CssClass = "warning";
                    return;
                }

                if (string.IsNullOrEmpty(txtPassword.Text))
                {
                    lblError.Text = "Password Required!";
                    txtPassword.Focus();
                    txtPassword.CssClass = "warning";
                    return;
                }

                if (txtPassword.Text.Contains(" "))
                {
                    lblError.Text = "You are adding space which is not valid for Password!";
                    txtPassword.Focus();
                    txtPassword.CssClass = "warning";
                    return;
                }

                if (txtUsername.Text.Trim() == "ISMAdmin" && txtPassword.Text.Trim() == "ISMAdmin")
                {
                    Session["AdminUserID"] = "1";
                    Session["Username"] = "ISMAdmin";

                    Response.Redirect("~/Admin/Home.aspx");
                }
                else
                {
                    lblError.Text = "Your are entering Wrong Username or Password!";
                    return;
                }
                //DataTable dtLogin = new DataTable();
                //dtLogin = AdminLogin.login(txtUsername.Text.Trim(),txtPassword.Text.Trim());
                //if(dtLogin.Rows.Count == 0 || dtLogin== null )
                //{
                //    lblError.Text = "Wrong Username or Password!";
                //    return;
                //}
                //if (txtUsername.Text.Trim() == Convert.ToString(dtLogin.Rows[0]["UserName"]) && txtPassword.Text.Trim() == Convert.ToString(dtLogin.Rows[0]["Password"]))
                //{
                //    Session["AdminUserID"] = dtLogin.Rows[0]["AdminUserID"].ToString();
                //    Session["Username"] = dtLogin.Rows[0]["UserName"].ToString();
                    
                //    Response.Redirect("~/Admin/ViewOrders.aspx");
                //}
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
        }
    }
}