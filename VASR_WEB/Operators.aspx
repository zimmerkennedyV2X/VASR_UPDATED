﻿<%@ Page Title="Operators" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operators.aspx.cs" Inherits="VASR_WEB.Operators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="operator-container row">
        <div class="operator-page">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#all" data-toggle="tab" aria-expanded="true">All</a></li>
                <li class=""><a href="#30days" data-toggle="tab" aria-expanded="false">Expires in 30 Days or Less</a></li>
                <li class=""><a href="#expired" data-toggle="tab" aria-expanded="false">Expired</a></li>
                <li class=""><a href="#inactive" data-toggle="tab" aria-expanded="false">Inactive</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="all">

                        <br />

                        <div class="search-header row">
                            <small>Search Operator by</small>
                            <div class="search-operator-container" style="display: flex; justify-content: space-between; align-items: center">
                                <div class="search-operator form-inline">
                                    <asp:DropDownList CssClass="form-control" ID="operatorSearchSelector" runat="server" Width="220" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);">
                                        <asp:ListItem Text="Name" />
                                        <asp:ListItem Text="License Number" />
                                        <asp:ListItem Text="Section" />
                                        <asp:ListItem Text="Location" />
                                    </asp:DropDownList>

                                    <asp:TextBox ID="txtfilterOperators" placeholder="Enter Number" runat="server" CssClass="form-control" OnTextChanged="txtfilterOperators_TextChanged" AutoPostBack="true" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);"></asp:TextBox>
                                    <asp:Button ID="btnSearchOperator" runat="server" Text="Search Operator" CssClass="btn btn-primary" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(5,28,60,.8)"/>
                                </div>

                                <div class="add-operator-buttons form-inline text-right">
                                    <asp:Button ID="btnAddOperator" runat="server" CssClass="btn btn-success btn-sm " Text="Add New Operator" OnClick="btnAddOperator_Click" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(59,141,65,.819);"/>
                                    <asp:Button ID="btnExportOperators" OnClick="btnExportOperators_Click" runat="server" CssClass="btn btn-default btn-sm " Text="Export Operator List to Excel" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(59,141,65,.819);"/>
                                </div>
                            </div>

                            <div class="col-md-6 text-center" style="width: 100%; display: flex; justify-content: center; align-items: center">
                               <div>
                                    <div style="display: flex; justify-content: center; align-items: center">
                                        <h5 style="font-weight: bold">What can you drive? <br /> Quick License Code Guide</h5>
                                    </div>

                                    <ul class="list-inline">
                                        <li>1 - NTV                  </li>
                                        <li>2 - Pick Up              </li>
                                        <li>3 - Cargo Van            </li>
                                        <li>4 - Canter               </li>
                                        <li>5 - Commercial Truck     </li>
                                        <li>6 - Heavy License/KDL    </li>
                                        <li>7 - Heavy Equipment    </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <br />

                        <asp:ListView ID="ListViewOperatorsAll" runat="server" DataKeyNames="ID">
                            <EmptyDataTemplate>
                                <table runat="server">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                    <td>
                                        <a href="/OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-sm" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;Open</a>
                                    </td>
                                    <td class="fullsite-operators">
                                        <a href="#" > <%# Eval("OperatorNum") %></a>
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Section") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td class="phone">
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("OperatorLicenseCode") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
                                    <td class="<%# GetStatusColor(Eval("OperatorStatus"))  %>">
                                        <span class="glyphicon glyphicon-flag"></span>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToBoolean(Eval("OperatorStatus")) ? "Authorized" : "Inactive" %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td class="all-operators-table" runat="server">
                                            <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                                <thead>
                                                    <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">
                                                        <th runat="server">Open Profile</th>
                                                        <th class="fullsite-operators" runat="server">License No.</th>
                                                        <th runat="server">Operator Name</th>
                                                        <th class="fullsite-operators" runat="server">Section</th>
                                                        <th class="fullsite-operators" runat="server">Issue Date</th>
                                                        <th class="phone" runat="server">Expiry Date</th>
                                                        <th>License Code </th>
                                                        <th class="fullsite-operators" runat="server">Location</th>
                                                        <th runat="server">Status</th>
                                                        <th runat="server" visible="false">ID</th>
                                                    </tr>
                                                </thead>
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
                        </asp:ListView>
                    </div>

                    <div class="tab-pane fade" id="30days">
                        <asp:ListView ID="ListView30Expire" runat="server" DataKeyNames="ID">
                            <AlternatingItemTemplate>
                                <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                    <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs" style="background-color: rgba(29,104,162,.819); border: 2px solid rgba(29,104,162,.7); box-shadow: 0 0 10px 2px rgba(29,104,162,.819)">Edit</a> </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
    <%--                                <td>
                                        <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>--%>
                                </tr>
                            </AlternatingItemTemplate>

                            <EmptyDataTemplate>
                                <table runat="server">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                    <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs" style="background-color: rgba(29,104,162,.819); border: 2px solid rgba(29,104,162,.7); box-shadow: 0 0 10px 2px rgba(29,104,162,.819)">Edit</a> </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
    <%--                                <td>
                                        <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                </tr>--%>
                            </ItemTemplate>

                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                                <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">
                                                    <th runat="server">Action</th>
                                                    <th class="fullsite-operators" runat="server">License No. </th>
                                                    <th runat="server">Operator Name</th>
                                                    <th class="fullsite-operators" runat="server">Issue Date</th>
                                                    <th runat="server">Expiry Date</th>
                                                    <th class="fullsite-operators" runat="server">Location</th>
                                                    <th runat="server" visible="false">ID</th>
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
                        </asp:ListView>
                    </div>

                    <div class="tab-pane fade" id="expired">
                        <asp:ListView ID="ListViewExpired" runat="server" DataKeyNames="ID">
                            <AlternatingItemTemplate>
                                <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                    <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs" style="background-color: rgba(29,104,162,.819); border: 2px solid rgba(29,104,162,.7); box-shadow: 0 0 10px 2px rgba(29,104,162,.819)">Edit</a> </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td >
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
    <%--                                <td>
                                        <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>--%>
                                </tr>
                            </AlternatingItemTemplate>

                            <EmptyDataTemplate>
                                <table runat="server">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                    <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs" style="background-color: rgba(29,104,162,.819); border: 2px solid rgba(29,104,162,.7); box-shadow: 0 0 10px 2px rgba(29,104,162,.819)">Edit</a> </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
    <%--                                <td>
                                        <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>--%>
                                </tr>
                            </ItemTemplate>

                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                                <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">
                                                    <th runat="server">Action</th>
                                                    <th class="fullsite-operators" runat="server">License No. </th>
                                                    <th runat="server">Operator Name</th>
                                                    <th class="fullsite-operators" runat="server">Issue Date</th>
                                                    <th runat="server">Expiry Date</th>
                                                    <th class="fullsite-operators" runat="server">Location</th>
                                                    <th runat="server" visible="false">ID</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style=""></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>

                    <div class="tab-pane fade" id="inactive">
                        <asp:ListView ID="ListViewInactive" runat="server" DataKeyNames="ID">
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
                                        <a href="/OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-sm" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;Open</a>
                                    </td>
                                    <td class="fullsite-operators">
                                        <a href="#" > <%# Eval("OperatorNum") %></a>
                                    </td>
                                    <td>
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Section") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                    </td>
                                    <td class="phone">
                                        <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("OperatorLicenseCode") %>' />
                                    </td>
                                    <td class="fullsite-operators">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Location") %>' />
                                    </td>
                                    <td class="<%# GetStatusColor(Eval("OperatorStatus"))  %>">
                                        <span class="glyphicon glyphicon-flag"></span>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToBoolean(Eval("OperatorStatus")) ? "Authorized" : "Inactive" %>' />
                                    </td>
    <%--                                <td>
                                        <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>--%>
                                </tr>
                            </ItemTemplate>

                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                                <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">
                                                    <th runat="server">Open Profile</th>
                                                    <th class="fullsite-operators" runat="server">License No.</th>
                                                    <th runat="server">Operator Name</th>
                                                    <th class="fullsite-operators" runat="server">Section</th>
                                                    <th class="fullsite-operators" runat="server">Issue Date</th>
                                                    <th class="phone" runat="server">Expiry Date</th>
                                                    <th>License Code</th>
                                                    <th class="fullsite-operators" runat="server">Location</th>
                                                    <th runat="server">Status</th>
                                                    <th runat="server" visible="false">ID</th>
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
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>

    <%-->>>>>  Styling  >>>>>--%>
    <style>

        .operator-container{
            width: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .operator-page{
            width: 61%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        /*<<<<<  Tabs  >>>>>*/

        .nav-tabs{
            align-self: start;
        }
        .nav-tabs > li.active{
            box-shadow: 0 -4px 15px -4px #000000;
            text-shadow: 2px 2px 8px rgba(59,141,65, 0.9);
        }
        .nav-tabs > li.active > a[aria-expanded="true"]{
            background-color: rgba(0, 1, 1, .9);
            color: rgba(59,141,65,.819);
        }

        @media screen and (max-width: 1368px){
            .pulse-operators {
                animation: pulse 3s infinite;
            }
        }

        @media screen and (max-width: 912px){
            .fullsite-operators, .phone{
                display: none;
            }
            .add-operator-buttons{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .search-operator{
                display: flex;
                flex-direction: column;
                justify-content:space-between;
                align-content:center;
                gap: .7rem;
                padding-bottom: .7rem;
            }
            .all-operators-table{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .tab-content > .active{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
        }

        @media screen and (max-width: 600px){
            .phone{
                display: none;
            }
            .table{
                width: 61%;
            } 
            .search-operator-container{
                width: 61%;
                display: flex;
                flex-direction: column;
                justify-content:center;
                align-items: center;
            }
            .search-header{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;;
            }
        }
        </style>
</asp:Content>
