<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="SOM.Registration_form" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/favicon.png" type="image/png" sizes="37x16">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>

    <link property="stylesheet" rel='stylesheet' href='css/style.css' type='text/css' media='all' />
    <!--    <link property="stylesheet" rel='stylesheet' href='css/main.css' type='text/css' media='all' /> -->
    <link property="stylesheet" rel='stylesheet' href='css/bootstrap.css' type='text/css' media='all' />
</head>

<body class="main-registration">
    <div class="regitration-title">
        <img src="images/icon-regi.png"><br>
        REGISTER
    </div>
    <div class="container">
        <div class="registration-middle">
            <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
                <form class="login100-form validate-form flex-sb flex-w" runat="server">
                    <asp:Label ID="lblError" Text="Note:- * Fields are mandatory!" runat="server" Style="font-size: 10px; color: #f00;" />
                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input100" ID="txtFName" MaxLength="25" runat="server" placeholder="Name*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFName" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="First Name is Required!"></asp:RequiredFieldValidator>

                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input100" ID="txtLName" MaxLength="25" runat="server" placeholder="Surname*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLName" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Last Name is Required!"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>
                    <script type="text/javascript">
                        function ValidNumeric() {

                            var charCode = (event.which) ? event.which : event.keyCode;
                            if (charCode >= 48 && charCode <= 57) { return true; }
                            else { return false; }
                        }
                    </script>
                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input100" ID="txtMobileNumber" runat="server" MaxLength="10" onkeypress="return ValidNumeric()" placeholder="Mobile No.*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtMobileNumber" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Mobile Number is Required!"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input-text-area" ID="txtAddress1" TextMode="MultiLine" MaxLength="50" runat="server" placeholder="Address 1*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAddress1" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Address is Required!"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input-text-area" ID="txtAddress2" TextMode="MultiLine" MaxLength="50" runat="server" placeholder="Address 2"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox runat="server" class="input100" ID="txtLivingArea" placeholder="Area*" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtLivingArea" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Area is Required!"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input100" ID="txtCity" runat="server" placeholder="City*" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtCity" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="City is Required!"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox class="input100" ID="txtPin" runat="server" MaxLength="10" onkeypress="return ValidNumeric()" placeholder="Pin Code*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtPin" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Pin Code is Required!"></asp:RequiredFieldValidator>

                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:DropDownList runat="server" ID="ddlState" class="select-box">
                            <asp:ListItem Value="0"> -- Select State -- </asp:ListItem>
                            <asp:ListItem Value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</asp:ListItem>
                            <asp:ListItem Value="Andhra Pradesh">Andhra Pradesh</asp:ListItem>
                            <asp:ListItem Value="Arunachal Pradesh">Arunachal Pradesh</asp:ListItem>
                            <asp:ListItem Value="Assam">Assam</asp:ListItem>
                            <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                            <asp:ListItem Value="Chandigarh">Chandigarh</asp:ListItem>
                            <asp:ListItem Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                            <asp:ListItem Value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</asp:ListItem>
                            <asp:ListItem Value="Daman and Diu">Daman and Diu</asp:ListItem>
                            <asp:ListItem Value="Delhi">Delhi</asp:ListItem>
                            <asp:ListItem Value="Goa">Goa</asp:ListItem>
                            <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                            <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                            <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                            <asp:ListItem Value="Jammu and Kashmir">Jammu and Kashmir</asp:ListItem>
                            <asp:ListItem Value="Jharkhand">Jharkhand</asp:ListItem>
                            <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                            <asp:ListItem Value="Kerala">Kerala</asp:ListItem>
                            <asp:ListItem Value="Lakshadweep">Lakshadweep</asp:ListItem>
                            <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                            <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                            <asp:ListItem Value="Manipur">Manipur</asp:ListItem>
                            <asp:ListItem Value="Meghalaya">Meghalaya</asp:ListItem>
                            <asp:ListItem Value="Mizoram">Mizoram</asp:ListItem>
                            <asp:ListItem Value="Nagaland">Nagaland</asp:ListItem>
                            <asp:ListItem Value="Orissa">Orissa</asp:ListItem>
                            <asp:ListItem Value="Pondicherry">Pondicherry</asp:ListItem>
                            <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                            <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                            <asp:ListItem Value="Sikkim">Sikkim</asp:ListItem>
                            <asp:ListItem Value="Tamil Nadu">Tamil Nadu</asp:ListItem>
                            <asp:ListItem Value="Tripura">Tripura</asp:ListItem>
                            <asp:ListItem Value="Uttaranchal">Uttaranchal</asp:ListItem>
                            <asp:ListItem Value="Uttar Pradesh">Uttar Pradesh</asp:ListItem>
                            <asp:ListItem Value="West Bengal">West Bengal</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlState" Display="Dynamic" CssClass="validation" InitialValue="0" ErrorMessage="Please Select State"></asp:RequiredFieldValidator>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="registration-button">
                        <div class="registration-button-left">
                            <div class="container-login100-form-btn m-t-17">
                                <div class="container-login100-form-btn m-t-17">
                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" class="login100-form-btn"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <div class="registration-button-right">
                            <div class="container-login100-form-btn m-t-17">
                                <div class="container-login100-form-btn m-t-17">
                                    <asp:Button ID="btnBackToLogin" runat="server" CausesValidation="false" OnClick="btnBackToLogin_Click" Text="Back To Login" class="login100-form-btn"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>
