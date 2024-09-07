<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VASR_WEB.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="login-container">
        <div class="row">
            <div class="image-container">
                <img src="../img/V2X_Color.png"/>
            </div>

            <div class="hr-container">
                <hr />
            </div>

            <div class="login-panel col-md-3">
                <section id="loginForm">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819); border: none; box-shadow: 0 .8rem 1.5rem -.4rem #000000">
                            <h3 class="panel-title"><strong>Sign In </strong></h3>
                        </div>
                        <div class="panel-body">
                            <div class="panel-content form-horizontal">
                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="FailureText" />
                                    </p>
                                </asp:PlaceHolder>
                                <div class="email-and-password">
                                    <div class="email-container form-group">
                                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-1 control-label"></asp:Label>
                                        <div class="email-container-inner col-md-10">
                                            <label for="Email">Username or Email</label>
                                            <asp:TextBox runat="server" ID="Email" placeholder="Email or Username" CssClass="form-control" TextMode="Email" style=" box-shadow: .5rem .5rem 1rem 0 #000000;  background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819); border: none"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                CssClass="text-danger" ErrorMessage="The email field is required." />
                                        </div>
                                    </div>
                                    <div class="password-container form-group">
                                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-1 control-label"></asp:Label>
                                        <div class="password-container-inner col-md-10">
                                            <label for="Password">Password</label>
                                            <asp:TextBox runat="server" ID="Password" placeholder="Password" TextMode="Password" CssClass="form-control" style=" box-shadow: .5rem .5rem 1rem 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819); border: none"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                        </div>
                                    </div>
                                </div>
                                <div class="login-footer">
                                    <div class="login-footer-inner form-group">
                                        <div class="checkbox-inner col-md-offset-2 col-md-10">
                                            <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="RememberMe" />
                                                <asp:Label style="display:contents" runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                                <p class="developer-login">Developer Login: &nbsp; imdvehicle.dispatch@vectrus.com &nbsp;ImdCpc@2020</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="login-button-container form-group">
                                        <div class="login-button-inner col-md-offset-8 col-md-10">
                                            <asp:Button class="login-button" runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
<%-->>>>>  Animations  >>>>>--%>

    <style>
/*        #loginForm{
            transition: opacity 1s, transform 1s;
            opacity: 0;
            transform: translateY(-50px);
        }*/

            /*<<<<<-----  Full-Site  ----->>>>>*/

            .body-container{
                display: flex;
            }
            .login-container{
                width: 100%;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .row{
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            img{
                width: 48.7rem;
                height: 16.3rem;
                opacity: .9;
            }
            .image-container, .image-container-inner{
                width: fit-content;
            }
            .hr-container{
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                margin: 0 5.5rem;
            }
            .hr-container > hr{
                border: none;
                height: 55dvh;
                width: .2rem;
                background-color: rgba(59,141,65,.819);
                box-shadow: 0 0 1rem .2rem #000000;
            }
            .login-panel{
                max-width: 33rem;
            }
            .panel-default{
                box-shadow: 0 0 1rem 0 #000000;
                border: none;
                background-color: rgba(0, 1, 1, .819);
                color: rgba(59,141,65,.819);
            }
            

            /*<<<<<-----  Mobile-Site(Nest Hub Max 1280x800)  ----->>>>>*/

        @media screen and (max-width: 1368px){
            .pulse-home {
                animation: pulse 3s infinite;
            }


        }
    </style>


<%--<script type="text/javascript">
    function animateElements() {
        // Animate and fade out the sign-in panel
        var loginPanel = document.getElementById('<%= loginForm.ClientID %>');
        loginPanel.style.transition = 'opacity 1s, transform 1s';
        loginPanel.style.opacity = '0';
        loginPanel.style.transform = 'translateY(-50px)';

        // Animate and fade out the HR element
        var hrElement = document.querySelector('hr');
        hrElement.style.transition = 'opacity 1s, transform 1s';
        hrElement.style.opacity = '0';
        hrElement.style.transform = 'translateY(-50px)';

        // Center and fade out the V2X image
        var v2xImage = document.querySelector('img[src$="V2X_Color.png"]');
        v2xImage.style.transition = 'opacity 1s, transform 1s';
        v2xImage.style.opacity = '0';
        v2xImage.style.transform = 'translate(-50%, -50%) scale(1.2)';
        v2xImage.style.position = 'absolute';
        v2xImage.style.left = '50%';
        v2xImage.style.top = '50%';
    }
</script>--%>


</asp:Content>
