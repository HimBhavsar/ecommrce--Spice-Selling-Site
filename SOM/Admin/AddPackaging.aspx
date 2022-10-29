<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPackaging.aspx.cs" Inherits="SOM.Admin.AddPackaging" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../images/favicon.png" type="image/png" sizes="37x16">
    <script src="../js/prefixfree.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>
    <link property="stylesheet" rel='stylesheet' href='../css/style.css' type='text/css' media='all' />
    <!--    <link property="stylesheet" rel='stylesheet' href='css/main.css' type='text/css' media='all' /> -->
    <link property="stylesheet" rel='stylesheet' href='../css/bootstrap.css' type='text/css' media='all' />
</head>
<body class="main-registration">
    <form runat="server">

        <div class="product-title-top" style="margin-bottom: 66px;">
            <div class="product-title">
                <div class="container">
                    <div class="product-left">
                        <div class="product-name">
                            <img src="../images/user-icon.png">Welcome, 
                            <%Response.Write(Convert.ToString(Session["Username"])); %>
                        </div>
                    </div>
                    <div class="product-right">
                        <div class="product-cart">
                            <div class="product-cart-right">
                                <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" CausesValidation="false" ID="ImageButton" OnClick="ImageButton_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="product-bottom" style="text-align:center">
                        <img src="../images/product-packaging-icon.png"><br>
                        PRODUCT PACKAGING
                    </div>
                </div>
            </div>
        </div>

        <div class="container ContainerMargin">
            <script type="text/javascript">
                function ValidNumeric() {

                    var charCode = (event.which) ? event.which : event.keyCode;
                    if (charCode >= 48 && charCode <= 57 || charCode == 46) { return true; }
                    else { return false; }
                }
            </script>
            <asp:Label ID="lblError" runat="server" CssClass="error-messege" Text=""></asp:Label>
            <asp:LinkButton ID="lblHome" runat="server" CausesValidation="false" Visible="true" CssClass="navigation-link" Text="Home" OnClick="lblHome_Click"></asp:LinkButton>
            <div class="registration-middle">
                <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33 login100-form validate-form flex-sb flex-w">
                    <div class="form-left">
                        <asp:DropDownList ID="ddlProductName" runat="server" CssClass="wrap-input100 validate-input select-box">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlProductName" Display="Dynamic" CssClass="validation" InitialValue="0" ErrorMessage="Please Select Product"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-right">
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox ID="txtWeightInGrams" runat="server" CssClass="input100" onkeypress="return ValidNumeric()" placeholder="Weight in Grams" MaxLength="6" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtWeightInGrams" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Product Weight is Required!"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtWeightInGrams" ErrorMessage="Please Insert Weight between 1 to 999999!" Display="Dynamic" CssClass="validation" MinimumValue="1" MaximumValue="999999"></asp:RangeValidator>
                            <span class="focus-input100"></span>
                        </div>
                    </div>
                    <div class="form-left">
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox ID="txtMRP" runat="server" CssClass="input100" onkeypress="return ValidNumeric()" placeholder="MRP Rs. 0.00" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMRP" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Product Price is Required!"></asp:RequiredFieldValidator>

                            <span class="focus-input100"></span>
                        </div>
                    </div>
                    <%--<div class="form-left">
                        <div class="check-left">
                            <input type="checkbox">
                        </div>
                        <div class="check-right">Most Recommended</div>
                    </div>
                    <div class="form-right">
                        <div class="check-left">
                            <input type="checkbox">
                        </div>
                        <div class="check-right">In Stock</div>
                    </div>--%>
                    <div class="form-right">
                        <div class="check-left">
                            <asp:CheckBox Text="" ID="chkIsActive" runat="server" />
                        </div>
                        <div class="check-right">Is Active</div>
                    </div>
                    <asp:Button Text="Submit" CssClass="login100-form-btn container-login100-form-btn m-t-17 registration-button" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
