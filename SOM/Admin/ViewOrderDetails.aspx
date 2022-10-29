<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrderDetails.aspx.cs" Inherits="SOM.Admin.ViewOrderDetails" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


    <link rel="stylesheet" href="../css/style1.css">

    
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
                                <asp:ImageButton ImageUrl="~/images/logout-icon.png" runat="server" ID="imgLogout" OnClick="imgLogout_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="order-history-main">
            
            <div class="container">
            <asp:Label Text="" ID="lblError" CssClass="error-messege" runat="server" style=""/>
                <asp:LinkButton ID="lblHome" runat="server" CssClass="navigation-link" Text="Home" visible="true" OnClick="lnkGoHome_Click"></asp:LinkButton>
                    <asp:Label runat="server" CssClass="navigation-link" Text="&nbsp/&nbsp" visible="true" ></asp:Label>
                    <asp:LinkButton Visible="true" Text="Orders" CssClass="navigation-link" ID="lnkGoOrders" OnClick="lnkGoOrders_Click" runat="server" />
                <asp:Label Text="Customers Order Details" CssClass="title-top" style="text-align:center" runat="server" />
                    

                <div class="order-detail-main">
                    <asp:Label Text="Address" Style="color: #ed3737" runat="server" />
                        <div class="order-detail-top-bg">
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/images/CustomerIcon.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Session["CustomerName"] as string);%>
                            </div>
                            <div class="order-detail-address-top-div">
                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/CustomerAddress.png" CssClass="OrderAddress-Icon" />
                                <%Response.Write(Convert.ToString(Session["Address"]));%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/CustomerContact.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Session["CustomerMobile"] as string);%>
                            </div>
                        </div>
                        <br />
                        <asp:Label Text="Order Details" Style="color: #ed3737" runat="server" />
                        <div class="order-detail-top-bg">
                            <asp:Image ID="Image11" Visible="false" runat="server" ImageUrl="~/images/right-tick.png" CssClass="order-delivered" />
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image12" runat="server" ImageUrl="~/images/OrderNumber.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Convert.ToString(Session["OrderNumber"]));%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image13" runat="server" ImageUrl="~/images/OrderDate.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Convert.ToString(Session["OrderDate"]));%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image14" runat="server" ImageUrl="~/images/cartItems.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Convert.ToInt32(Session["OrderItems"]) + " Items");%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image15" runat="server" ImageUrl="~/images/OrderValue.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write("Rs. " + Convert.ToString(Session["OrderValue"]));%>
                            </div>
                        </div>
                    <div class="ex2">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:Accordion ID="Accordion1" runat="server" HeaderCssClass="headerCssClass" SelectedIndex="1" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="500" Width="100%" >
                            <Panes>  
                                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" >  
                                    <Header>
                                        <asp:Label Text="Items" CssClass="" runat="server" />
                                        <%--<asp:LinkButton ID="lnkViewItems" Text="View Items" CssClass="showItems" runat="server" OnClick="LnkViewItems_Click" />--%>
                                    </Header>  
                                    <Content >  
                                    <div class="order-detail-main1">
                                        <asp:GridView runat="server" ID="dgvOrderDetails" OnRowDataBound="dgvOrderDetails_RowDataBound" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="false" BorderStyle="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr." ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Eval("ItemNo")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item" ItemStyle-Width="60%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblItem" runat="server" Text='<%#Eval("Product")+" - "+Eval("Weight")%>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate / Qty" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRPQ" runat="server" Text='<%#Eval("MRP") + " / " + Eval("Qty")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                                    </div>
                                </Content>  
                            </ajaxToolkit:AccordionPane>  
                                <ajaxToolkit:AccordionPane  runat="server" ID="accordianpane2">
                                    <Header>Close</Header>
                                    
                                </ajaxToolkit:AccordionPane>
                        </Panes>
                        </ajaxToolkit:Accordion>

                    </div>
<%--                    <div class="order-detail-top-bg">
                        
                        
                        <asp:Image ID="Image7" Visible="false" runat="server" ImageUrl="~/images/right-tick.png" CssClass="order-delivered" />

                        <div class="order-detail-top-div"> 
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/OrderNumber.png" CssClass="OrderNumber-Icon" />                            
                            <%Response.Write(Session["OrderNumber"] as string);%>
                        </div>
                        <div class="order-detail-top-div">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/images/OrderDate.png" CssClass="OrderNumber-Icon" />
                            <%Response.Write(Session["OrderDate"] as string);%>
                        </div>
                        <div class="order-detail-top-div">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/CustomerIcon.png" CssClass="OrderNumber-Icon" />
                            <%Response.Write(Session["CustomerName"] as string);%>
                        </div>
                        <div class="order-detail-top-div">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/CustomerContact.png" CssClass="OrderNumber-Icon" /> 
                            <%Response.Write(Session["CustomerMobile"] as string);%>
                        </div>
                        <div class="order-detail-address-top-div">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/CustomerAddress.png" CssClass="OrderAddress-Icon" />
                            <%Response.Write(Session["Address"] as string);%>
                        </div>
                        
                        <div class="order-detail-top-div">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/images/OrderValue.png" CssClass="OrderNumber-Icon" />
                            <%Response.Write("Rs. "+Session["OrderValue"] as string);%>
                        </div>
                        
                    </div>--%>


                </div>
            </div>
        </div>

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


    </form>
</body>
</html>
