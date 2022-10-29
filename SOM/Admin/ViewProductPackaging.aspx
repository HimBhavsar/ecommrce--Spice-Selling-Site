<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProductPackaging.aspx.cs" Inherits="SOM.Admin.ViewProductPackaging" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
                    <br />
                    <asp:DropDownList cssclass="custom-select" ID="ddlFilterWeight"  runat="server" AutoPostBack="true" style="margin-top: 10px;" OnSelectedIndexChanged="ddlFilterWeight_SelectedIndexChanged"></asp:DropDownList>

                </div>
            </div>
        </div>
        <div class="order-history-main">
            <div class="container">
                <asp:UpdatePanel runat="server" UpdateMode="Always">
                    <ContentTemplate>

                        <asp:Label Text="" ID="lblError" CssClass="error-messege" runat="server" style="margin-top: 50px;"  />

                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--select-box wrap-input100 validate-input--%>
                <asp:LinkButton Visible="true" Text="Home" CssClass="navigation-link" ID="lnkHome" OnClick="lnkHome_Click" runat="server"  />

                <asp:Label Text="Product Packaging Details" CssClass="title-top" Style="text-align: center;" runat="server"/>


                <div class="order-detail-main">
                    <div class="order-detail-main1">
                        
                                <asp:GridView runat="server" ID="dgvProductPackagings" PagerStyle-HorizontalAlign="Center" OnPageIndexChanging="dgvProductPackagings_PageIndexChanging" OnRowDataBound="dgvProductPackagings_RowDataBound" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="false" PageSize="25" BorderStyle="None" AllowPaging="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No." ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%#Eval("SrNo")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product" ItemStyle-Width="80%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductPackagingDetails" runat="server" Text='<%#Eval("ProductName") + " ("+Eval("Weight") + ")<br/>Rs. " + Eval("MRP") + "<br/>" + Eval("Status")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("ProductPackagingID") %>' Text="Edit" OnClick="lnkEdit_Click"></asp:LinkButton>
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
