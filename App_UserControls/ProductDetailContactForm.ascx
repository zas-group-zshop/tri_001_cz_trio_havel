<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailContactForm.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailContactForm" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Panel runat="server">
<!-- contactForm -->
<div class="product-contact-form">
    <h2><asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, ContactFormTitle %>" /></h2>

    <div class="contactForm">
        <p><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, ContactFormDesc1 %>" /></p>
        <p><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, ContactFormDesc2 %>" /></p>
        <form action="" method="post">
            <fieldset>
                <div class="row">
                    <div class="col-sm-6">    
                        <!-- contactLeft -->
                        <div class="contactLeft">
                            <div class="formRow">
                                <label><asp:Literal ID="l1" runat="server" Text="<%$ Resources: Resource, ContactFormName %>" />:</label>
                                <asp:TextBox ID="kf_jmeno" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-kf"
                                    ControlToValidate="kf_jmeno" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                            </div>

                            <!-- contactRight -->
                            <div class="contactRight">
                                <div class="formRow">
                                    <label><asp:Literal ID="l3" runat="server" Text="<%$ Resources: Resource, ContactFormEmail %>" />:</label>
                                    <asp:TextBox ID="kf_email" runat="server" CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="f_kf_email" runat="server"
                                        TargetControlID="kf_email"
                                        FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                        ValidChars="@._-" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-kf" 
                                        ControlToValidate="kf_email" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                        ControlToValidate="kf_email"
                                        ValidationExpression="[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)+"
                                        ErrorMessage="<%$ Resources: Resource, E_mailWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="save-kf" />
                                </div>
                                <div class="formRow">
                                    <label><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, ContactFormPhone %>" />:</label>
                                    <asp:TextBox ID="kf_telefon" runat="server" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-kf" 
                                        ControlToValidate="kf_telefon" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                                </div>
                            </div>
                            <!-- /contactRight -->

                        </div>
                        <!-- /contactLeft -->
                    </div>
                    <div class="col-sm-6">
                            <div class="formRow textarea">
                                <label><asp:Literal ID="l5" runat="server" Text="<%$ Resources: Resource, ContactFormBody %>" />:</label>
                                <asp:TextBox ID="kf_zprava" runat="server" Columns="500" Rows="5" TextMode="MultiLine" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-kf" 
                                    ControlToValidate="kf_zprava" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                            </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="contact-form-buttons">
                            <asp:Button ID="btnKfSave" runat="server" CssClass="button gray btn btn-basic" 
                                Text="<%$ Resources: Resource, ContactFormSave %>" ValidationGroup="save-kf" 
                                onclick="btnKfSave_Click" />
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<!-- /contactForm -->

<asp:Panel ID="AfterAction_Panel" runat="server">
    <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control" />
    <asp:ModalPopupExtender ID="AfterAction_mpe" runat="server"
        TargetControlID="FakeBtnAction" PopupControlID="AfterAction"
        DropShadow="true" BackgroundCssClass="modal" />
    <asp:Panel ID="AfterAction" runat="server" CssClass="modal-popup">
        <!-- pageDesc -->
        <div class="pageDesc">
            <h2><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, ContactFormTitle %>"></asp:Literal></h2>
            <asp:Panel ID="pDescription" runat="server">
                <br />
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, ContactFormFeedback1 %>" />
                <br /><br />
                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, ContactFormFeedback2 %>" />
                <br />
                <br /><br />
            </asp:Panel>
        </div>
        <!-- /pageDesc -->

        <!-- cartButtons -->
        <div class="cartButtons">
            <asp:HyperLink ID="hlAfterBack" CssClass="button w" runat="server" Text="<%$ Resources: Resource, CloseWindow %>" />
        </div>
        <!-- /cartButtons -->
    </asp:Panel>
</asp:Panel>
</asp:Panel>
