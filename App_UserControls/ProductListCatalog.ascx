<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListCatalog.ascx.cs" Inherits="ZASshop.NET.ProductListCatalog" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Panel runat="server" CssClass="productList product-list-catalog">
    <div class="product-slider">
    <asp:Repeater ID="rProductListCatalog" runat="server" 
        OnItemCommand="rProductList_ItemCommand" 
        OnItemDataBound="rProductList_ItemDataBound" >
        <ItemTemplate>
            <asp:Panel ID="pProduktPanel" runat="server" CssClass='<%# "product" + (((Container.ItemIndex + 1) % 3 == 0) ? " mod-3" : "") + (((Container.ItemIndex + 1) % 4 == 0) ? " mod-4" : "") + (((Container.ItemIndex + 1) % 2 == 0) ? " mod-2" : "") + (((Container.ItemIndex + 1) % 6 == 0) ? " mod-6" : "") %>'>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="product-list-image">                            
                            <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>" title="<%# DataBinder.Eval(Container.DataItem, "nazev") %>">
                                <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="<%# DataBinder.Eval(Container.DataItem, "nazev") %>" />
                                <span class="<%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? "badge mod-news" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? "badge mod-action" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? "badge mod-sellout" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "badge mod-top" : "badge mod-none"))) %>">
                                    <%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? ZASutility.MyUtility.GetLangResource("ActionTypeNewsName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? ZASutility.MyUtility.GetLangResource("ActionTypeActionName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? ZASutility.MyUtility.GetLangResource("ActionTypeSellOutName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "TOP PRODUKT" : ""))) %>
                                </span>
                            </a>
                            
                            <div class="rating hide-control">
                                <%# DataBinder.Eval(Container.DataItem, "web_items_hodnoceni")%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="product-list-title">
                            <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                        </h2>
                    </div>
                </div>                                                

                <div class="row">
                    <div class="col-md-12">
                        <!-- productRight -->
                        <div class="productRight product-list-right">
                            <div class="priceInfo product-list-price-info">
                                <span class="product-list-price-old">
                                    <del><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceOnly, DataBinder.Eval(Container.DataItem, "ref_cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></del> <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.CurrencyOnly, DataBinder.Eval(Container.DataItem, "ref_cena").ToString(), DataBinder.Eval(Container.DataItem, "ref_cena_id_meny").ToString()) %>
                                </span>                                
                                <span class="product-list-price price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                <span class="product-list-vat dph">vč. DPH</span><br />
                                <span class=""><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                <span class=""><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                <asp:PlaceHolder ID="phDualPrice" runat="server" Visible="false">
                                    <span class="eura">
                                        <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, GetDualPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni").ToString())).ToString(), ZASutility.MyUtility.GetSession("id_dualni_meny")) %>
                                        <span class="dph"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                    </span>
                                </asp:PlaceHolder>
                            </div>                                                        
                        </div>
                        <!-- /productRight -->
                    </div>
                    <div class="col-md-5">
                        <div class="tools">
                            
                        </div>
                    </div>
                </div>                

                <div class="row">
                    <div class="col-sm-12">
                        <table cellpadding="0" cellspacing="0" border="0" class="params table table-condensed table-borderless">
                            <tbody>
				<asp:PlaceHolder runat="server" Visible='<%# !String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("n_sl_c1_popis")) %>'>
                                <tr>
                                    <th><%# ZASutility.MyUtility.GetSession("n_sl_c1_popis") %>:</th>
                                    <td><%# DataBinder.Eval(Container.DataItem, "zshop_n_sl_c1")%></td>
                                </tr>
				</asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%# !String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("n_sl_n2_popis")) %>'>
				<tr>
                                    <th><%# ZASutility.MyUtility.GetSession("n_sl_n2_popis") %>:</th>
                                    <td><%# GetIntFromString(DataBinder.Eval(Container.DataItem, "zshop_n_sl_n2").ToString()) %></td>
                                </tr>
				</asp:PlaceHolder>
                                <tr>
                                    <th><%# ZASshop.NET.Resources.Resource.ProductId %>:</th>
                                    <td><%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %></td>
                                </tr>
                                <tr>                                    
                                    <td colspan="2"><%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %></td>
                                </tr>                                    
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row hide-control">
                    <div class="col-sm-12 text-center">
                        <asp:HyperLink ID="hlDetail" runat="server" CssClass="detail btn btn-sm btn-default" ToolTip="<%$ Resources: Resource, Detail %>" Text="<%$ Resources: Resource, Detail %>" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>' />
                    </div>
                </div>

            </asp:Panel>
        </ItemTemplate>
    </asp:Repeater>
    </div><!-- .product-slider -->

    <asp:Panel ID="AfterInsertIntoBasketAction_Panel" runat="server">
        <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control hidden" />
        <asp:ModalPopupExtender ID="AfterInsertIntoBasketAction_mpe" runat="server"
            TargetControlID="FakeBtnAction" PopupControlID="AfterInsertIntoBasketAction"
            DropShadow="true" BackgroundCssClass="modal" CancelControlID="hlAfterBack" />
        <asp:Panel ID="AfterInsertIntoBasketAction" runat="server" CssClass="modal-popup">
            <!-- pageDesc -->
            <div class="pageDesc modal-desc">
                <div class="modal-title"><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertTitle %>"></asp:Literal></div>
                <asp:Panel ID="pDescription" runat="server" cssClass="cartPopupDesc">
                    <p><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc1 %>" /></p>
                    <p><strong><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc2 %>" /></strong></p>
                </asp:Panel>
            </div>
            <!-- /pageDesc -->

			<!-- cartButtons -->
			<div class="cartButtons modal-buttons" data-url='<%: Request.RawUrl %>'>
                <a href='<%: Request.RawUrl %>'   class="button btn btn-sm btn-default"><%: ZASutility.MyUtility.GetLangResource("BasketAfterActionBack") %></a>
                <asp:HyperLink ID="hlAfterBack"   CssClass="button btn btn-sm btn-default hide-control" runat="server" Text="<%$ Resources: Resource, BasketAfterActionBack %>" />
                <asp:HyperLink ID="hlAfterBasket" CssClass="button btn btn-sm btn-default" runat="server" NavigateUrl="~/kosik" Text="<%$ Resources: Resource, BasketAfterActionBasket %>" />
                <asp:HyperLink ID="hlAfterOrder"  CssClass="button btn btn-sm btn-basic"   runat="server" NavigateUrl="~/objednavka" Text="<%$ Resources: Resource, BasketAfterActionOrder %>" />
			</div>
			<!-- /cartButtons -->
        </asp:Panel>
    </asp:Panel>



    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="15" Columns="50" Enabled="false" ReadOnly="true" Visible="false"></asp:TextBox>
</asp:Panel>