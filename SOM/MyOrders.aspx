<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="SOM.MyOrder" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <script src="js/prefixfree.min.js"></script>

    <link rel="stylesheet" href="css/style1.css" />


</head>

<body class="main-registration">
    
    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                            <div class="product-cart-right">
                                <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="imgLogout" OnClick="imgLogout_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="order-history-main">
            
            <div class="order-history-main">
                <div class="container">
                    <asp:Label Text="" ID="lblError" CssClass="error-messege" runat="server" />
                    <asp:LinkButton ID="lblHome" runat="server" CssClass="navigation-link" Text="Home" OnClick="lblHome_Click"></asp:LinkButton>

                <asp:Label Text="My Orders" CssClass="title-top" style="text-align:center" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <div class="order-detail-main">
                        <asp:GridView runat="server" ID="dgvMyOrderList" OnRowDataBound="dgvMyOrderList_RowDataBound" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false" BorderStyle="None">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%--<div class="order-detail-main">--%>
                                        <div class="order-detail-top-bg">
                                            <asp:Image ID="Image2" runat="server" Visible="false" ImageUrl="~/images/right-tick.png" CssClass="order-delivered" />
                                            <asp:Image ID="imgCancelledOrder" runat="server" Visible="false" ImageUrl="~/images/cancelled.png" CssClass="order-cancelled" />
                                            <div class="order-detail-top-div">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/OrderNumber.png" CssClass="OrderNumber-Icon" />
                                                <asp:LinkButton CommandArgument='<%#Eval("OrderID") %>' OnClick="OrderNumber_Click" ID="OrderNumber" Text='<%#Eval("OrderNumber") %>' runat="server" />
                                            </div>
                                            <div class="order-detail-top-div">
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/OrderDate.png" CssClass="OrderNumber-Icon" />
                                                <asp:Label ID="lblDate" Text='<%#Convert.ToDateTime(Eval("OrderDateTime")).ToString("dd-MMM-yyyy hh:mm tt") %>' runat="server" />
                                            </div>
                                            <div class="order-detail-top-div">
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/OrderValue.png" CssClass="OrderNumber-Icon" />
                                                <asp:Label ID="lblAmount" Text='<%#"Rs. "+Eval("OrderValue") %>' runat="server" />
                                            </div>
                                            <%--<div class="order-detail-top-div">
                                                
                                                <ajaxToolkit:Accordion runat="server" ID="Accordian" HeaderCssClass="headerCssClass" RequireOpenedPane="false" SelectedIndex="-1" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="500" Width="100%"  >
                                                    <Panes>
                                                        <ajaxToolkit:AccordionPane runat="server">
                                                            <Header>Cancel Your Order</Header>
                                                            <Content>
                                                                <asp:TextBox runat="server" Rows="3" TextMode="MultiLine" placeholder="Cancellation Reason" ID="txtCancelationReason" CssClass="input-text-area wrap-input100 validate-input"/>
                                                                <asp:Button  OnClick="BtnCancelOrder_Click" ID="BtnCancelOrder" CssClass="btn-Cancel-Order" CommandArgument='<%#Eval("OrderID") %>' Text="Cancel Order" runat="server" />

                                                            </Content>
                                                        </ajaxToolkit:AccordionPane>
                                                    </Panes>
                                                </ajaxToolkit:Accordion>
                                            </div>--%>
                                        </div>
                                        <%--</div>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    
                </div>
            </div>
        </div>
        <div runat="server" id="divEmptyOrder">
                <asp:Image ID="imgEmptyCart" runat="server" ImageUrl="~/images/NoOrder.png" CssClass="EmptyCartLabel" />
                <br/>
                <asp:Label Text="Oops !!! There is no Order From your side<br/>Let's Shop Something" CssClass="noItems" ID="lblNoData" runat="server" />
                <br/>
                <asp:Button Text="Order Something" runat="server" ID="btnGo" CssClass="place-main login100-form-btn" style="position: fixed !important;" OnClick="btnGo_Click"/>
            </div>
        <!-- Modal -->
        <%--<div id="modal" class="modal modal__bg" role="dialog" aria-hidden="true">
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
                    <a href="#" class="modal__close demo-close">
                        <svg class="" viewBox="0 0 24 24">
                            <path d="M19 6.41l-1.41-1.41-5.59 5.59-5.59-5.59-1.41 1.41 5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59z" />
                            <path d="M0 0h24v24h-24z" fill="none" />
                        </svg>
                    </a>

                </div>
            </div>
        </div>--%>

        <script src="js/index.js"></script>


    </form>
</body>
</html>
