<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuperAdminDashboard.aspx.cs" Inherits="VASR_WEB.SuperAdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="super-admin-dash-container">
        <div class="super-admin-dash-page">
            <h2>Application Admin Dashboard</h2>

            <hr style="width: 100%; border: none; height: 2px; background-color: rgba(59,141,65,.819); box-shadow: 0 0 10px 1px #000000" />

            <div class="row" runat="server" visible="false">
                <h5>Add a Role</h5>
                <h6 style="color: red">*Add a New Role</h6>
                <asp:TextBox ID="txtRole" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-sm" Text="Add a New Role" OnClick="Button1_Click" />
                <h3 id="admin_name" runat="server"></h3>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <div class="well well-sm text-center" style="box-shadow: 0 0 10px 2px #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                        <h5 id="H1" runat="server">Add a Manager</h5>
                        <h5 id="roleAdmin" runat="server"></h5>
                        <h6 style="color: red"><small>*Enter the email address of the new manager</small></h6>

                        <div class="text-center">
                            <asp:TextBox ID="txtManagerEmail" runat="server" CssClass="form-control" placeholder="Email Address" style="box-shadow: 5px 5px 10px 0 #000000;  background-color: rgba(0, 1, 1, .7); border: none"></asp:TextBox>
                        </div>

                        <div class="text-right" style="padding-top: 3px;">
                            <asp:Button ID="btnAddtoManager" runat="server" CssClass="btn btn-primary btn-sm " Text="Add a Manager" OnClick="btnAddtoManager_Click" style="box-shadow: 5px 5px 10px 0 #000000; margin-top: 10px; background-color: rgba(5,28,60,.819); border: none"/>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="well well-sm text-center" style="box-shadow: 0 0 10px 2px #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                        <h5 id="H2" runat="server">Add a Master Driver</h5>
                        <h5 id="H3" runat="server"></h5>
                        <h6 style="color: red"><small>*Enter the email address of the new master driver</small></h6>

                        <div class="text-center">
                            <asp:TextBox ID="txtMasterDriverEmail" runat="server" CssClass="form-control" placeholder="Email Address" style="box-shadow: 5px 5px 10px 0 #000000; box-shadow: 5px 5px 10px 0 rgba(0, 1, 1, .9);  background-color: rgba(0, 1, 1, .7); border: none"></asp:TextBox>
                        </div>

                        <div class="text-right" style="padding-top: 3px;">
                            <asp:Button ID="btnAddtoMasterDriver" runat="server" CssClass="btn btn-primary btn-sm " Text="Add a Master Driver" OnClick="btnAddtoMasterDriver_Click" style="box-shadow: 5px 5px 10px 0 #000000; margin-top: 10px; background-color: rgba(5,28,60,.819); border: none"/>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="well well-sm text-center" style="box-shadow: 0 0 10px 2px #000000; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                        <h5 id="H4" runat="server">Add an IMD Admin</h5>
                        <h5 id="H5" runat="server"></h5>
                        <h6 style="color: red"><small>*Enter the email address of the new admin</small></h6>

                        <div class="text-center">
                            <asp:TextBox ID="txtIMDAdminEmail" runat="server" CssClass="form-control" placeholder="Email Address" style=" box-shadow: 5px 5px 10px 0 #000000;  background-color: rgba(0, 1, 1, .7); border: none"></asp:TextBox>
                        </div>

                        <div class="text-right" style="padding-top: 3px;">
                            <asp:Button ID="btnAddtoIMDAdmin" runat="server" CssClass="btn btn-primary btn-sm " Text="Add an IMD Admin" OnClick="btnAddtoIMDAdmin_Click" style="box-shadow: 5px 5px 10px 0 #000000; margin-top: 10px; background-color: rgba(5,28,60,.819); border: none"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="width: 100%;">
                <h3 style="padding-left: 10px"><strong>VASR Application Users </strong> </h3>
                <asp:ListView ID="lvUserRoles" runat="server" DataSourceID="SqlDataSource1">
 
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="admin-table" runat="server" style="width:100%">
                            <tr runat="server" style="">
                                <td class="super-admin-table" runat="server">
                                    <table id="itemPlaceholderContainer"  class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 2px rgba(0, 1, 1, .9);">
                                        <tr runat="server" style="background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                                            <th runat="server">Email</th>
                                            <th runat="server">Role</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT AspNetUsers.Email, AspNetRoles.Name FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <style>
        .super-admin-dash-container{
            width: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .super-admin-dash-page{
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content:center;
            align-items: center;
        }

        @media screen and (max-width: 1368px){
            .pulse-super-admin {
                animation: pulse 3s infinite;
            }

        }

        @media screen and (max-width: 600px){
            .super-admin-table{
                width: 65%
            } 
            .super-admin-dash-container{
                display: flex;
                flex-direction: column;
                justify-content:center;
                align-items: center;
            }
            .admin-table{
                display: flex;
                justify-content: center;
                align-items: center;
            }
        }
    </style>
</asp:Content>
