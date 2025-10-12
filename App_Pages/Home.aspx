<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ZASshop.NET.Home" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ZasShopBodyPlaceHolder" runat="server">

    <asp:PlaceHolder ID="phProdPlocha" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="dynamicPopulate_Updating">
                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <asp:PlaceHolder ID="phHome" runat="server">
                <asp:PlaceHolder ID="phAkceParent" runat="server" >
                    <asp:Panel ID="pProductList" runat="server" CssClass="ProductListCatalog home-catalogue akce">
                        <div class="hide-control">
                            <asp:PlaceHolder ID="FirmPhHidden" runat="server" />
                        </div>
                        <div class="co-chcete">
                            <asp:PlaceHolder ID="FirmPhAkce1" runat="server" />
                        </div>
                        <asp:PlaceHolder ID="phAkce" runat="server" />
                    </asp:Panel>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="phNews" runat="server" Visible="false" />

                <asp:PlaceHolder ID="phFavorites" runat="server" Visible="false" />

            </asp:PlaceHolder>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:PlaceHolder ID="phProdPlochaDole" runat="server" />
</asp:Content>
