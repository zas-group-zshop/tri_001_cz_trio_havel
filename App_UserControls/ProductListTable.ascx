<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListTable.ascx.cs" Inherits="ZASshop.NET.ProductListTable" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">    
    <div class="table-responsive table-responsive-sm">
        <table class="productList product-list-table table table-striped table-condensed">            
            <thead>
                    <tr style="background:white;">
                        <td colspan="2" style="background:white;"></td>
                        <td class="productParam" style="background:white;text-align:left;font-weight:bold;">Centrální sklad</td>
                        <td class='<%= "productParam" + (this.Page.ToString().Contains("shoppinglist_aspx") ? " hide-control" : "") %>' style="background:white;text-align:left;font-weight:bold;">Prodejna Teplice</td>                   
                    </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="rProductListTable" runat="server" 
                    OnItemCommand="rProductList_ItemCommand" 
                    onitemdatabound="rProductList_ItemDataBound" >
                    <ItemTemplate>
                        <tr class="product">
                            <td class="productTitle">
                                <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                            </td>

                            <td class="productTools">
                                <div class="tools">
                                    <asp:Panel ID="pAddToBasket" runat="server" CssClass="addToBasket">
                                        <asp:TextBox ID="tbQuantity" runat="server" Text="1" MaxLength="5" AutoPostBack="true" OnTextChanged="tbQuantity_TextChanged" CssClass="form-control input-sm product-list-table-quantity" />
                                        <%# DataBinder.Eval(Container.DataItem, "mj") %>
                                        <zas:IntoBasketButton ID="btIntoBasket" runat="server" CssClass="button btn btn-basic" CommandName="IntoBasket" Text="<%$ Resources: Resource, BasketEnter %>" ToolTip="<%$ Resources: Resource, BasketAfterInsertTitle %>"
                                            TbQuantityId="tbQuantity"
                                            Atribut1Id="ddlAtribut1" Atribut2Id="ddlAtribut2" Atribut3Id="ddlAtribut3" AtributKombId="ddlAtributKomb"
                                            Atribut1IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' Atribut2IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' Atribut3IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>'
                                            Atribut1Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_1_pracovat") %>' Atribut2Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_2_pracovat") %>' Atribut3Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_3_pracovat") %>'
                                            Atribut1Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_1_cis") %>' Atribut2Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_2_cis") %>' Atribut3Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_3_cis") %>'
                                            Atribut1Req='<%# DataBinder.Eval(Container.DataItem, "atribut_1_povinnost") %>' Atribut2Req='<%# DataBinder.Eval(Container.DataItem, "atribut_2_povinnost") %>' Atribut3Req='<%# DataBinder.Eval(Container.DataItem, "atribut_3_povinnost") %>'
                                            AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>'
                                            IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                            CisloNomen='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'
                                            TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                            Nazev='<%# DataBinder.Eval(Container.DataItem, "nazev") %>'
                                            IdMj='<%# DataBinder.Eval(Container.DataItem, "id_mj") %>'
                                            Mj='<%# DataBinder.Eval(Container.DataItem, "mj") %>'
                                            Cena='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena")) %>'
                                            Dph='<%# DataBinder.Eval(Container.DataItem, "dph_anone").ToString()=="1" ? true : false %>'
                                            CenaMistni='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni")) %>'
                                            IdMeny='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>'
                                            SazbaDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "sazba_dph")) %>'
                                            KoeficientDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "koeficient")) %>'
                                            ZasobaCelkem='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zasoba_celkem")) %>' />
                                    </asp:Panel>                                    
                                    <asp:Button      ID="hlCompare"                 runat="server" CssClass="compare"     ToolTip="<%$ Resources: Resource, CompareToolTip %>"         Text="<%$ Resources: Resource, Compare %>" CommandName="IntoCompare" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'/>
                                    
                                </div>
                            </td>

                            <td class="productParam">
                                <%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %>
                            </td>
                            <td class='<%= "productParam" + (this.Page.ToString().Contains("shoppinglist_aspx") ? " hide-control" : "") %>'>
                                <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "user_disp_e3") %>
                            </td>

                            <td class="productParam" style="display:none;">
                                Lorem ips
                            </td>

        					<asp:PlaceHolder ID="phAtributesKomb" runat="server">
                                <td colspan="3" class="productSelect">
                                    <zas:ZasAtributSelector ID="ddlAtributKomb" runat="server" 
                                        IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                        TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                        AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>'
                                        AtributPoradi="0"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlAtribut_1_SelectedIndexChanged" 
                                        CssClass="atr-komb-sel form-control input-sm" />
                                </td>
                            </asp:PlaceHolder>
        					<asp:PlaceHolder ID="phAtributes" runat="server">
                                <td class="productSelect">
                                    <zas:ZasAtributSelector ID="ddlAtribut1" runat="server"
                                        IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                        TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                        AtributName='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' AtributPrac='<%# DataBinder.Eval(Container.DataItem, "atribut_1_pracovat") %>'
                                        AtributCis='<%# DataBinder.Eval(Container.DataItem, "atribut_1_cis") %>' AtributReq='<%# DataBinder.Eval(Container.DataItem, "atribut_1_povinnost") %>'
                                        AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>' AtributPoradi="1"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlAtribut_1_SelectedIndexChanged" CssClass="form-control input-sm" />
                                </td>

                                <td class="productSelect">
                                    <zas:ZasAtributSelector ID="ddlAtribut2" runat="server"
                                        IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                        TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                        AtributName='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' AtributPrac='<%# DataBinder.Eval(Container.DataItem, "atribut_2_pracovat") %>'
                                        AtributCis='<%# DataBinder.Eval(Container.DataItem, "atribut_2_cis") %>' AtributReq='<%# DataBinder.Eval(Container.DataItem, "atribut_2_povinnost") %>'
                                        AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>' AtributPoradi="2"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlAtribut_2_SelectedIndexChanged" CssClass="form-control input-sm" />
                                </td>

                                <td class="productSelect">
                                    <zas:ZasAtributSelector ID="ddlAtribut3" runat="server"
                                        IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                        TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                        AtributName='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>' AtributPrac='<%# DataBinder.Eval(Container.DataItem, "atribut_3_pracovat") %>'
                                        AtributCis='<%# DataBinder.Eval(Container.DataItem, "atribut_3_cis") %>' AtributReq='<%# DataBinder.Eval(Container.DataItem, "atribut_3_povinnost") %>'
                                        AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>' AtributPoradi="3"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlAtribut_3_SelectedIndexChanged" CssClass="form-control input-sm" />
                                </td>
                            </asp:Placeholder>                            

                            <td class="productPrice">
                                <span class="price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                <span class="dph"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                            </td>

                            <td class="productPrice">                                
                                <span class="price2"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                <span class="dph2">vč. DPH</span><br />                                
                            </td>
                            
                            <td><asp:Button ID="btnRemoveFromShoppingList" runat="server" CssClass="btn btn-sm btn-danger remove-item" ToolTip="<%$ Resources: Resource, ShoppingListDeleteItem %>" Text="X" Visible="false" CommandName="RemoveFromShoppingList" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>' /></td>
                        </tr><!-- .product -->
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>

        </table><!-- .productList -->
    </div>
</asp:Panel>