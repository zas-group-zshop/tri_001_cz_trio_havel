<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="ZASshop.NET.RegistrationPage" %>

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
            <asp:PlaceHolder ID="phRegistration" runat="server">
                <div class="RegForm">
                    <!-- pageDesc -->
                    <div class="pageDesc page-description">
                        <h1><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, PageRegistrationTitle %>"></asp:Literal></h1>
                        <asp:Panel ID="pDescription" runat="server" CssClass="page-description-text" />
                    </div>
                    <!-- /pageDesc -->

                    <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />

                    <asp:Panel ID="pRegistration" runat="server">
                        <!-- loginDataForm -->
                        <div class="loginDataForm">
                            
                            <div class="formRow">
                                <span class="formLabel">
                                    <asp:Label ID="lEmail" runat="server" Text="<%$ Resources: Resource, E_mail %>" Font-Bold="true"></asp:Label>
                                    <asp:Label ID="lEmailReq" runat="server" Text="*" Font-Bold="true" />
                                </span>
                                <zas:ZasTextBox ID="registrace_e_mail" runat="server" DetailMode="Insert" Type="Email" AutoCompleteType="Email" CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="f_registrace_e_mail" runat="server"
                                        TargetControlID="registrace_e_mail"
                                        FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                        ValidChars="@._-" />
                                    <asp:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                                        TargetControlID="registrace_e_mail"
                                        WatermarkText="<%$ Resources: Resource, EmailWaterMark %>" />
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                        ControlToValidate="registrace_e_mail"
                                        ErrorMessage="<%$ Resources: Resource, E_mailRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                        ControlToValidate="registrace_e_mail"
                                        ValidationExpression="[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)+"
                                        ErrorMessage="<%$ Resources: Resource, E_mailWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Registration" />
                            </div>
                            
                            <div class="formRow">
                                <span class="formLabel">
                                    <asp:Label ID="lPassword" runat="server" Text="<%$ Resources: Resource, Password %>" Font-Bold="true"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text="*" Font-Bold="true" />
                                </span>
                                <zas:ZasTextBox ID="registrace_heslo" runat="server" TextMode="Password" DetailMode="Insert" Type="Text" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                        ControlToValidate="registrace_heslo"
                                        ErrorMessage="<%$ Resources: Resource, PasswordRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="formRow">
                                <span class="formLabel">
                                    <asp:Label ID="lPasswordCheck" runat="server" Text="<%$ Resources: Resource, PasswordCheck %>" Font-Bold="true"></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text="*" Font-Bold="true" />
                                </span>
                                <zas:ZasTextBox ID="registrace_heslo_check" runat="server" TextMode="Password" DetailMode="Insert" Type="Text" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="rfvPasswordCheck" runat="server"
                                        ControlToValidate="registrace_heslo_check"
                                        ErrorMessage="<%$ Resources: Resource, PasswordCheckRequired %>" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvPasswordCheck" runat="server"
                                        ControlToCompare="registrace_heslo" ControlToValidate="registrace_heslo_check" Operator="Equal" SetFocusOnError="true" Type="String" ValidationGroup="Registration"
                                        Display="Dynamic"
                                        ErrorMessage="<%$ Resources: Resource, PasswordCheckError %>" />
                            </div>
                            
                        </div>
                        <!-- /loginDataForm -->
                        
                        <asp:PlaceHolder ID="RegistrationPlaceHolder" runat="server"></asp:PlaceHolder>
                        <div class="clear"></div>
                    </asp:Panel>

                    <!-- pageDescEnd -->
                    <div class="pageDesc">
                        <asp:Panel ID="pDescriptionEnd" runat="server">
                            <p>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:  Resource, LostPassQ1 %>" /> <br />
                                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:  Resource, LostPassQ2 %>" /> <br />
                                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:  Resource, LostPassPage1 %>" /> 
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/" + ZASshop.NET.Resources.Resource.PageLostData %>' Text="<%$ Resources: Resource, LostPassPage2 %>" />
                            </p>
                        </asp:Panel>
                    </div>
                    <!-- /pageDescEnd -->
                    
                    <div class="formRow">
                        <asp:CheckBox runat="server" ID="gdpr_souhlas" CssClass="gdpr_souhlas" ClientIDMode="Static" data-required="true" /><label>&nbsp;Souhlasím se zpracováním <a href="/Page/cs-CZ/18/obchodni-podminky#IX">osobních údajů</a>.</label>
                    </div>

                    <div class="regButtons">
                        <asp:Button ID="btRegistration" runat="server" Text="<%$ Resources: Resource, RegistraceBtn %>"  ValidationGroup="Registration" onclick="btRegistration_Click" CssClass="btn btn-basic btn-registrace" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:Panel ID="AfterInsertIntoBasketAction_Panel" runat="server">
                <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control" />
                <asp:ModalPopupExtender ID="AfterInsertIntoBasketAction_mpe" runat="server"
                    TargetControlID="FakeBtnAction" PopupControlID="AfterInsertIntoBasketAction"
                    DropShadow="true" BackgroundCssClass="modal" CancelControlID="" />
                <asp:Panel ID="AfterInsertIntoBasketAction" runat="server" CssClass="modal-popup">
                    <!-- pageDesc -->
                    <div class="pageDesc modal-desc">
                        <div class="modal-title"><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, PageRegistrationTitle %>"></asp:Literal></div>
                        <asp:Panel ID="Panel1" runat="server" CssClass="">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, PageRegistrationSuccessInfo %>" />
                        </asp:Panel>
                    </div>
                    <!-- /pageDesc -->

			        <!-- cartButtons -->
			        <div class="cartButtons modal-buttons">
                        <asp:HyperLink ID="hlAfterBasket" CssClass="button btn btn-basic btn-sm"  runat="server" Text="<%$ Resources: Resource, BtnContinue %>" />
			        </div>
			        <!-- /cartButtons -->
                </asp:Panel>
            </asp:Panel>

<script type="text/javascript">
    function MyFunction() {
        EnableBtn();

        $('.gdpr_souhlas').click(function () {
            EnableBtn();
        });

        function EnableBtn() {
            if ($('#gdpr_souhlas').is(':checked'))
                $('.btn-registrace').removeAttr('disabled');
            else
                $('.btn-registrace').attr('disabled', 'disabled');
        }
    }
    $(document).ready(MyFunction);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(MyFunction);
</script>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



