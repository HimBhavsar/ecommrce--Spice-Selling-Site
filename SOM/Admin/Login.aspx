<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SOM.Admin.Login" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../images/favicon.png" type="image/png" sizes="37x16">
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
                            <asp:Label Text="&nbsp" id="lblError" runat="server" style="color: #fff;" ></asp:Label>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox runat="server" class="input1001" ID="txtUsername"  MaxLength="20" PlaceHolder="Username" Style="text-align: center; color: #FFF;"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="UserName is Required" ControlToValidate="txtUsername" runat="server" CssClass="validation" Display="Dynamic" Style="margin:0px; color: white;font-size: 13px;"/>
                        </div>
                        <br/>
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <asp:TextBox runat="server" class="input1001" ID="txtPassword"  MaxLength="20" TextMode="Password" PlaceHolder="Password" Style="text-align: center; color: #FFF;"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Password is Required!" ControlToValidate="txtPassword" runat="server" CssClass="validation" Display="Dynamic" Style="margin:0px; color: white;font-size: 13px;"/>
                        </div>
                        <div class="container-login100-form-btn m-t-17">
                            <asp:Button class="login100-form-btn-3" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Login"></asp:Button>
                        </div>

                        
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
