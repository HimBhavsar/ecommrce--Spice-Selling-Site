<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SOM.DataListView" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/favicon.png" type="image/png" sizes="37x16">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>
    <link property="stylesheet" rel='stylesheet' href='css/style.css' type='text/css' media='all' />
    <link property="stylesheet" rel='stylesheet' href='css/bootstrap.css' type='text/css' media='all' />
    <script src="js/index.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <link href="css/style1.css" rel="stylesheet" />
    <script src="js/prefixfree.min.js"></script>
</head>
    <script type="text/javascript">
        function CheckSession() {
            var session = '<%=Session["dtCartData"] != null%>';
             if (session == false) {
                 
                 window.location = "login.aspx";
             }
         }

    </script>
<body class="main-registration">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="product-title-top">
            <div class="product-title">
                <div class="container">
                    <div class="product-left">
                        <div class="product-name">
                            <img src="images/user-icon.png">
                            <%Response.Write(Convert.ToString(Session["Username"])); %>
                        </div>
                        <div class="product-mobile">
                            <img src="images/phone-icon.png">
                            <%Response.Write(Convert.ToString(Session["MobileNumber"])); %>
                        </div>
                    </div>
                    <div class="product-right">
                        <div class="product-cart">
                            <div class="product-cart-left ">
                                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
                                    <ContentTemplate>
                                        <%--<a href="View-Cart.aspx">--%>

                                        <asp:ImageButton runat="server" ID="imgCartIcon" ImageUrl="images/cart-icon.png" Style="margin-right: 20px;" OnClick="ImgCartIcon_Click" />
                                        <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="imgLogout" OnClick="ImgLogout_Click" />
                                        <br>
                                        <asp:Label ID="lblItemsCount" Style="color: #fff; margin-right: 35px;" Text="0 Items" runat="server" /><%--</a>--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <%--<div class="product-cart-right">
                                <%--<asp:ImageButton runat="server" CausesValidation="false" CssClass="container-login100-form-btn m-t-17 login100-form-btn-2" ID="btnLogout" OnClick="btnLogout_Click" Style="color: #fff; display: initial;" Text="Logout" />
                            </div>--%>
                        </div>

                    </div>

                    <%--<div class="search-main">--%>

                    <asp:TextBox class="search-main" CssClass="input-search input" ID="txtSearch" OnTextChanged="TxtSearch_TextChanged" runat="server" placeholder="Search..." AutoPostBack="true"></asp:TextBox>

                    <%--</div>--%>
                </div>


            </div>
        </div>
        <div class="product-main" style="padding-top: 34px;">
            <div class="container" style="padding: 0px;">
                <asp:UpdatePanel runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="lblError" runat="server" CssClass="error-messege" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:LinkButton ID="lblHome" runat="server" Style="margin-left: 15px;" CssClass="navigation-link" Text="Home" OnClick="LblHome_Click"></asp:LinkButton>
                <asp:Label Text="Products" CssClass="title-top" Style="text-align: center" runat="server" />
                <asp:DataList ID="dgvProducts" runat="server" OnItemDataBound="DgvProducts_ItemDataBound" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="table-products">
                    <ItemTemplate>
                        <asp:UpdatePanel ChildrenAsTriggers="true" ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="product-middle">
                                    <div class="registration-middle">

                                        <div class="product-middle-main">
                                            <div class="product-middle-img">
                                                <asp:Label ID="lblPID" Visible="false" Text='<%#Eval("ProductID") %>' runat="server" />
                                                <img id="imgItem" src='<%#Eval("ProductImagePath") %>' style="border-radius: 15px; width: 100%">
                                                <asp:Label ID="lblPName" CssClass="product-title-main" Text='<%#Eval("ProductName") %>' runat="server" />
                                            </div>
                                            <div class="product-middle-select">
                                                <asp:DropDownList AutoPostBack="true" CssClass="custom-select" runat="server" ID="ddlPackaging" OnSelectedIndexChanged="DdlPackaging_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <div class="number">
                                                    <asp:Button Text="-" CssClass="number-left" runat="server" ID="btnRemoveProduct" CommandName="RemoveItem" CommandArgument='<%#Eval("ProductID") %>' OnClick="BtnRemoveProduct_Click" />

                                                    <asp:Label CssClass="number-middle" ID="lblQtyAndRate" runat="server" Text="0 / Rs. 0.00"></asp:Label>

                                                    <asp:Button Text="+" CssClass="number-right" runat="server" ID="btnAddProduct" CommandName="AddItem" CommandArgument='<%#Eval("ProductID") %>' OnClick="BtnAddProduct_Click" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddProduct" EventName="Click" />
                            </Triggers>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnRemoveProduct" EventName="Click" />
                            </Triggers>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlPackaging" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div class="place-main">
            <div class="container">
                <div class="place-left">
                    <%--<div class="place-left">
                        Rs. 1200.00<br>
                        <a href="" data-modal="#modal2" class="modal__trigger" style="color: #fd7d03;">View Detail</a>
                    </div>--%>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:Label Text="" ID="lblTotalAmount" runat="server" /><br />
                            <asp:Label Text="Minimum Order Value is Rs. 600.00" Style="font-size: 8px; color: #ed3237;" ID="Label1" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <a href="View-Cart.aspx" runat="server" visible="false" style="color: #fd7d03;">View Cart</a>
                </div>
                <div class="place-right">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:Button ID="btnPlaceOrder"  runat="server" Text="Confirm Order" OnClick="BtnPlaceOrder_Click" class="login100-form-btn container-login100-form-btn "></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

       


        

        <asp:UpdatePanel runat="server" UpdateMode="Always">
            <ContentTemplate>
                 <div id="modal1" class="modal modal__bg" role="dialog" aria-hidden="true">
            <div class="modal__dialog">
                <div class="modal__content">
                    <p>&nbsp;</p>
                    <div class="modal-content1">
                        <asp:Label Text="" CssClass="text-red" ID="lblErrorMsg" runat="server" />
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

        <div id="modal" class="modal modal__bg" role="dialog" aria-hidden="true">
            <div class="modal__dialog">
                <div class="modal__content">
                    <p>&nbsp;</p>
                    <div class="modal-content1">
                        <p class="text-green">Order Placed successfully</p>
                    </div>


                    <!-- modal close button -->
                    <a href=""  class="modal__close demo-close">
                        <svg class="" viewBox="0 0 24 24">
                            <path d="M19 6.41l-1.41-1.41-5.59 5.59-5.59-5.59-1.41 1.41 5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59z" />
                            <path d="M0 0h24v24h-24z" fill="none" />
                        </svg>
                    </a>

                </div>
            </div>
        </div>

                <div id="modal2" runat="server" class="modal modal__bg" role="dialog" aria-hidden="true">
            <div class="modal__dialog">
                <div class="modal__content">
                    <p>&nbsp;</p>
                    <div class="modal-content1">
                        <p>
                            If you click on yes your cart items will be lost.
                        </p>
                        <div class="registration-button">
                            <div class="registration-button-left">

                                <div class="container-login100-form-btn m-t-17">
                                    <asp:Button Text="Yes" ID="BtnYes" OnClick="BtnYes_Click" CssClass="login100-form-btn" runat="server" />
                                </div>
                            </div>

                            <div class="registration-button-right">
                                <div class="container-login100-form-btn m-t-17">
                                    <asp:Button Text="No" Id="BtnNo" OnClick="BtnNo_Click" CssClass="login100-form-btn" runat="server" />
                                    
                                </div>
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

               
            </ContentTemplate>
        </asp:UpdatePanel>

        <script src="js/index.js"></script>



        <%--<script>var x, i, j, l, ll, selElmnt, a, b, c;
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
            document.addEventListener("click", closeAllSelect);</script>--%>
    </form>
</body>
</html>
