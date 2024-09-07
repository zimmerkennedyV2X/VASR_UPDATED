<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VASR_WEB.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="register-container">
        <div class="register-page">
            <h2><%: Title %>.</h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>

            <div class="form-horizontal" style="margin: 0 0 27.1rem 0">
                <h4>Create a new account</h4>
                <hr style=" border: none; height: .2rem; background-color: rgba(59,141,65,.819); box-shadow: 0 0 1rem .2rem #000000" />
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email"  style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control"  style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="DDL_Role" CssClass="col-md-2 control-label">Role</asp:Label>

                    <div class="col-md-10">
                        <asp:DropDownList ID="DDL_Role" CssClass="form-control" Width="280px" runat="server" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                            <asp:ListItem Value="">- Select Role -</asp:ListItem>
                            <asp:ListItem Value="Managers">Managers</asp:ListItem>
                            <asp:ListItem Value="IMD Admin">IMD Admin</asp:ListItem>
                            <asp:ListItem Value="Master Driver">Master Driver</asp:ListItem>
                            <asp:ListItem Value="Dept. Manager">Dept. Manager</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DDL_Role"
                            CssClass="text-danger" ErrorMessage="The role field is required." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="DDL_Department" CssClass="col-md-2 control-label">Department</asp:Label>

                    <div class="col-md-10">
                        <asp:DropDownList ID="DDL_Department" CssClass="form-control" Width="280px" runat="server" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                            <asp:ListItem Value="">- Select Department -</asp:ListItem>
                            <asp:ListItem Value="ASD">ASD</asp:ListItem>
                            <asp:ListItem Value="AVD">AVD</asp:ListItem>
                            <asp:ListItem Value="PMD">PMD</asp:ListItem>
                            <asp:ListItem Value="IM">IM</asp:ListItem>
                            <asp:ListItem Value="SSD">SSD</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DDL_Department"
                            CssClass="text-danger" ErrorMessage="The department field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(59,141,65,.819)" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .register-container{
            width: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .register-page{
            width: 66%;
        }

        @media screen and (max-width: 1368px){
            .pulse-register {
                animation: pulse 3s infinite;
            }
        }
    </style>
</asp:Content>
