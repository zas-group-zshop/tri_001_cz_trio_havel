<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailDescription.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailDescription" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
				                    <!-- /tabContent -->
				                    <div class="tabContent">
					                    <h3>
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, TabProductDetailDescFull %>" />
                                            <zas:ZasLiteral ID="zLiteral1" runat="server" XmlPath="nazev"></zas:ZasLiteral>
                                        </h3>
					                    <p>
                                            <zas:ZasLiteral ID="lUplnyPopis" runat="server" XmlPath="uplny_popis" ZasType="Text" />
                                        </p>
<asp:PlaceHolder runat="server" Visible="false">
					                    <p>
                                            <zas:ZasLiteral ID="lTechnickyPopis" runat="server" XmlPath="technicky_popis" ZasType="Text" />
                                        </p>
</asp:PlaceHolder>
                                        <asp:PlaceHolder ID="phBonus" runat="server">
                                            <p>
                                                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, TabProductDetailDescBonusDesc1 %>" />&nbsp;
                                                <zas:ZasLiteral ID="lBonus" runat="server" XmlPath="web_items_bonus" ZasType="Text" />&nbsp;<zas:ZasLiteral ID="lBonusIdMeny" runat="server" XmlPath="web_items_bonus_id_meny" ZasType="Text" />
                                                <br />
                                                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, TabProductDetailDescBonusDesc2 %>" />
                                            </p>
                                        </asp:PlaceHolder>
				                    </div>
				                    <!-- /tabContent -->
</asp:Panel>