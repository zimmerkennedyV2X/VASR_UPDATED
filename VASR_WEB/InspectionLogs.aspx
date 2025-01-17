﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionLogs.aspx.cs" Inherits="VASR_WEB.InspectionLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: flex; justify-content: center; align-items: center; margin: 100px 0 150px 0">        
        <div class="row">    
            <h3><strong>Inspection Logs</strong></h3>
            <div class="row">
                <div class="col-md-8">
                    <small>Search by</small>
                    <div class="form-inline">
                        <asp:DropDownList CssClass="form-control" ID="inspectionRecordFilter" runat="server" Width="220" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);">
                            <asp:ListItem Text="Admin Number" />
                            <asp:ListItem Text="Plate Number" />
                            <asp:ListItem Text="Operator Name" />
                            <asp:ListItem Text="Inspected By" />
                            <asp:ListItem Text="Assesment" />
                        </asp:DropDownList>

                        <asp:TextBox ID="txtfilterInspectionRecord" placeholder="Enter Number" runat="server" CssClass="form-control" OnTextChanged="txtfilterInspectionRecord_TextChanged" AutoPostBack="true" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819);"></asp:TextBox>
                        <asp:Button ID="btnSearchInspectionRecord" runat="server" Text="Search" CssClass="btn btn-primary" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(5,28,60,.8)"/>
                    </div>
                </div>
                <div class="col-md-4 text-right">
                    <div class="form-inline">
                        <%--   <asp:Button ID="btnAddOperator" runat="server" CssClass="btn btn-success btn-sm " Text="+Add New Vehicle" OnClick="btnAddOperator_Click" />--%>                    
                        <%-- <asp:Button ID="btnExportVehicles" runat="server" CssClass="btn btn-default btn-sm " OnClick="btnExportVehicles_Click" Text="Export Vehicle List to Excel" />--%>
                    </div>
                </div>
            </div>
            <br/>

            <asp:ListView ID="lvDailyInspections" runat="server" >
                <ItemTemplate>
                    <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                        <td>
                            <a class="btn btn-default btn-xs" style="background-color: #3b8d41; border: 2px solid rgba(59,141,65,.7); box-shadow: 0 0 10px 2px rgba(59,141,65,.819)" href="InspectionRecord.aspx?ID=<%# Eval("ID") %>"><span class="glyphicon glyphicon-info-sign"></span></a>
                        </td>
                        <td>
                            <asp:Label ID="FullNameLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("FullName") %>' />
                        </td>                    
                        <td>
                            <asp:Label ID="Label2" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                        </td>                    
                        <td>
                            <asp:Label ID="Label3" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                        </td>                        
                        <td>
                            <asp:Label ID="Label5" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndDateLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndDate","{0:d}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndMileage") %>' />&nbsp;km
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="Smaller" Text='<%# Convert.ToBoolean(Eval("ConditionPass")) ? "Serviceable" : "Not-Serviceable" %>' />
                        </td>                        
                        <td>
                            <asp:Label ID="Label6" runat="server" Font-Size="Smaller" Text='<%# Convert.ToBoolean(Eval("IsMVA")) ? "Yes" : "No" %>' />
                        </td>
                        <td>
                            <asp:Label ID="InspectionDateCompletedLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("InspectionDateCompleted") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Size="Smaller" Text='<%# Eval("DispatchInspector")%>' />
                        </td>
                    </tr>
                </ItemTemplate>

                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-striped table-hover " id="itemPlaceholderContainer" runat="server" border="0" style="box-shadow: 0 0 10px 2px #000000">
                                    <tr runat="server" style="background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                                        <th runat="server"><small>View</small></th>
                                        <th runat="server"><small>Operator</small></th>
                                        <th runat="server"><small>Admin #</small></th>
                                        <th runat="server"><small>Plate #</small></th>
                                        <th runat="server"><small>Model</small></th>
                                        <th runat="server"><small>Return Date</small></th>
                                        <th runat="server"><small>End Mileage</small></th>
                                        <th runat="server"><small>Assessment</small></th>
                                        <th runat="server"><small>MVA</small></th>
                                        <th runat="server"><small>Inspection Date</small></th>
                                        <th runat="server"><small>Inspected by</small></th>
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
    </div>
</asp:Content>
