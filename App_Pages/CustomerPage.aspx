<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="CustomerPage.aspx.cs" Inherits="ZASshop.NET.CustomerPage" EnableViewState="true" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ZasShopBodyPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="dynamicPopulate_Updating">
                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <!-- Account -->
            <div class="orderReg order-box customer-buttons">
                <h2 class="h1"><asp:Literal ID="lNotRegistered" runat="server" Text="<%$ Resources: Resource, AccountAdmin %>" /></h2>
                <p><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, AccountAdminDesc %>" /></p>
                
                <asp:HyperLink ID="hpAccount"    runat="server" Text="<%$ Resources: Resource, PageChangeAccountTitle %>"   NavigateUrl='<%# "~/" + ZASutility.MyUtility.GetLangResource("PageChangeAccount") %>' CssClass="btn btn-default" />
                <asp:HyperLink ID="hpPassword"   runat="server" Text="<%$ Resources: Resource, PageChangePasswordTitle %>"  NavigateUrl='<%# "~/" + ZASutility.MyUtility.GetLangResource("PageChangePassword") %>' CssClass="btn btn-default" />                    
                <asp:HyperLink ID="hpInvAddress" runat="server" Text="<%$ Resources: Resource, PageInvAddressTitle %>" NavigateUrl='<%# String.Format("~/{0}/{1}", ZASutility.MyUtility.GetLangResource("PageAddress"), ZASutility.MyUtility.GetLangResource("PageInvAddress")) %>' CssClass="btn btn-default" />                    
                <asp:HyperLink ID="hpDelAddress" runat="server" Text="<%$ Resources: Resource, PageDelAddressTitle %>" NavigateUrl='<%# String.Format("~/{0}/{1}", ZASutility.MyUtility.GetLangResource("PageAddress"), ZASutility.MyUtility.GetLangResource("PageDelAddress")) %>' CssClass="btn btn-default" />
                
            </div>
            <!-- /Account -->

			<div class="customer">
			    <!-- orders -->
                <div class="row">
                    <div class="col-md-12">
			            <div class="orderLogin order-box ">
				            <h2 class="h1"><asp:Literal ID="lAlreadyRegistered" runat="server" Text="<%$ Resources: Resource, LastOrders %>" /></h2>
				            <p><asp:Literal ID="lAlreadyRegisteredDescription" runat="server" Text="<%$ Resources: Resource, LastOrdersDesc %>" /></p>
										
				            <div class="RegForm">
					            <div class="formRow">

                                    <div class="table-responsive">
                                        <asp:GridView ID="gvLastOrders" runat="server" DataKeyNames="doklad" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed table-striped">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal ID="Literal6" runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("OrdersNum") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <a href='/<%# ZASutility.MyUtility.GetLangResource("PageOrderDetail") + "/&doklad=" + DataBinder.Eval(Container.DataItem, "doklad") %>'><%# DataBinder.Eval(Container.DataItem, "doklad") %></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("PageOrderDetailAD") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                      <asp:PlaceHolder runat="server" Visible='<%# String.IsNullOrEmpty(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "zshop_uz_name")) %>'>
                                                        (<%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_poradi") %>)
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_nazev") %> <br />
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_ulice").Trim()+" "+ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_cislo_popisne").Trim()+", "+ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_mesto")+" "+ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_psc")+", "+ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dod_adresa_stat") %>
                                                      </asp:PlaceHolder>
                                                      <asp:PlaceHolder runat="server" Visible='<%# !String.IsNullOrEmpty(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "zshop_uz_name")) %>'>
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "zpusob_odberu") %><br />
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "zshop_uz_name") %>
                                                      </asp:PlaceHolder>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("OrdersDatPrij") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dat_pri_txt")  %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("OrdersDatExp") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dat_expedice_txt")  %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("OrdersDatDelivery") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "dat_dodani_txt")  %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="text-right">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text='<%# ZASutility.MyUtility.GetLangResource("OrdersPriceTotal") %>' />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <span class="price"><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_celkem")))%> <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "stav").ToString() == "1" ? Resources.Resource.OrdersStatusClosed : Resources.Resource.OrdersStatusOpened %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnInsertItemsIntoBasket" runat="server" CssClass="button btn btn-basic btn-sm" ToolTip='<%# ZASutility.MyUtility.GetLangResource("OrderDetailItemsToBasket") %>' OnClick="btnInsertItemsIntoBasket_Click"><i class="fa fa-repeat" aria-hidden="true"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                    <asp:Literal ID="lLastOrdersEmpty" runat="server" Visible="false"></asp:Literal>
					            </div>
				            </div>
										
				            <asp:Panel ID="pOrdersButtons" runat="server" CssClass="cartButtons">
                                <asp:HyperLink ID="hlYourOrdersBtn" runat="server" 
                                    Text="<%$ Resources: Resource, YourOrdersBtn %>" CssClass="button btn btn-basic"
                                    NavigateUrl='<%# "~/" + ZASutility.MyUtility.GetLangResource("PageOrders") %>' />
				            </asp:Panel>
			            </div>
                    </div>
                </div>
			    <!-- /orders -->

			    <!-- invoices -->
                <div class="row">
                    <div class="col-md-12">
			            <div class="orderLogin order-box ">
				            <h2 class="h1"><asp:Literal ID="Literal10" runat="server" Text="<%$ Resources: Resource, LastInvoices %>" /></h2>
				            <p><asp:Literal ID="Literal11" runat="server" Text="<%$ Resources: Resource, LastInvoicesDesc %>" /></p>
										
				            <div class="RegForm">
					            <div class="formRow">

                                    <div class="table-responsive">
                                        <zas:HoverGridView ID="gvLastInvoices" runat="server"
                                            DataKeyNames="doklad" AutoGenerateColumns="false" 
                                            CssClass="table table-bordered table-condensed table-striped" HeaderStyle-CssClass=""
                                            data-count="6"
                                            ShowFooter="true" SumColumns="devizy_bez_dph,devizy,devizy_k_uhrade" SumLabelColumn="var_symbol" SumLabelText='<%# ZASutility.MyUtility.GetLangResource("BasketSummary") + ":" %>' >
                                            <Columns>
                                                <zas:BoundField DataField="doklad"          HeaderText="<%$ Resources: Resource, OrdersDkl %>"          HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"    ItemStyle-CssClass="hide-control" HeaderStyle-CssClass="hide-control" FooterStyle-CssClass="hide-control"/>
                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                                                    <HeaderTemplate>
                                                        <asp:Literal runat="server" Text="<%$ Resources: Resource, VariableSymbol %>" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <zas:ZasGetAttachButton runat="server" ID="btnDownloadFile" style="cursor: pointer;"
                                                            CssClass=""
                                                            Text='<%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "var_symbol") %>'
                                                            Enabled='<%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "att_poradi")=="1" %>'
                                                            data-att-tabulka='fv_zahlavi'
                                                            data-att-pk='<%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "doklad") %>'
                                                            data-att-poradi='<%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "att_poradi") %>'
                                                            data-att-file-name='<%# "fv_" + ZASutility.MyUtility.SafeEvalString(Container.DataItem, "doklad") + ".pdf" %>'
                                                            />
                                                    </ItemTemplate>
                                                    <FooterTemplate />
                                                </asp:TemplateField>
                                                <zas:BoundField DataField="dat_zd_pln"      HeaderText="<%$ Resources: Resource, TaxDateShort %>"       HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"    FormatString="dd.MM.yyyy"/>
                                                <zas:BoundField DataField="dat_spl"         HeaderText="<%$ Resources: Resource, DueDateShort %>"       HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"    FormatString="dd.MM.yyyy"/>

                                                <zas:BoundField DataField="devizy_bez_dph"  HeaderText="<%$ Resources: Resource, PriceWithoutTax %>"    HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"   FormatString="n"  HeaderStyle-CssClass="text-right"/>
                                                <zas:BoundField DataField="devizy"          HeaderText="<%$ Resources: Resource, PriceWithTax %>"       HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"   FormatString="n"  HeaderStyle-CssClass="text-right"/>
                                                <zas:BoundField DataField="devizy_k_uhrade" HeaderText="<%$ Resources: Resource, PriceToPay %>"         HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"   FormatString="n"  HeaderStyle-CssClass="text-right"/>

                                                <zas:BoundField DataField="id_meny"         HeaderText=""                                               HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"    />
                                                <zas:BoundField DataField="forma_uhrady"    HeaderText="<%$ Resources: Resource, FormOfPayment %>"      HeaderStyle-HorizontalAlign="Left"  ItemStyle-HorizontalAlign="Left"    ItemStyle-CssClass="hide-control" HeaderStyle-CssClass="hide-control" FooterStyle-CssClass="hide-control"/>
                                            </Columns>
                                        </zas:HoverGridView>
                                    </div>

                                    <asp:Literal ID="lLastInvoicesEmpty" runat="server" Visible="false"></asp:Literal>
					            </div>
				            </div>
										
				            <asp:Panel ID="pInvoicesButtons" runat="server" CssClass="cartButtons">
                                <asp:HyperLink ID="hlYourInvoicesBtn" runat="server" 
                                    Text="<%$ Resources: Resource, YourInvoicesBtn %>" CssClass="button btn btn-basic"
                                    NavigateUrl='<%# "~/" + ZASutility.MyUtility.GetLangResource("PageInvoices") %>' />
				            </asp:Panel>
			            </div>
                    </div>
                </div>
			    <!-- /invoices -->

                <div class="row">
                    <div class="col-md-6">
                        <!-- polozky -->
                        <asp:Panel ID="pTopOrdersItems" runat="server" CssClass="orderReg customer-box">
                            <h2 class="h1"><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, CustomersTopItems %>" /></h2>
                            <p><asp:Literal ID="Literal3" runat="server" Text="Vybíráme pro vás seznam položek, které u nás nakupujete nejčastěji" /></p>

                            <div class="RegForm">
                                <div class="formRow">
                                    <asp:GridView ID="gvTopOrdersItems" runat="server" DataKeyNames="cislo_nomenklatury" AutoGenerateColumns="false" HeaderStyle-CssClass="hide-control"  CssClass="table table-bordered table-condensed table-striped">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Literal ID="lTopOrdersItemsEmpty" runat="server" Visible="false"></asp:Literal>
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- /polozky -->
                    </div>
                    <div class="col-md-6">
                        <!-- kredit, zavazky -->
                        <asp:Panel ID="pCredits" runat="server" CssClass="orderReg customer-box">
                            <h2 class="h1"><asp:Literal runat="server" Text="Vaše závazky" /></h2>
                            <p><asp:Literal ID="Literal5" runat="server" Text="Informace o neuhrazených fakturách" /></p>

                            <div class="RegForm">
                                <div class="formRow">
                                    <asp:DetailsView ID="dvCredits" runat="server" CssClass="table table-bordered table-condensed table-striped" CellPadding="3" GridLines="Both" AutoGenerateRows="false" >
                                        <Fields>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                                <HeaderTemplate>
                                                    <asp:Literal runat="server" Text="Faktury celkem" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zavazky")))%>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                                <HeaderTemplate>
                                                    <asp:Literal runat="server" Text="Faktury po splatnosti" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zavazky_po_spl")))%>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </div>

                                
                                <asp:Panel ID="Panel2" runat="server" CssClass="cartButtons">
                                    <asp:Button ID="btnCreditsAct" runat="server" CssClass="button btn btn-basic"
                                        Text="<%$ Resources: Resource, CustomersCreditsActBtn %>"
                                        OnClick="btnCreditsAct_Click" />
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                        <!-- /kredit -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                                        
                        <!-- statistiky -->
                        <asp:Panel ID="Panel1" runat="server" CssClass="orderReg customer-box">
                            <h2 class="h1"><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, CustomersTurnover %>" /></h2>
                            <p><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, CustomersTurnoverDesc %>" /></p>

                            <div class="RegForm">
                                
                                <asp:Panel ID="Panel3" runat="server" CssClass="cartButtons">
                                    <asp:DropDownList ID="ddlYears" runat="server" AutoPostBack="true" CssClass="form-control" ViewStateMode="Enabled" EnableViewState="true"
                                        OnSelectedIndexChanged="ddlYears_SelectedIndexChanged" Width="100%" />
                                </asp:Panel>

                                <div class="formRow">
                                    <asp:GridView ID="gvTurnovers" runat="server" DataKeyNames="e_mail,fiskalni_rok,mesic" AutoGenerateColumns="false"
                                        CssClass="table table-bordered table-condensed table-striped" ShowFooter="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left">
                                                <HeaderTemplate>
                                                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, CustomersTurnoverMonth %>" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "mesic").ToString().Substring(4) %>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <b>Celkem</b>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-right">
                                                <HeaderTemplate>
                                                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, CustomersTurnoverWithoutTax %>" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "obrat_bez_dph")))%>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <b><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(ZASutility.MyUtility.GetStringXmlValue(xmlResXml.DocumentElement, "obrat_bez_dph_celkem"))) %>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%></b>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-right">
                                                <HeaderTemplate>
                                                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, CustomersTurnoverWithTax %>" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "obrat_s_dph")))%>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <b><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(ZASutility.MyUtility.GetStringXmlValue(xmlResXml.DocumentElement, "obrat_s_dph_celkem"))) %>  <%# GetFormatCurrency(ZASutility.MyUtility.GetSession("id_mistni_meny"))%></b>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Literal ID="lTurnoversEmpty" runat="server" Visible="false"></asp:Literal>
                                </div>

                                

                            </div>
                                                
                            
                        </asp:Panel>
                        <!-- /statistiky -->
                    </div>
                    <div class="col-sm-6">
                        
                        <!-- shopinglists -->
                        <div class="orderRegHeight customer-box">
                            <h2 class="h1"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, ShopingListsTitle %>" /></h2>
                            <p><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources: Resource, ShopingListsTitleDesc %>" /></p>
                                                
                            <div class="RegForm">
                                <div class="formRow">
                                    <asp:GridView ID="gvShopingLists" runat="server" DataKeyNames="id_seznamu" AutoGenerateColumns="false" HeaderStyle-CssClass="hide-control"  CssClass="table table-bordered table-condensed table-striped">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a href='/<%# ZASshop.NET.Resources.Resource.PageShoppingList + "/&id=" + DataBinder.Eval(Container.DataItem, "id_seznamu") %>'><%# String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "nazev").ToString()) ? Resources.Resource.ShopingListDefault : DataBinder.Eval(Container.DataItem, "nazev")%></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    (<%# ZASutility.MyUtility.GetLangResource("BasketCount") + " " + DataBinder.Eval(Container.DataItem, "items_cnt")%>)
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Literal ID="lShopingListsEmpty" runat="server" Visible="false"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <!-- /shopinglists -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
