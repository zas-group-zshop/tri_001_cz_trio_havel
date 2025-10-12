<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderResult.ascx.cs" Inherits="ZASshop.NET.App_UserControls.OrderResult" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
                    <div class="RegForm">
                    <!-- pageDesc -->
                    <div class="pageDesc page-description">
                        <h1><asp:Literal ID="lh1" runat="server" Text="Děkujeme za váš nákup!" /></h1>

                        <p><asp:Literal ID="lDesc1" runat="server" Text="Vaše objednávka byla úspěšně přijata. Brzy ji začneme zpracovávat." /></p>

                        <asp:Panel ID="pDescription" runat="server" CssClass="page-description-text">
                            <p>
                                <asp:Literal ID="lStav" runat="server" Text="<%$ Resources: Resource, PageResultPageOrderTitleDesc %>" />
                                <asp:HyperLink ID="hpStav" runat="server" Text="<%$ Resources: Resource, AddressDescriptionAddressUrlTitle %>" />
                            </p>
                            <asp:Panel ID="pHttpCall" runat="server" />

                            <asp:Panel ID="pGoPayRedirect" runat="server" />
                        </asp:Panel>

                        <p><asp:Literal ID="lDesc2" runat="server" Text="Chráníme lidské zdraví při práci." /></p>

                        <p><strong>Sledujte nás na sociálních sítích.</strong></p>
                        <p class="footer-facebook"><a href="https://www.facebook.com/TRIO-HAVEL-sro-231309815578/?hc_ref=ARShfzA9WCbB-ubHIuVgyjrKfkuSIXdqDWy0WbnS0lumEkqfkLCi-_DErXjDjxYeW5s&amp;fref=nf&amp;__xts__[0]=68.ARAopeMYilOGwLX2XdD_PlmXcoroPd2Qmhgv4ALEk_4MYhaSeANrb5g_glCfKcTSkFa6R1F7jY4PY10VccOR0hO_maR4VlmsP4Yu1EzAzECmMJmC098iiZLE6uA-oRqH3ngebPiygmUbFvwzb5nthqz_RpYF01DU8MP2rbpJ5fucw5N4MZL97IoiqJjJHF13zpgzwCkGx32je1SrYV0qp_a7JeUHzTJUudlxpiea7QVTuWCzuTBHDNr3RcwRAo9Ej8vshCgvOon9heSesU9HmVYwvQ2X9DR8O5iMw-pPKd3tzZtrssYonkbS3eSGmI_Qv7eB1OrLE_U8P-hlK2Ge&amp;__tn__=kC-R"><i class="fa fa-facebook" aria-hidden="true"></i></a></p>
                        <p class="footer-instagram"><a href="https://www.instagram.com/triohavel/"><i class="fa fa-instagram" aria-hidden="true"></i></a></p>
                        <p class="footer-linkedin"><a href="https://cz.linkedin.com/company/trio-havel-s-r-o"><i class="fa fa-linkedin" aria-hidden="true"></i></a></p>
                        <br />
                    </div>
                    <!-- /pageDesc -->

                    <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />
                </div>
</asp:Panel>