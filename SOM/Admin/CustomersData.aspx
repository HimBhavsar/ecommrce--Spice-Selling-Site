<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomersData.aspx.cs" Inherits="SOM.Admin.CustomersData" %>


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
        <div class="product-title-top">
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
                        <asp:TextBox class="search-main" CssClass="input-search input" MaxLength="100" ID="txtSearch" OnTextChanged="txtSearch_TextChanged" runat="server" placeholder="Search..." AutoPostBack="true"></asp:TextBox>

                </div>
            </div>
        </div>
        <div class="order-history-main">
            
            <div class="container">
            <asp:Label Text="" ID="lblError" CssClass="error-messege" runat="server" />
                <asp:LinkButton Visible="true" Text="Home" CssClass="navigation-link" ID="lnkGoOrders" OnClick="lnkGoOrders_Click" runat="server" />

                <asp:Label Text="Customers Details" CssClass="title-top" style="text-align:center" runat="server" />


                <div class="order-detail-main">
                    <div class="order-detail-main1">
                        <asp:GridView runat="server" ID="dgvCustomers" OnPageIndexChanging="dgvCustomers_PageIndexChanging"  OnRowDataBound="dgvCustomers_RowDataBound" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="false" pagesize="20" BorderStyle="None" allowpaging="true" >
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No."  >
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerNo" runat="server" Text='<%#Eval("SrNo")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("CustomerName") +"<br/>Address: "+ Eval("Address") +"<br/>"+Eval("Address2")%>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNumber" runat="server" Text='<%#Eval("MobileNumber")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
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

        <script src="../js/index.js"></script>


    </form>
</body>
</html>
