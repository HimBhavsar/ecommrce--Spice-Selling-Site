using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if(Convert.ToInt32(Session["CustomerID"]) > 0)
                {
                    Response.Redirect(Convert.ToString(Session["URL"]));
                }

                
            }
        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strMobileNumber = txtMobileNumber.Text;
                if (string.IsNullOrEmpty(txtMobileNumber.Text))
                {
                    lblError.Text = "You can't Login without Mobile Number!";
                    txtMobileNumber.Focus();
                    txtMobileNumber.CssClass = "warning";
                    return;
                }

                Regex regex = new Regex("^[a-zA-Z]+$");
                bool hasOnlyAlpha = regex.IsMatch(txtMobileNumber.Text);
                if(hasOnlyAlpha)
                {
                    lblError.Text = "You are adding Letters which is not valid!";
                    txtMobileNumber.Focus();
                    txtMobileNumber.CssClass = "warning";
                    return;
                }

                if(txtMobileNumber.Text.Contains(" "))
                {
                    lblError.Text = "You are adding space which is not valid!";
                    txtMobileNumber.Focus();
                    txtMobileNumber.CssClass = "warning";
                    return;
                }

                if (txtMobileNumber.Text.Length != 10)
                {
                    lblError.Text = "Mobile Number is not valid!";
                    txtMobileNumber.Focus();
                    txtMobileNumber.CssClass = "warning";
                    return;
                }

                

                DataTable dtLogin = new DataTable();
                dtLogin = CustomerLogin.login(strMobileNumber);
                if(dtLogin==null || dtLogin.Rows.Count == 0)
                {
                    lblError.Text = "Your mobile number is not registered with us please Register!";
                    //linkRegister.Focus();
                    return;
                }
                if(strMobileNumber == Convert.ToString(dtLogin.Rows[0]["MobileNumber"]))
                {
                    Session["CustomerID"] = dtLogin.Rows[0]["CustomerID"].ToString();
                    Session["Username"] = dtLogin.Rows[0]["FirstName"].ToString() + " " + dtLogin.Rows[0]["LastName"].ToString();
                    Session["MobileNumber"] = dtLogin.Rows[0]["MobileNumber"].ToString();
                    Session["Address1"] = dtLogin.Rows[0]["Address1"].ToString();

                    FormsAuthentication.RedirectFromLoginPage(Convert.ToString(Session["Username"]), false);
                    Response.Redirect("~/Home.aspx");
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
                return;
            }
            
        }

       
    }
}