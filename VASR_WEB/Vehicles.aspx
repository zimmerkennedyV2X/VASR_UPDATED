<%@ Page Title="Vehicles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="VASR_WEB.Vehicles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    <div class="row vehicles-container">
        <div class="vehicles-page">
            <ul class="nav nav-tabs">
                <li class="active" ><a href="#all" data-toggle="tab" aria-expanded="true">All Vehicles</a></li>
                <li class=""><a href="#30days" data-toggle="tab" aria-expanded="false">Registration Expires in 60 Days or Less</a></li>
                <li class=""><a href="#expired" data-toggle="tab" aria-expanded="false">Registration Expired</a></li>
                <li class=""><a href="#NonServicable" data-toggle="tab" aria-expanded="false">Non-Servicable</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="all-vehicles-tab tab-pane fade active in" id="all">

                    <br />
                    <small>Search Vehicle by</small>
                    <div class="search-vehicle-container row">
                        <div class="col-md-8">
                            <div class="search-vehicle-left form-inline">
                                <asp:DropDownList class="drop-down" CssClass="form-control" ID="vehicleSearchSelector" runat="server" Width="220" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);"><%--<<<<<  Add shadowing  <<<<<--%>
                                    <asp:ListItem Text="Admin Number" />
                                    <asp:ListItem Text="Plate Number" />
                                    <asp:ListItem Text="Department" />
                                    <asp:ListItem Text="Model" />
                                </asp:DropDownList>

                                <asp:TextBox ID="txtfilterVehicles" placeholder="Enter Number" runat="server" CssClass="form-control" OnTextChanged="txtfilterVehicles_TextChanged" AutoPostBack="true" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);"></asp:TextBox><%--<<<<<  Add shadowing  <<<<<--%>
                                <asp:Button ID="btnSearchVehicle" Text="Search Vehicles" runat="server" CssClass="btn btn-primary" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(5,28,60,.8);" /> <%--<<<<<  Add shadowing  <<<<<--%>
                            </div>
                        </div>

                        <div class="col-md-4 text-right">
                            <div class="add-vehicle-buttons form-inline">
                                <%--   <asp:Button ID="btnAddOperator" runat="server" CssClass="btn btn-success btn-sm " Text="+Add New Vehicle" OnClick="btnAddOperator_Click" />--%>
                                <asp:LinkButton ID="lnkAddVehicle" runat="server" CssClass="btn btn-success btn-sm" OnClick="lnkAddVehicle_Click" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(59,141,65,.819);"><span class="glyphicon glyphicon-plus-sign"></span><span class="phone">&nbsp;Add New Vehicle</span></asp:LinkButton>
                                <asp:LinkButton ID="lnkExportVehicles" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnExportVehicles_Click" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(59,141,65,.819);"><span class="glyphicon glyphicon-export"></span><span class="phone">&nbsp;Export Excel</span></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <br />
                                 <%------>>>>>  Add sorting function to "Admin #" (JaQuan)  >>>>>-------%>

                    <asp:ListView ID="ListViewVehicleAll" runat="server" DataKeyNames="ID" AllowSorting="True" OnSorting="ListViewVehicleAll_Sorting"><%--<<<<<  Add sorting handler  <<<<<--%>
                        <EmptyDataTemplate>
                            <table runat="server">
                                <tr>
                                    <td>Vehicle records not found.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                <td>
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td >
                                    <asp:Label ID="ModelLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="Label1" Font-Size="Smaller" runat="server" Text='<%# Eval("Section") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="Label2" Font-Size="Smaller" runat="server" Text='<%# Eval("DesignatedOperator") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="Label3" Font-Size="Smaller" runat="server" Text='<%# Eval("VehicleLocation") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("DueMileage") %>' />&nbsp;km
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="RegistrationExpiryLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("CurrentMileage") %>' />&nbsp;km
                                </td>
                                <td class="<%# GetStatusColor(Eval("VehicleStatus"))  %>">
                                    <span class="glyphicon glyphicon-flag"></span>
                                    <asp:Label ID="Label5" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("VehicleStatus")) ? "Serviceable" : "Not-Serviceable" %>' />&nbsp; -
                                    <asp:Label ID="Label4" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("PermIssued")) ? "P" : "M" %>' />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <LayoutTemplate>
                            <table runat="server" style="width: 100%; margin-top: 1rem"><%--<<<<<  Add border  <<<<<--%>
                                <tr runat="server">
                                    <td class="all-vehicles-table" runat="server" style="border-radius: 50%">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0">
                                            <thead>
                                                <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)"><%--<<<<<  change text color of headers  <<<<<--%>
                                                    <th runat="server">Profile</th>
                                                    <th runat="server" style="background-color:rgba(0, 1, 1, .9);"><%--<<<<<  Change background  <<<<<--%>
                                                        <asp:LinkButton ID="lnkSortAdmin" runat="server" CommandName="Sort" CommandArgument="AdminNumber" style="text-decoration: none; background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">Admin # <span style="color: #909091;">↑↓</span></asp:LinkButton><%--<<<<<  add sorting handler & customize header  <<<<<--%>
                                                    </th>
                                                    <th class="fullsite-vehicles" runat="server">Plate #</th>
                                                    <th runat="server">Make/Model</th>
                                                    <th class="fullsite-vehicles" runat="server">Section</th>
                                                    <th class="phone" runat="server">Operator</th>
                                                    <th class="fullsite-vehicles" runat="server">Location</th>
                                                    <th class="fullsite-vehicles" runat="server">Due Mileage</th>
                                                    <th class="fullsite-vehicles" runat="server">Registration Expiry</th>
                                                    <th class="fullsite-vehicles" runat="server">Current Mileage</th>
                                                    <th runat="server">Vehicle Status</th>
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
                    <asp:ListView ID="ListView30VehiclesExpired" runat="server" DataKeyNames="ID" AllowSorting="True" OnSorting="ListViewVehicleAll_Sorting"><%--<<<<<  Add sorting handler  <<<<<--%>
                        <AlternatingItemTemplate>
                            <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                <td>
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819) "><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                                </td>
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
                                <td>
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%"><%--<<<<<  Add border  <<<<<--%>
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                            <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)"><%--<<<<<  change text color of headers  <<<<<--%>
                                                <th runat="server">Profile</th>
                                                <th runat="server" style="background-color:rgba(0, 1, 1, .9);"><%--<<<<<  Change background  <<<<<--%>
                                                    <asp:LinkButton ID="lnkSortAdmin" runat="server" CommandName="Sort" CommandArgument="AdminNumber" style="text-decoration: none; background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">Admin # <span style="color: #909091;">↑↓</span></asp:LinkButton><%--<<<<<  add sorting handler & customize header  <<<<<--%>
                                                </th>
                                                <th class="fullsite-vehicles" runat="server">Plate #</th>
                                                <th runat="server">Make/Model</th>
                                                <th class="fullsite-vehicles" runat="server">Due Mileage</th>
                                                <th runat="server">Registration Expiry</th>
                                                <th class="fullsite-vehicles" runat="server">Current Mileage</th>
                                                <th class="phone" runat="server">Current FuelTank Level</th>
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
                    <asp:ListView ID="ListViewVehiclesExpired" runat="server" DataKeyNames="ID" AllowSorting="True" OnSorting="ListViewVehicleAll_Sorting"><%--<<<<<  add sorting handler  <<<<<--%>
                        <AlternatingItemTemplate>
                            <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                                <td>
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                                </td>
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
                                <td>
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%"><%--<<<<<  Add border  <<<<<--%>
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                            <tr runat="server" style="background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)"><%--<<<<<  change text color of headers  <<<<<--%>
                                                <th runat="server">Profile</th>
                                                <th runat="server" style="background-color:rgba(0, 1, 1, .9);"><%--<<<<<  Change background  <<<<<--%>
                                                    <asp:LinkButton ID="lnkSortAdmin" runat="server" CommandName="Sort" CommandArgument="AdminNumber" style="text-decoration: none; background-color:rgba(0, 1, 1, .9) ; color: rgba(59,141,65,.819)">Admin # <span style="color: #909091;">↑↓</span></asp:LinkButton><%--<<<<<  add sorting handler & customize header  <<<<<--%>
                                                </th>
                                                <th class="fullsite-vehicles" runat="server">Plate Number</th>
                                                <th runat="server">Make/Model</th>
                                                <th class="fullsite-vehicles" runat="server">Due Mileage</th>
                                                <th runat="server">Registration Expiry</th>
                                                <th class="fullsite-vehicles" runat="server">Current Mileage</th>
                                                <th class="phone" runat="server">Current FuelTank Level</th>
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

                <div class="tab-pane fade" id="NonServicable">
                    <asp:ListView ID="ListViewNonServicable" runat="server" DataKeyNames="ID" AllowSorting="True" OnSorting="ListViewVehicleAll_Sorting"><%--<<<<<  add sorting handler  <<<<<--%>
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
                                    <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)"><span class="glyphicon glyphicon-info-sign"></span></a>
                                </td>
                                <td>
                                    <asp:Label ID="VehicleAdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="VehiclePlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ModelLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="Label1" Font-Size="Smaller" runat="server" Text='<%# Eval("Section") %>' />
                                </td>
                                <td class="phone">
                                    <asp:Label ID="Label2" Font-Size="Smaller" runat="server" Text='<%# Eval("DesignatedOperator") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="Label3" Font-Size="Smaller" runat="server" Text='<%# Eval("VehicleLocation") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="DueMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("DueMileage") %>' />&nbsp;km
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="RegistrationExpiryLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                                </td>
                                <td class="fullsite-vehicles">
                                    <asp:Label ID="CurrentMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("CurrentMileage") %>' />&nbsp;km
                                </td>
                                <td class="<%# GetStatusColor(Eval("VehicleStatus"))  %>">
                                    <span class="glyphicon glyphicon-flag"></span>
                                    <asp:Label ID="Label5" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("VehicleStatus")) ? "Serviceable" : "Not-Serviceable" %>' />&nbsp; -
                                    <asp:Label ID="Label4" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("PermIssued")) ? "P" : "M" %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server"><%--<<<<<  Add border  <<<<<--%>
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover" runat="server" border="0" style="box-shadow: 0 0 10px 0 #000000">
                                            <tr runat="server" style="background-color:rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)"><%--<<<<<  change text color of headers  <<<<<--%>
                                                <th runat="server">Profile</th>
                                                <th runat="server" style="background-color:rgba(0, 1, 1, .9)">
                                                    <asp:LinkButton ID="lnkSortAdmin" runat="server" CommandName="Sort" CommandArgument="AdminNumber" style="text-decoration: none; color: rgba(59,141,65,.819)">Admin # <span style="color: #909091;">↑↓</span></asp:LinkButton><%--<<<<<  add sorting handler & customize header  <<<<<--%>
                                                </th>

                                                 <%-------<<<<<  Add sorting function to "Admin #" (JaQuan)  <<<<<-------%>

                                                <th class="fullsite-vehicles" runat="server">Plate #</th>
                                                <th runat="server">Make/Model</th>
                                                <th class="fullsite-vehicles" runat="server">Section</th>
                                                <th class="phone" runat="server">Operator</th>
                                                <th class="fullsite-vehicles" runat="server">Location</th>
                                                <th class="fullsite-vehicles" runat="server">Due Mileage</th>
                                                <th class="fullsite-vehicles" runat="server">Registration Expiry</th>
                                                <th class="fullsite-vehicles" runat="server">Current Mileage</th>
                                                <th runat="server">Vehicle Status</th>
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
    
    <%--<<<<<-----  Mobile site  ----->>>>>--%>

        <%-->>>>>  Styling  >>>>>--%>
    <style>
        .vehicles-container{
            width: 100%;
            margin: 0;
            padding: 0;
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

        /*<<<<<  Search Vehicle Heading  >>>>>*/

        .search-vehicle-container{
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-vehicle-left{
            display: flex;
            justify-content: start;
            align-items: center;
        }

        /*<<<<<  Table & Content  >>>>>*/
        .vehicles-page{
            width: 65%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .table{
            box-shadow: 0 0 10px 0 #000000
        }

        @media screen and (max-width: 1368px){
            .pulse-vehicles{
                animation: pulse 3s infinite;
            }
        }

        @media screen and (max-width: 912px){
            .fullsite-vehicles{
                display: none;
            }
            .add-vehicle-buttons{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .search-vehicle-left{
                flex-direction: column;
                justify-content:space-between;
                align-content:center;
                flex-wrap: wrap;
                gap: .7rem;
                padding-bottom: .7rem;
            }
            .all-vehicles-table{
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
                width: 65%
            } 
            .search-vehicle-container{
                width: 65%;
                display: flex;
                flex-direction: column;
                justify-content:center;
                align-items: center;
            }
        }
    </style>
</asp:Content>
