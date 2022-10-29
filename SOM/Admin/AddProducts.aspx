<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="SOM.Admin.AddProducts" %>

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
                                <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="ImageButton" CausesValidation="false" OnClick="ImageButton_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="product-bottom" style="text-align:center">
                        <br><img src="../images/add-product-icon.png" class="AddProdctImage" ><br>
                        ADD PRODUCT
                    </div>
                </div>
            </div>
        </div>
        

        <div class="container ContainerMargin">
            <asp:Label ID="lblError" runat="server" CssClass = "error-messege" Text=""></asp:Label>
            <asp:LinkButton ID="lblHome" runat="server" CausesValidation="false" Visible="true" CssClass="navigation-link" Text="Home" OnClick="lblHome_Click"></asp:LinkButton>
            <div class="registration-middle">
                <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33 login100-form validate-form flex-sb flex-w">
                    <div class="form-left">
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox runat="server" ID="txtName" CssClass="input100" placeholder="Name" MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" runat="server" Display="Dynamic" CssClass="validation" ErrorMessage="Product Name is Required!"></asp:RequiredFieldValidator>
                            <span class="focus-input100"></span>
                        </div>
                    </div>

                    <div class="form-right">
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="select-box">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlCategory" Display="Dynamic" CssClass="validation" InitialValue="0" ErrorMessage="Please Select Category"></asp:RequiredFieldValidator>
                            <span class="focus-input100"></span>
                        </div>
                    </div>

                    <%--<div class="form-middle">
                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <asp:TextBox runat="server" ID="txtDescription" CssClass="input-text-area" placeholder="Details" MaxLength="200" />
                            <span class="focus-input100"></span>
                        </div>
                    </div>--%>

                    
                    <asp:FileUpload ID="FileUpload1" runat="server" />

                    <%--<div class="form-left">
                        <div class="check-left">
                            <asp:CheckBox Text="" ID="chkNewLaunch" runat="server" />
                        </div>
                        <div class="check-right">New Launch</div>
                    </div>
                    <div class="form-right">
                        <div class="check-left">
                            <asp:CheckBox Text="" ID="chkSpeciality" runat="server" />
                        </div>
                        <div class="check-right">Speciality</div>
                    </div>
                    <div class="form-left">
                        <div class="check-left">
                            <asp:CheckBox Text="" ID="chkPopular" runat="server" />
                        </div>
                        <div class="check-right">Most Popular</div>
                    </div>
                    <div class="form-right">
                        <div class="check-left">
                            <asp:CheckBox Text="" ID="chkInStock" runat="server" />
                        </div>
                        <div class="check-right">In Stock</div>
                    </div>--%>
                    <div class="form-left">
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
