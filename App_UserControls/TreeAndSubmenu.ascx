<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TreeAndSubmenu.ascx.cs" Inherits="ZASshop.NET.App_UserControls.TreeAndSubmenu" EnableViewState="false" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<div class="text-center visible-xs mobile-category-button">
    <button data-target="category-box" class="btn btn-default btn-md js-mobile-btn js-btn-menu"><i class="fa fa-list-ul" aria-hidden="true"></i> Rozcestník</button>
    <button data-target="main-page-description" class="btn btn-default btn-md js-mobile-btn js-btn-description"><i class="fa fa-bookmark" aria-hidden="true"></i> Popis</button>
    <button data-target="custom-search-box" class="btn btn-default btn-md js-mobile-btn js-btn-filter"><i class="fa fa-filter" aria-hidden="true"></i> Filtr</button>
</div>

<div id="leftMenu" class="left-menu mobile-left-menu hidden-xs">
    
    <zas:ZASmenu ID="NextTree" runat="server" Visible="false" Enabled="false"
        MenuResultHtml="ul"
        MenuDepthMax="4"
        MenuCurrentRootCssClass="active" MenuCurrentNodeCssClass="active" MenuCurrentItemCssClass="active" />
    <zas:ZASmenu ID="MainTree" runat="server" Visible="false" Enabled="false"
        MenuResultHtml="ul"
        MenuDepthMax="4"
        MenuCurrentRootCssClass="active" MenuCurrentNodeCssClass="active" MenuCurrentItemCssClass="active" />

    <div class="left-information">
        <asp:PlaceHolder ID="phUsefullInfo" runat="server">
            <div class="left-col-h2"><asp:Label ID="lLeftPanelInfoHeaderLabel" runat="server" Text="<%$ Resources: Resource, UsefullInfo %>"></asp:Label></div>
            <zas:ZASmenu ID="SubMenuTree" runat="server"
                MenuResultHtml="div" CssClass="SubMenuTree" ResultOuterHtmlParent="div"
                MenuCurrentNodeCssClass="activeNode" MenuCurrentItemCssClass="activeItem" />
        </asp:PlaceHolder>
    </div>
</div>
<!-- #leftMenu -->
</asp:Panel>