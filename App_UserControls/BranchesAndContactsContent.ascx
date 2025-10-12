<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BranchesAndContactsContent.ascx.cs" Inherits="ZASshop.NET.App_UserControls.BranchesAndContactsContent" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

            <asp:Panel ID="pOwner" runat="server">
                <asp:TabContainer ID="tabsOwner" runat="server" ActiveTabIndex="0">
                    <asp:TabPanel ID="tabOwner" runat="server" HeaderText="<%$ Resources: Resource, OwnerHeadOffice %>">
                        <ContentTemplate>
                            <asp:Panel ID="pOwnerHeadOffice" runat="server">
                                <asp:FormView ID="fvOwnerHeadOffice" runat="server" RenderOuterTable="false">
                                    <ItemTemplate>
										<!-- office -->
										<div class="office">
											<div class="officeBox">
												<strong><%# DataBinder.Eval(Container.DataItem, "nazev") %></strong><br />
												<%# DataBinder.Eval(Container.DataItem, "ulice") %> <%# DataBinder.Eval(Container.DataItem, "cor") %> <br />
												<%# DataBinder.Eval(Container.DataItem, "obec") %> <br />
												<%# DataBinder.Eval(Container.DataItem, "psc") %> <br />
												<%# DataBinder.Eval(Container.DataItem, "stat_nazev") %> <br />
												<br />
																								
												<strong><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, AddressCompanyIC %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "ico") %></strong><br />
												<strong><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, AddressCompanyDIC %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "dic") %></strong><br />
												<br />
												<%# DataBinder.Eval(Container.DataItem, "zapis_or") %>
											</div>
																				
											<asp:PlaceHolder runat="server" Visible="false">
											<div class="officeBox">
												<strong><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, ContactFormPhone %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "telefon") %></strong><br />
												<strong><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, ContactFormFax %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "fax") %></strong><br />
												<strong><asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, E_mail %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "e_mail") %></strong><br />
												<strong><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, www %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "www") %></strong><br /><br />
																								
												<%# DataBinder.Eval(Container.DataItem, "udaje_1")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_2")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_3")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_4")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_5")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_6")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_7")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_8")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_9")  %><br />
												<%# DataBinder.Eval(Container.DataItem, "udaje_10") %><br />
											</div>
											</asp:PlaceHolder>
										</div>
										<!-- /office -->
                                    </ItemTemplate>
                                </asp:FormView>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tabBranches" runat="server" HeaderText="<%$ Resources: Resource, OwnerBranches %>">
                        <ContentTemplate>
                            <asp:Panel ID="pOwnerBranches" runat="server">
								<!-- office -->
								<div class="office">
                                    <zas:ZasRepeater ID="rOwnerBranches" runat="server">
                                        <ItemTemplate>
										    <div class="officeBox">
												    <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="" class="officeImg"/>
												
												    <h3 class="h1"><%# DataBinder.Eval(Container.DataItem, "nazev") %></h3>
												    <%# DataBinder.Eval(Container.DataItem, "ulice") %> <br />
												    <%# DataBinder.Eval(Container.DataItem, "obec") %> <br />
												    <%# DataBinder.Eval(Container.DataItem, "psc") %> <br />
												    <%# DataBinder.Eval(Container.DataItem, "stat_nazev") %><br />
												    <br />
													
                                                    <%# DataBinder.Eval(Container.DataItem, "www_mapa_1_txt") %><br />
                                                    <%# DataBinder.Eval(Container.DataItem, "www_mapa_1") %><br />

                                                    <%# DataBinder.Eval(Container.DataItem, "www_mapa_2_txt") %><br />
                                                    <%# DataBinder.Eval(Container.DataItem, "www_mapa_2") %><br />

																
												    <strong>GPS:</span>  <%# DataBinder.Eval(Container.DataItem, "gps_sirka") %>   <%# DataBinder.Eval(Container.DataItem, "gps_delka") %></strong><br />
												    <br />
																
												    <strong><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, ContactFormPhone %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "telefon") %></strong><br />
												    <strong><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, ContactFormFax %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "fax") %></strong><br />
												    <strong><asp:Literal ID="Litera9" runat="server" Text="<%$ Resources: Resource, E_mail %>" />:</span> <%# DataBinder.Eval(Container.DataItem, "e_mail") %></strong><br />
												    <br />
																
												    <%# DataBinder.Eval(Container.DataItem, "prac_doba") %><br />
												    <br />
																
												    <%# DataBinder.Eval(Container.DataItem, "poznamka_pro_web") %>
										    </div>
                                        </ItemTemplate>
                                    </zas:ZasRepeater>
								    
							    </div>
							    <!-- /office -->
							</asp:Panel>                        
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tabContacts" runat="server" HeaderText="<%$ Resources: Resource, PageBranchesAndContactsTitle %>">
                        <ContentTemplate>
                            <asp:Panel ID="pOwnerContacts" runat="server">
								<!-- contacts -->
								<div class="contacts">
									<div class="table-responsive">
										<asp:GridView ID="gvOwnerContacts" runat="server" DataKeyNames="rodne_cislo" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed">
											<Columns>
												<asp:TemplateField Visible="false">
													<ItemTemplate>
															<img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="" />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources: Resource, OwnerContactsName %>" Visible="false" />Oddělení</HeaderTemplate>
													<ItemTemplate>
															<%# DataBinder.Eval(Container.DataItem, "jmeno") %> <%# DataBinder.Eval(Container.DataItem, "prijmeni") %>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField Visible="false" DataField="zshop_funkce"    HeaderText="<%$ Resources: Resource, OwnerContactsFunction %>"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
												<asp:BoundField DataField="tel1"            HeaderText="<%$ Resources: Resource, OwnerContactsPhone %>"     ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
												<asp:BoundField Visible="false" DataField="mobil"           HeaderText="<%$ Resources: Resource, OwnerContactsMobil %>"     ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
												<asp:BoundField DataField="e_mail"          HeaderText="<%$ Resources: Resource, OwnerContactsEmail %>"     ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
											</Columns>
										</asp:GridView>
									</div>
								</div>
								<!-- /contacts -->
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </asp:Panel>