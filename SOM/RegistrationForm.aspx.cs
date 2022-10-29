using SOM.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOM
{
    public partial class Registration_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["CustomerID"]) > 0)
                {
                    Response.Redirect(Convert.ToString(Session["URL"]));
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtFName.Text))
                {
                    lblError.Text = "First Name Required!";
                    txtFName.Focus();
                    return;
                }

                if (string.IsNullOrEmpty(txtLName.Text))
                {
                    lblError.Text = "Last Name Required!";
                    txtLName.Focus();
                    return;
                }

                if (string.IsNullOrEmpty(txtMobileNumber.Text))
                {
                    lblError.Text = "Mobile Number Required!";
                    txtMobileNumber.Focus();
                    return;
                }

                Regex regex = new Regex("^[a-zA-Z]+$");
                bool hasOnlyAlpha = regex.IsMatch(txtMobileNumber.Text);
                if (hasOnlyAlpha)
                {
                    lblError.Text = "You are adding Letters which is not valid!";
                    txtMobileNumber.Focus();
                    return;
                }

                if (txtMobileNumber.Text.Contains(" "))
                {
                    lblError.Text = "You are adding space which is not valid!";
                    txtMobileNumber.Focus();
                    return;
                }

                if (txtMobileNumber.Text.Length != 10)
                {
                    lblError.Text = "Mobile Number is not valid!";
                    txtMobileNumber.Focus();
                    return;
                }

                if (string.IsNullOrEmpty(txtAddress1.Text))
                {
                    lblError.Text = "Address Required!";
                    txtAddress1.Focus();
                    return;
                }



                if (string.IsNullOrEmpty(txtLivingArea.Text))
                {
                    lblError.Text = "Living Area Required!";
                    txtLivingArea.Focus();
                    return;
                }



                if (string.IsNullOrEmpty(txtCity.Text))
                {
                    lblError.Text = "City Required!";
                    txtCity.Focus();
                    return;
                }

                if (string.IsNullOrEmpty(txtPin.Text))
                {
                    lblError.Text = "Pin Required!";
                    txtPin.Focus();
                    return;
                }

                if (regex.IsMatch(txtPin.Text))
                {
                    lblError.Text = "You are adding Letters which is not valid!";
                    txtPin.Focus();
                    return;
                }

                if (ddlState.SelectedIndex == 0)
                {
                    lblError.Text = "Please select State!";
                    ddlState.Focus();
                    return;
                }

                DataTable dtFindMobileNumber = new DataTable();
                dtFindMobileNumber = DataViewer.isRegistered(txtMobileNumber.Text.Trim());
                if(dtFindMobileNumber.Rows.Count >0)
                {
                    lblError.Text = "Mobile Number is Already Exist Please Try with another Number!";
                    ddlState.Focus();
                    return;
                }


                int intResult = CustomerLogin.userRegistration(txtFName.Text.Trim(), txtLName.Text.Trim(), txtMobileNumber.Text.Trim(), txtAddress1.Text.Trim(), txtAddress2.Text.Trim(), txtLivingArea.Text.Trim(), txtCity.Text.Trim(), txtPin.Text.Trim(), Convert.ToString(ddlState.SelectedItem.Text));

                if (intResult > 0)
                {
                    lblError.Text = "Registration Successfull!";
                    SMS sms = new SMS();
                    
                    Session["CustomerID"] = intResult;
                    Session["Username"] = txtFName.Text.Trim() + " " + txtLName.Text.Trim();
                    Session["MobileNumber"] = txtMobileNumber.Text.Trim();
                    Session["Address1"] = txtAddress1.Text.Trim();
                    //Session["CustomerID"] = intResult;
                    sms.SendSMS(Convert.ToString(Session["MobileNumber"]), "Hi " + Convert.ToString(Session["Username"]) + ", Thank you for registering with Mahalaxmi Masala. Happy Shopping!!");
                    string strData = Convert.ToString(Session["CustomerID"]);
                    //Response.Redirect("~/Home.aspx", false);
                    //Context.ApplicationInstance.CompleteRequest();
                    FormsAuthentication.RedirectFromLoginPage(Convert.ToString(Session["Username"]), false);

                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    lblError.Text = "There is error in Registration!!";
                    return;
                }
            }
            //catch(ThreadAbortException)
            //{
            //    Response.Redirect("~/Home.aspx");

            //}
            catch (Exception ex)
            {
                
                lblError.Text = ex.ToString();
                return;
            }
            
        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}