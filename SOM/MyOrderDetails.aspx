<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrderDetails.aspx.cs" Inherits="SOM.My_OrderDetails" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

    <link rel="stylesheet" href="css/style1.css">
    <script src="js/prefixfree.min.js"></script>

</head>

<body class="main-registration">
    <form runat="server">
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

            <asp:Label Text="" ID="lblError" CssClass="error-messege" runat="server" />
            <div class="container">
                <asp:LinkButton Text="Home " CssClass="navigation-link" ID="lnkGoHome" OnClick="lnkGoHome_Click" runat="server" />
                <asp:Label Text=" / " Style="padding-left: 3px; padding-right: 3px;" runat="server" CssClass="navigation-link" />
                <asp:LinkButton Text="Orders" CssClass="navigation-link" ID="lnkGoOrders" OnClick="lnkGoOrders_Click" runat="server" />
                <asp:Label Text="My Order Details" CssClass="title-top" Style="text-align: center" runat="server" />



                <div class="order-detail-main">
                    <div runat="server" id="divOrderDetails">
                        <asp:Label Text="Address" Style="color: #ed3737" runat="server" />
                        <div class="order-detail-top-bg">
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/CustomerIcon.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Session["Username"] as string);%>
                            </div>
                            <div class="order-detail-address-top-div">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/CustomerAddress.png" CssClass="OrderAddress-Icon" />
                                <%Response.Write(ViewState["DeliveryAddress"] as string);%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/CustomerContact.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Session["MobileNumber"] as string);%>
                            </div>
                        </div>
                        <br />
                        <asp:Label Text="Order Details" Style="color: #ed3737" runat="server" />
                        <div class="order-detail-top-bg">
                            <asp:Image ID="Image3" Visible="false" runat="server" ImageUrl="~/images/right-tick.png" CssClass="order-delivered" />
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image7" runat="server" ImageUrl="~/images/OrderNumber.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(ViewState["OrderNumber"] as string);%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/images/OrderDate.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(ViewState["OrderDate"] as string);%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/cartItems.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write(Convert.ToInt32(ViewState["OrderItems"]) + " Items");%>
                            </div>
                            <div class="order-detail-top-div">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/OrderValue.png" CssClass="OrderNumber-Icon" />
                                <%Response.Write("Rs. " + ViewState["OrderValue"] as string);%>
                            </div>
                        </div>
                        <div class="ex2">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <ajaxtoolkit:accordion id="Accordion1" runat="server" headercssclass="headerCssClass" selectedindex="1" contentcssclass="contentCssClass" headerselectedcssclass="headerSelectedCss" fadetransitions="true" transitionduration="500" width="100%">
                            <Panes>  
                                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" >  
                                    <Header>
                                        <asp:Label Text="Your Items" CssClass="" runat="server" />
                                        <%--<asp:LinkButton ID="lnkViewItems" Text="View Items" CssClass="showItems" runat="server" OnClick="LnkViewItems_Click" />--%>
                                    </Header>  
                                    <Content >  
                                    <div class="order-detail-main1">
                                        <asp:GridView runat="server" ID="dgvMyOrder" OnRowDataBound="dgvMyOrder_RowDataBound" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false" BorderStyle="None">
                                            <Columns>
                                                <%--<asp:TemplateField ItemStyle-Width="3%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblItem" runat="server" Text='<%#Eval("ItemNo")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                <asp:TemplateField ItemStyle-CssClass="image-width-tag">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgProductImage" runat="server" src='<%#Eval("Path")%>'></asp:Image>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="57%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItem" runat="server" Text='<%#Eval("Product")+" - "+Eval("Weight") %>' Style="color: #ed3737;"></asp:Label>
                                                        <asp:Label Text='<%#"<br/>MRP: "+ Eval("MRP") %>' runat="server" />
                                                        <asp:Label Text='<%#"Qty. " + Eval("Qty") %>' runat="server" Style="float: right; text-align: right;" />
                                                        <%--<asp:Label Text='<%#"<br/>PPQ. " + Eval("Amount") %>' runat="server" />--%>
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
                        </ajaxtoolkit:accordion>

                        <%--<ajaxToolkit:Accordion runat="server" ID="Accordian" HeaderCssClass="headerCssClass" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="500" AutoSize="None" SelectedIndex="0"> 
                            <Panes>
                                <ajaxToolkit:AccordionPane  ID="AccordionPane1" runat="server">
                                    <Header>
                                        New User
                                    </Header>
                                    <Content>
                                        <b><u>New User</u></b>  
                                        <table>  
                                            <tr><td>Name:</td><td><input type="text" /></td></tr>  
                                            <tr><td>Password:</td><td><input type="text" /></td></tr>  
                                            <tr><td>Re-Password:</td><td><input type="text" /></td></tr>  
                                            <tr><td></td><td><input type="button" value="Submit"/></td></tr>  
                                        </table> 
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                                <ajaxToolkit:AccordionPane  ID="AccordionPane2" runat="server">
                                    <Header>
                                        Login
                                    </Header>
                                    <Content>
                                        <b><u>Login User</u></b>  
                                        <table>  
                                            <tr><td>Name:</td><td><input type="text" /></td></tr>  
                                            <tr><td>Password:</td><td><input type="text" /></td></tr>  
                                            <tr><td></td><td><input type="button" value="Login"/></td></tr>  
                                        </table>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                            </Panes>
                        </ajaxToolkit:Accordion>--%>
                    </div>
                    </div>
                    


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

        <script src="js/index.js"></script>


    </form>
</body>
</html>
