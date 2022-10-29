<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SOM.Login" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/favicon.png" type="image/png" sizes="37x16">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans" rel="stylesheet">
    <link property="stylesheet" rel='stylesheet' href='../css/style.css' type='text/css' media='all' />
    
    <link property="stylesheet" rel='stylesheet' href='../css/bootstrap.css' type='text/css' media='all' />
</head>

<body style="background-color: #ed3237;">
    <form runat="server" class="login100-form validate-form flex-sb flex-w">


        <div class="main-login">
            <div class="login-bg-top">
                <div class="container">
                    <img src="../images/login-img.png">
                </div>
            </div>

            <div class="login-bg-bottom">
                <div class="container">
                    <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
                        <div class="p-t-32 p-b-9">
                            <asp:Label Text="&nbsp" ID="lblError" runat="server" Style="color: #fff;"></asp:Label>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox runat="server" class="input1001" ID="txtMobileNumber" onkeypress="return ValidNumeric()" MaxLength="10" PlaceHolder="Mobile No." Style="text-align: center; color: #FFF;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMobileNumber" Display="Dynamic" runat="server" CssClass="validation" Style="margin:0px;color: white;" ErrorMessage="Please Enter Mobile Number!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtMobileNumber" Display="Dynamic" runat="server" CssClass="validation" Style="margin:0px; color: white;" ErrorMessage="Please Enter Valid Mobile Number" ValidationExpression="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$"></asp:RegularExpressionValidator>
                            <span class="focus-input100"></span>
                        </div>
                        <script type="text/javascript">
                            function ValidNumeric() {

                                var charCode = (event.which) ? event.which : event.keyCode;
                                if (charCode >= 48 && charCode <= 57) { return true; }
                                else { return false; }
                            }
                        </script>
                        <div class="container-login100-form-btn m-t-17">
                            <asp:Button class="login100-form-btn-3" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Login"></asp:Button>
                        </div>
                        <div class="w-full text-center p-b-9 m-t-17 margin-top" style="border-top: 1px solid #ffffff30; color: #fff;">
                            New Customer?<br>
                            <a href="RegistrationForm.aspx" class="txt2 bo1">Register with Us
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
