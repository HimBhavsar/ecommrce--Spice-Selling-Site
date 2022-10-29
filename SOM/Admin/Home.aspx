<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SOM.Admin.Home" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../images/favicon.png" type="image/png" sizes="37x16">
    <script src="../js/prefixfree.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


    <link rel="stylesheet" href="../css/style1.css">


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
                            <img src="../images/user-icon.png">
                            Welcome, 
                            <%Response.Write(Convert.ToString(Session["Username"])); %>
                        </div>
                    </div>
                    <div class="product-right">
                        <div class="product-cart">
                            <div class="product-cart-right">
                                <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="imgLogout" OnClick="imgLogout_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-main">
            <div class="container">
                <div class="">
                    <div class="home-left">
                        <div class="home">
                            <a href="CustomersData.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Registered Users</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/home-user-icon.png">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="home-right">
                        <div class="home">
                            <a href="ViewOrders.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Customers Orders</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/my-order.png">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="home-left">
                        <div class="home">
                            <a href="AddProducts.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Add Product</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/new-order.png">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="home-right">
                        <div class="home">
                            <a href="ViewProducts.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Products List</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/product-list-icon.png">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="home-left">
                        <div class="home">
                            <a href="AddPackaging.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Add Packaging</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/Home-add-product-Packaging-icon.png">
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="home-right">
                        <div class="home">
                            <a href="ViewProductPackaging.aspx" style="text-decoration: none; color: #000;">
                                <div class="home-text">Product Packagings</div>
                                <div class="home-circal">
                                    <img class="zoom" src="../images/HomeProductpackagingIcon.png">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <%--<div id="modal2" runat="server" class="modal modal__bg" role="dialog" aria-hidden="true">
        <div class="modal__dialog">
            <div class="modal__content">
                <p>&nbsp;</p>
                <div class="modal-content1">
                    <p id="pTag" runat="server">If you Logout your all cart Items will be removed! Are you sure do you want to Logout?</p>
                    <div class="registration-button">
                        <div class="registration-button-left">


                            <asp:Button Text="Yes" ID="btnYes" OnClick="btnYes_Click" CssClass="container-login100-form-btn m-t-17 login100-form-btn" runat="server" />


                        </div>

                        <div class="registration-button-right">

                            <asp:Button Text="No" ID="btnNo" OnClick="btnNo_Click" CssClass="container-login100-form-btn m-t-17 login100-form-btn" runat="server" />


                        </div>
                    </div>
                </div>


                <!-- modal close button -->
                <a href="" class="modal__close demo-close">
                    <svg class="" viewBox="0 0 24 24">
                        <path d="M19 6.41l-1.41-1.41-5.59 5.59-5.59-5.59-1.41 1.41 5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59z" />
                        <path d="M0 0h24v24h-24z" fill="none" />
                    </svg>
                </a>

            </div>
        </div>
    </div>



    <script src="js/index.js"></script>--%>
        <script>var x, i, j, l, ll, selElmnt, a, b, c;
            /* Look for any elements with the class "custom-select": */
            x = document.getElementsByClassName("custom-select");
            l = x.length;
            for (i = 0; i < l; i++) {
                selElmnt = x[i].getElementsByTagName("select")[0];
                ll = selElmnt.length;
                /* For each element, create a new DIV that will act as the selected item: */
                a = document.createElement("DIV");
                a.setAttribute("class", "select-selected");
                a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                x[i].appendChild(a);
                /* For each element, create a new DIV that will contain the option list: */
                b = document.createElement("DIV");
                b.setAttribute("class", "select-items select-hide");
                for (j = 1; j < ll; j++) {
                    /* For each option in the original select element,
                    create a new DIV that will act as an option item: */
                    c = document.createElement("DIV");
                    c.innerHTML = selElmnt.options[j].innerHTML;
                    c.addEventListener("click", function (e) {
                        /* When an item is clicked, update the original select box,
                        and the selected item: */
                        var y, i, k, s, h, sl, yl;
                        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                        sl = s.length;
                        h = this.parentNode.previousSibling;
                        for (i = 0; i < sl; i++) {
                            if (s.options[i].innerHTML == this.innerHTML) {
                                s.selectedIndex = i;
                                h.innerHTML = this.innerHTML;
                                y = this.parentNode.getElementsByClassName("same-as-selected");
                                yl = y.length;
                                for (k = 0; k < yl; k++) {
                                    y[k].removeAttribute("class");
                                }
                                this.setAttribute("class", "same-as-selected");
                                break;
                            }
                        }
                        h.click();
                    });
                    b.appendChild(c);
                }
                x[i].appendChild(b);
                a.addEventListener("click", function (e) {
                    /* When the select box is clicked, close any other select boxes,
                    and open/close the current select box: */
                    e.stopPropagation();
                    closeAllSelect(this);
                    this.nextSibling.classList.toggle("select-hide");
                    this.classList.toggle("select-arrow-active");
                });
            }

            function closeAllSelect(elmnt) {
                /* A function that will close all select boxes in the document,
                except the current select box: */
                var x, y, i, xl, yl, arrNo = [];
                x = document.getElementsByClassName("select-items");
                y = document.getElementsByClassName("select-selected");
                xl = x.length;
                yl = y.length;
                for (i = 0; i < yl; i++) {
                    if (elmnt == y[i]) {
                        arrNo.push(i)
                    } else {
                        y[i].classList.remove("select-arrow-active");
                    }
                }
                for (i = 0; i < xl; i++) {
                    if (arrNo.indexOf(i)) {
                        x[i].classList.add("select-hide");
                    }
                }
            }

            /* If the user clicks anywhere outside the select box,
            then close all select boxes: */
            document.addEventListener("click", closeAllSelect);</script>
    </form>

</body>
</html>
