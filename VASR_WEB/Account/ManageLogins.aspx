<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageLogins.aspx.cs" Inherits="VASR_WEB.Account.ManageLogins" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="manage-login-container">
        <div class="manage-login-page">
            <h2>Manage your external logins.</h2>
            <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                    <p class="text-success"><%: SuccessMessage %></p>
                </asp:PlaceHolder>
            <div>
                <section id="externalLoginsForm">

                    <asp:ListView runat="server"
                        ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                        SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                        <LayoutTemplate>
                            <h4>Registered Logins</h4>
                            <table class="table">
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>

                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#: Item.LoginProvider %></td>
                                <td>
                                    <asp:Button runat="server" Text="Remove" CommandName="Delete" CausesValidation="false"
                                        ToolTip='<%# "Remove this " + Item.LoginProvider + " login from your account" %>'
                                        Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>

                </section>
            </div>

            <div>
                <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/ManageLogins" />
            </div>
        </div>
    </div>

    <style>
        .manage-login-container{
            width: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .manage-login-page{
            width: 66%
        }
        hr{
            border: none;
            height: 2px;
            background-color: rgba(59,141,65,.819);
            box-shadow: 0 0 10px 1px #000000;
        }

        @media screen and (max-width: 1368px){
            .pulse-account{
                animation: pulse 3s infinite;
            }
        }
    </style>
</asp:Content>
