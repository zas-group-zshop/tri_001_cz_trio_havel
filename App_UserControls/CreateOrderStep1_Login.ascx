<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateOrderStep1_Login.ascx.cs" Inherits="ZASshop.NET.App_UserControls.CreateOrderStep1_Login" EnableViewState="false" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
    <asp:Panel ID="loginPanelFbGo" runat="server" CssClass="orderHeader order-box">
        <div>
            <asp:Literal ID="lFbGo" runat="server" Text="<%$ Resources: Resource, LoginViaFbGoLabel %>"></asp:Literal>:

            <asp:Label ID="loginPhFB" runat="server">
                <div class="fb-login-btn">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                    <asp:HyperLink ID="hlFacebookLogin" runat="server" CssClass="login-ext-link fbLoginButton" Text="<%$ Resources: Resource, LoginViaFacebook %>" />
                </div>
            </asp:Label>

            <asp:Label ID="loginPhGo" runat="server">
                <div class="fb-login-btn">
                    <i class="fa fa-google-plus" aria-hidden="true"></i>
                    <asp:HyperLink ID="hlGoogleLogin" runat="server" CssClass="login-ext-link google-plus goTextLoginButton" Text="<%$ Resources: Resource, LoginViaGoogle %>" />
                </div>
            </asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false">

        <asp:Panel ID="pErrorMessageNoRegError" runat="server" CssClass="pageCustomErrorNoReg" Visible="false">
            <p>
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, RegistraceExistEmail1 %>" /><br />
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, RegistraceExistEmail2 %>" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/" + ZASshop.NET.Resources.Resource.PageLostData %>'><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, PageLostDataTitle %>" /></asp:HyperLink> <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, RegistraceExistEmail3 %>" />
            </p>
        </asp:Panel>
    </asp:Panel>

	<!-- orderLogin -->
	<div class="orderLogin order-box order-login">
		<h2 class="h1"><asp:Literal ID="lAlreadyRegistered" runat="server" Text="Již jsem registrovaný zákazník" /></h2>
		<p><asp:Literal ID="lAlreadyRegisteredDescription" runat="server" Text="<%$ Resources: Resource, AlreadyRegisteredDescription %>" /></p>
							
		<div class="RegForm form-inline">
			<div class="formRow">
                <span class="formLabel">
                    <asp:Label ID="lEmail" runat="server" Text="<%$ Resources: Resource, E_mail %>" Font-Bold="true"></asp:Label>
                    <asp:Label ID="lEmailReq" runat="server" Text="*" Font-Bold="true" />
                </span>
                <zas:ZasTextBox ID="login_e_mail" runat="server" DetailMode="Insert" Type="Email" AutoCompleteType="Email" CssClass="form-control" />
                    <asp:FilteredTextBoxExtender ID="f_login_e_mail" runat="server"
                        TargetControlID="login_e_mail"
                        FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                        ValidChars="@._-" />
                    <asp:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                        TargetControlID="login_e_mail"
                        WatermarkText="<%$ Resources: Resource, EmailWaterMark %>" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="login_e_mail"
                        ErrorMessage="<%$ Resources: Resource, E_mailRequired %>" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="login_e_mail"
                        ValidationExpression="[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)+"
                        ErrorMessage="<%$ Resources: Resource, E_mailWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Login" />
			</div>
			<div class="formRow">
                <span class="formLabel">
                    <asp:Label ID="lPassword" runat="server" Text="<%$ Resources: Resource, Password %>" Font-Bold="true"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="*" Font-Bold="true" />
                </span>
                <zas:ZasTextBox ID="login_heslo" runat="server" TextMode="Password" DetailMode="Insert" Type="Text" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="login_heslo"
                        ErrorMessage="<%$ Resources: Resource, PasswordRequired %>" ValidationGroup="Login">*</asp:RequiredFieldValidator>
			</div>
		</div>			
        
		<div class="orderButtons">
            <asp:Button ID="btnLoginLoginDo" runat="server" 
                Text="<%$ Resources: Resource, LoginLoginDo %>" CssClass="button gray btn btn-basic"
                ValidationGroup="Login" onclick="btnLoginLoginDo_Click" />
		</div>

        <asp:HyperLink ID="hpLostPass" runat="server" Text="<%$ Resources: Resource, LoginLostData %>" />
	</div>
	<!-- /orderLogin -->
					
	<!-- orderReg -->
	<div class="orderReg1 order-box order-login">
			<h2 class="h1"><asp:Literal ID="lNotRegistered" runat="server" Text="Nejsem registrovaný zákazník" /></h2>
			<p><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, NotRegisteredDescription1 %>" /></p>
			<p><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, NotRegisteredDescription2 %>" /></p>
			<p><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, NotRegisteredDescription3 %>" /></p>
			
            <div class="RegForm form-inline">
				<div class="formRow">
					<span class="formLabel">
                        <asp:Label ID="lEmailReg" runat="server" Text="<%$ Resources: Resource, E_mail %>" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lEmailRegReq" runat="server" Text="*" Font-Bold="true" />
                    </span>
                    <zas:ZasTextBox ID="registrace_e_mail" runat="server" DetailMode="Insert" Type="Email" AutoCompleteType="Email" CssClass="form-control" />
                        <asp:FilteredTextBoxExtender ID="f_registrace_e_mail" runat="server"
                            TargetControlID="registrace_e_mail"
                            FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                            ValidChars="@._-" />
                        <asp:TextBoxWatermarkExtender ID="tbweEmailReg" runat="server"
                            TargetControlID="registrace_e_mail"
                            WatermarkText="<%$ Resources: Resource, EmailWaterMark %>" />
                        <asp:RequiredFieldValidator ID="rfvEmailReg" runat="server"
                            ControlToValidate="registrace_e_mail"
                            ErrorMessage="<%$ Resources: Resource, E_mailRequired %>" ValidationGroup="Registration">Prosíme o zadání Vašeho e-mailu.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmailReg" runat="server"
                            ControlToValidate="registrace_e_mail"
                            ValidationExpression="[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)+"
                            ErrorMessage="<%$ Resources: Resource, E_mailWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Registration" />
				</div>
			</div>

			<div class="orderButtons">
                <asp:Button ID="btnCreateOrderWithNoReg" runat="server" 
                    Text="<%$ Resources: Resource, CreateOrderWithNoReg %>" CssClass="button gray btn btn-default" 
                    ValidationGroup="Registration" onclick="btnCreateOrderWithNoReg_Click" />
                <asp:Button ID="btnRegistrationRegistrationDo" runat="server" 
                    Text="<%$ Resources: Resource, RegistrationRegistrationDo %>" 
                    CssClass="button gray btn btn-basic" ValidationGroup="Registration" 
                    onclick="btnRegistrationRegistrationDo_Click"/>
			</div>
	</div>
	<!-- /orderReg -->
</asp:Panel>