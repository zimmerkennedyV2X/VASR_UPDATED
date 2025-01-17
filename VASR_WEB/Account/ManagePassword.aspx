﻿<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="VASR_WEB.Account.ManagePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="manage-password-container">
        <div class="manage-password-page">
            <h2><%: Title %>.</h2>
            <div class="form-horizontal">
                <section id="passwordForm">
                    <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                        <p>
                            You do not have a local password for this site. Add a local
                                password so you can log in without an external login.
                        </p>
                        <div class="form-horizontal">
                            <h4>Set Password Form</h4>
                            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                            <hr style="border: none; height: 2px; background-color: rgba(59,141,65,.819); box-shadow: 0 0 10px 1px #000000"/>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"/>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                        CssClass="text-danger" ErrorMessage="The password field is required."
                                        Display="Dynamic" ValidationGroup="SetPassword" />
                                    <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                        CssClass="text-danger" SetFocusOnError="true" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"/>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                        ValidationGroup="SetPassword" />
                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                        ValidationGroup="SetPassword" />

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" style="box-shadow: 5px 5px 10px 0 #000000; border: none; background-color: rgba(59,141,65,.819)"/>
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                        <div class="form-horizontal">
                            <h4>Change Password Form</h4>
                            <hr style="border: none; height: 2px; background-color: rgba(59,141,65,.819); box-shadow: 0 0 10px 1px #000000"/>
                            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                            <div class="form-group">
                                <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"/>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                        CssClass="text-danger" ErrorMessage="The current password field is required."
                                        ValidationGroup="ChangePassword" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"/>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                        CssClass="text-danger" ErrorMessage="The new password is required."
                                        ValidationGroup="ChangePassword" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"/>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                        ValidationGroup="ChangePassword" />
                                    <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                        ValidationGroup="ChangePassword" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" style="box-shadow: 5px 5px 10px 0 #000000; border: none; background-color: rgba(59,141,65,.819)"/>
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </section>
            </div>
        </div>
    </div>

    <style>
        .manage-password-container{
            width: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .manage-password-page{
            width: 66%
        }

        @media screen and (max-width: 1368px){
            .pulse-account{
                animation: pulse 3s infinite;
            }
        }
    </style>
</asp:Content>
