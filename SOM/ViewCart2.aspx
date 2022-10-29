<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart2.aspx.cs" Inherits="SOM.ViewCart2" %>

<!DOCTYPE html>
<html lang="en-US" class="scheme_original">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/favicon.png" type="image/png" sizes="37x16">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Welcome To Mahalaxmi masala</title>

    <link property="stylesheet" rel='stylesheet' href='../css/style.css' type='text/css' media='all' />
    <!--    <link property="stylesheet" rel='stylesheet' href='css/main.css' type='text/css' media='all' /> -->
    <link property="stylesheet" rel='stylesheet' href='../css/bootstrap.css' type='text/css' media='all' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="js/prefixfree.min.js"></script>
    <link href="css/style1.css" rel="stylesheet" />
    


</head>

<body class="main-registration">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
        <div class="product-title-top">
            <div class="product-title">
                <div class="container">
                    <div class="product-left">
                        <div class="product-name">
                            <img src="images/user-icon.png">
                            <%Response.Write(Session["Username"] as string); %>
                        </div>
                        <div class="product-mobile">
                            <img src="images/phone-icon.png">
                            <%Response.Write(Session["MobileNumber"] as string); %>
                        </div>
                    </div>
                    <div class="product-right">
                        <div class="product-cart">
                            <div class="product-cart-left ">
                                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
                                    <ContentTemplate>
                                        <%--<a href="View-Cart.aspx">--%>
                           
                                        <img src="images/cart-icon.png" style="margin-right: 20px;"> <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="imgLogout" OnClick="ImgLogout_Click" />
                                        <br>
                                        <asp:Label ID="lblItemsCount" Style="color: #fff;margin-right:35px;" Text="0 Items" runat="server"  /><%--</a>--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <%--<div class="product-cart-right">
                                <%--<asp:ImageButton runat="server" CausesValidation="false" CssClass="container-login100-form-btn m-t-17 login100-form-btn-2" ID="btnLogout" OnClick="btnLogout_Click" Style="color: #fff; display: initial;" Text="Logout" />
                            </div>--%>
                        </div>
                        
                    </div>
                    <asp:TextBox class="search-main" CssClass="input-search input" visible="false" MaxLength="100" ID="txtSearch" OnTextChanged="TxtSearch_TextChanged" runat="server" placeholder="Search..." AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="order-history-main">
            
            <div class="container" style="padding: 0px;">
                <asp:UpdatePanel runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="lblError" runat="server" CssClass = "error-messege" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:LinkButton Text="Home" CssClass="navigation-link" ID="lnkHome" OnClick="LnkHome_Click" runat="server" style="margin-left: 10px;" /><asp:Label CssClass="navigation-link" Text="&nbsp&nbsp/&nbsp&nbsp" runat="server" /><asp:LinkButton Text="Products" CssClass="navigation-link" ID="lnkProducts" OnClick="LnkProducts_Click" runat="server" />

                <asp:Label Text="My Cart Items" CssClass="title-top" style="text-align:center" runat="server" />

                <asp:UpdatePanel runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div class="order-detail-main product-main" id="divCartItems" runat="server">
                            <div class="order-detail-main1">
                                <asp:GridView runat="server" ID="dgvViewCart" ShowHeader="false" pagesize="25" style="border:none" OnRowCommand="DgvViewCart_RowCommand" OnRowDataBound="DgvViewCart_RowDataBound" OnPageIndexChanging="DgvViewCart_PageIndexChanging" AutoGenerateColumns="false" ShowFooter="false" BorderStyle="None" allowpaging="false" >
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="image-width-tag" >
                                            <ItemTemplate>
                                                <asp:Image ID="imgProductImage" runat="server" src='<%#Eval("Path")%>'></asp:Image>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label Enable="false" Text='<%#Eval("ProductName") %>' style="font-weight:500; font-size: 16px;" ID="lblProductName" runat="server"/><br/>
                                                <asp:Label ID="lblWeight" Text='<%#Eval("Grams") %>' style="" runat="server" />&nbsp<asp:Label ID="lblPrice" runat="server" Text='<%#"( Rs. "+ Eval("Value") + ")" %>'></asp:Label><br/>
                                                <div class="product-left">
                                                    <asp:Label ID="lblPriceParQty" CssClass="PPQ"  Text='<%#"PPQ. : "+ Eval("PriceParQty") %>' runat="server" />
                                                </div>
                                                <div class="CartQtyArea">
                                                    <asp:Button Text="-" CssClass="CartQtyArea-left"  runat="server" ID="btnRemoveProduct" CommandName="RemoveItem" CommandArgument='<%#Eval("ProductPackagingID") %>' OnClick="BtnRemoveProduct_Click" />
                                                    <asp:Label CssClass="CartQtyArea-middle" ID="lblQty" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
                                                    <asp:Button Text="+" CssClass="CartQtyArea-right" runat="server" ID="btnAddProduct" CommandName="AddItem" CommandArgument='<%#Eval("ProductPackagingID") %>' OnClick="BtnAddProduct_Click" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dgvViewCart" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="place-main">
            <div class="container">
                <div class="place-left">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:Label Text="Rs. 0.00" ID="lblTotalAmount" runat="server" /><br/>
                            <asp:Label Text="Minimum Order Value is Rs. 600.00" style="font-size: 8px; color:#ed3237" ID="Label1" runat="server" />
                        
                    <asp:LinkButton ID="lnkViewProducts" OnClick="LnkViewProducts_Click" Visible="false" runat="server" Style="color: #fd7d03; font-size: 85%;">Back to Product List</asp:LinkButton>
                            </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="place-right">
                    <div class="container-login100-form-btn">
                        <asp:UpdatePanel runat="server" UpdateMode="Always">
                            <ContentTemplate>
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place order" OnClick="BtnPlaceOrder_Click" Enabled="true" class="login100-form-btn container-login100-form-btn"></asp:Button>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Image ID="imgEmptyCart"  runat="server" ImageUrl="~/images/EmptyCart.png" cssClass="EmptyCartLabel"  visible="false" />
                <br/>
                <asp:Label Text="There is no Any Item In Cart!!" CssClass="noItems" ID="lblNoData" Visible="false" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Modal -->
        <%-- <div id="modal" class="modal modal__bg" role="dialog" aria-hidden="true">
            <div class="modal__dialog">
                <div class="modal__content">
                    <p>&nbsp;</p>
                    <div class="modal-content1">
                        <p>2 - Aug - 2020 4:45PM</p>
                        <p>Delivered by Chetan</p>
                        <p>Qty - 2</p>
                    </div>

                    <div class="modal-content1">
                        <p>2 - Aug - 2020 4:45PM</p>
                        <p>Delivered by Chetan</p>
                        <p>Qty - 2</p>
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
        </div>--%>

        <script src="../js/index.js"></script>
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
