<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailParameters.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailParameters" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<!-- tabContent -->
<div class="tabContent">
    <h3>
        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, TabProductDetailParamsFull %>" />
        <zas:ZasLiteral ID="zLiteral1" runat="server" XmlPath="nazev"></zas:ZasLiteral>
    </h3>

    <zas:ZasGridView ID="gwProductDetailParameters" runat="server" HeaderStyle-CssClass="hide-control" CssClass="table table-striped table-condensed table-bordered"
        AutoGenerateColumns="false"
        OddRowCssClass="odd">
        <Columns>
            <asp:BoundField DataField="vlastnost_nazev" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="web_items_vlastnost_values" HtmlEncode="false" />
        </Columns>
    </zas:ZasGridView>

    <p></p>
</div>
<!-- /tabContent -->
</asp:Panel>