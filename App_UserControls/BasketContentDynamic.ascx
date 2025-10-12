<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BasketContentDynamic.ascx.cs" Inherits="ZASshop.NET.App_UserControls.BasketContentDynamic" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<div class="popupcart-title"><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, BasketContentTitle %>" /></div>
<table>
    <tbody>
        <asp:Repeater ID="rBasketTableInControl" runat="server" OnItemDataBound="rBasketTable_ItemDataBound">
            <ItemTemplate>
				<asp:HiddenField ID="hfBasketId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' />
				<asp:HiddenField ID="hfCena" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "cena") %>' />
				<asp:HiddenField ID="hfDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "dph_anone") %>' />
				<asp:HiddenField ID="hfSazbaDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "sazba_dph") %>' />
				<asp:HiddenField ID="hfKoeficientDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "koeficient") %>' />
				<asp:HiddenField ID="hfIdMeny" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>' />
                <asp:TextBox ID="tbQuantity" runat="server" Text='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi").ToString()) %>' Visible="false" />

                <tr class="productTitle">
				    <td colspan="2"><a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a></td>
				</tr>
				<tr>
                    <td>
                        <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>">
                			<img src='<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>' alt="" width="50" loading="lazy">
                		</a>
                    </td>
					<td><div class='<%# (!String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "cena").ToString()) ? "" : "hide-control") %>'><%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi").ToString()).ToString("0.00") %> <%# DataBinder.Eval(Container.DataItem, "mj") %></div></td>
					<td class="text-right">
						<span class="price">
							<asp:Literal ID="lPriceWithDph" runat="server" />
							<asp:Literal ID="lPriceWithDphIdMeny" runat="server" />
						</span>
					</td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        
                <tr class="product sumPrice" runat="server" Visible="False">
		            <td colspan="2" runat="server" Visible="False"><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, BasketSummary %>" />:</td>
		            <td class="productPrice">
                        <span class="price">
                            <asp:Literal ID="lSummaryPriceWithDph" runat="server"></asp:Literal>
                            <asp:Literal ID="lSummaryPriceWithDphIdMeny" runat="server"></asp:Literal>
                        </span>
                    </td>
			    </tr>
    </tbody>
</table>

<div class="popupCart-links">
	<asp:HyperLink ID="hpBasketItemsGoToBasket" runat="server" class="btn btn-primary btn-sm basket-dynamic-items-go-to-basket" Text="DO KOŠÍKU" />
	<asp:HyperLink ID="hpBasketItemsGoToOrder"  runat="server" class="btn btn-primary btn-sm basket-dynamic-items-go-to-order" Text="K POKLADNĚ" />
</div>
</asp:Panel>