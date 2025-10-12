<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailDownloads.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailDownloads" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Panel runat="server">
               				        <!-- tabContent -->
				                    <div class="tabContent">
					                    <h3>
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, TabProductDetailDownloadsFull %>" />
                                            <zas:ZasLiteral ID="zLiteral1" runat="server" XmlPath="nazev"></zas:ZasLiteral>
                                        </h3>
					                    <p></p>
					
                                        <zas:ZasAttachments id="gwProductDetailDownloads" runat="server" RepeatDirection="Vertical"
                                            RepeatColumns="4"
                                            GridLines="None" ItemStyle-HorizontalAlign="Left" CellPadding="5" 
                                            ItemStyle-VerticalAlign="Top" 
                                            AttClass="ZSHOP_FILE" EnabDelete="false"
                                            XPathRoot="nomenklatura_detail" XPath="nomenklatura_detail/file_items" 
                                            OnItemDataBound="dlFiles_ItemDataBound" OnItemCommand="dlFiles_ItemCommand" >
	                                        <ItemTemplate>
                                                <div class="file" style="text-align: left;">
                                                    <asp:LinkButton ID="lnkDownload" runat="server"
                                                        CommandName="Download" CommandArgument = '<%# Eval("web_items_full_file")+"|"+Eval("file_name") %>'>
                                                        <span title='<%# DataBinder.Eval(Container.DataItem, "description") %>'><%# DataBinder.Eval(Container.DataItem, "file_name").ToString().Trim() %></span>
                                                    </asp:LinkButton>
                                                </div>
	                                        </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                        </zas:ZasAttachments>

					                    <p></p>
				                    </div>
				                    <!-- /tabContent -->
</asp:Panel>