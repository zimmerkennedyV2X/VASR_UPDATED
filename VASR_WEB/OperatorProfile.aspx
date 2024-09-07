﻿<%@ Page Title="Operator Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OperatorProfile.aspx.cs" Inherits="VASR_WEB.OperatorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="operator-profile-container">
        <div class="operator-profile-page">
            <div class="col-md-6">
                <h4>Usage Records</h4>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No usage records found for this operator.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819)">
                            <td>
                                <asp:Label ID="AdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label2" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CheckoutTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("CheckoutTime") %>' />
                            </td>
                            <td>
                                <asp:Label ID="StartMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("StartMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ReturnTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("ReturnTime") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EndMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndMileage") %>' />
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
                                    <table id="itemPlaceholderContainer" class="table table-striped" runat="server" border="0" style="box-shadow: 0 0 10px 2px #000000">
                                        <tr runat="server" style="background-color: rgba(0, 1, 1, .9); color: rgba(59,141,65,.819)">
                                            <th runat="server">Admin #</th>
                                            <th runat="server">Make/Model</th>
                                            <th runat="server">Plate Number</th>
                                            <th runat="server">Checkout</th>
                                            <th runat="server">Start Mileage</th>
                                            <th runat="server">Return</th>
                                            <th runat="server">End Mileage</th>
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewOperatorVehicleUsage] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col-md-6">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2" Width="100%">
                    <EditItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default" style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819); border: none; box-shadow: 0 0 10px 0 #000000">
                                    <a href="OperatorProfile.aspx">OperatorProfile.aspx</a>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Section: </small>
                                            <br />
                                            <%--           <asp:DropDownList ID="DDLSection" CssClass="form-control" runat="server" SelectedValue='<%# Bind("Section") %>'>
                                                <asp:ListItem Value="">- Select Department -</asp:ListItem>
                                                <asp:ListItem Value="ASD-N">ASD-N</asp:ListItem>
                                                <asp:ListItem Value="ASD-S">ASD-S</asp:ListItem>
                                                <asp:ListItem Value="AVD-N">AVD-N</asp:ListItem>
                                                <asp:ListItem Value="AVD-S">AVD-S</asp:ListItem>
                                                <asp:ListItem Value="PMD-N">PMD-N</asp:ListItem>
                                                <asp:ListItem Value="PMD-S">PMD-S</asp:ListItem>
                                                <asp:ListItem Value="IM-N">IM-N</asp:ListItem>
                                                <asp:ListItem Value="IM-S">IM-S</asp:ListItem>
                                                <asp:ListItem Value="SSD-N">SSD-N</asp:ListItem>
                                                <asp:ListItem Value="SSD-S">SSD-S</asp:ListItem>
                                            </asp:DropDownList>--%>

                                            <asp:TextBox ID="SectionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Section") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                            <asp:RequiredFieldValidator ErrorMessage="Section is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="SectionTextBox" runat="server" />
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">IMD Operator Number:</small>
                                                    <br />
                                                    <asp:TextBox ID="OperatorNumTextBox" CssClass="form-control" runat="server" Text='<%# Bind("OperatorNum") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="Operator Number is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="OperatorNumTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Operator Name:</small>
                                                    <br />
                                                    <asp:TextBox ID="FullNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("FullName") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="Operator Name is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="FullNameTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Job Title:</small>
                                                <br />
                                                <asp:TextBox ID="JobTitleTextBox" CssClass="form-control" runat="server" Text='<%# Bind("JobTitle") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                <asp:RequiredFieldValidator ErrorMessage="Job Title is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="JobTitleTextBox" runat="server" />
                                            </div>
                                        </div>

                                        <hr style=" border: none; height: .2rem; background-color: rgba(59,141,65,.819); box-shadow: 0 0 1rem .2rem #000000" />

                                        <small class="vehicleProfile"  style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)"><strong>License Records:</strong></small>
                                        <h5>Quick License Code Guide</h5>
                                        <ul class="list-inline">
                                            <li>1 - NTV</li>
                                            <li>2 - Pick Up</li>
                                            <li>3 - Cargo Van</li>
                                            <li>4 - Canter</li>
                                            <li>5 - Commercial Truck</li>
                                            <li>6 - Heavy License/KDL</li>
                                            <li>7 - Heavy Equipment</li>
                                        </ul>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">License Issue Date</small>
                                                    <br />
                                                    <asp:TextBox ID="LicenseIssueDateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("LicenseIssueDate","{0:d}") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="License Issue Date is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="LicenseIssueDateTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">License Expiry Date</small>
                                                    <br />
                                                    <asp:TextBox ID="LicenseExpiryDateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("LicenseExpiryDate","{0:d}") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="License Expiry Date is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="LicenseExpiryDateTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">License Code:</small>
                                                    <br />
                                                    <asp:TextBox ID="OperatorLicenseCodeTextBox" CssClass="form-control" TextMode="Number" MaxLength="6" runat="server" Text='<%# Bind("OperatorLicenseCode") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="License Code is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="OperatorLicenseCodeTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Operator Status:</small>
                                                    <br />
                                                    <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-control" Checked='<%# Bind("OperatorStatus") %>' Enabled="true" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,0);" />
                                                </div>
                                            </div>
                                        </div>

                                        <hr style=" border: none; height: .2rem; background-color: rgba(59,141,65,.819); box-shadow: 0 0 1rem .2rem #000000" />

                                        <small class="vehicleProfile" style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)"><strong>Operator Contact Info</strong></small>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Work Location: </small>
                                                    <br />
                                                    <%--   <asp:DropDownList ID="DDLVehicleLocation" CssClass="form-control" runat="server" SelectedValue='<%# Bind("Location") %>'>
                                                        <asp:ListItem Value="">- Select Location -</asp:ListItem>
                                                        <asp:ListItem Value="Camp Arifjan">Camp Arifjan</asp:ListItem>
                                                        <asp:ListItem Value="Camp Buehring">Camp Buehring</asp:ListItem>

                                                    </asp:DropDownList>--%>
                                                    <asp:TextBox ID="LocationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Location") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" />
                                                    <asp:RequiredFieldValidator ErrorMessage="Location is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="LocationTextBox" runat="server" />
                                                </div>
                                            </div>

                                            <div class="col-md-4"></div>

                                            <div class="col-md-4"></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Notes:</small>
                                                <asp:TextBox CssClass="form-control" Enabled="true" Font-Bold="true" runat="server" ID="Label4" Text='<%# Bind("Comments") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);" ></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:LinkButton CssClass="btn btn-danger btn-md" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" style="margin-right: 1.2rem;border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(5,28,60,.8)" />
                        <asp:LinkButton CssClass="btn btn-success btn-md" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update Operator" style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; margin-right: 12px; background-color: rgba(59,141,65,.819)" />
                    </EditItemTemplate>

                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default" style="background-color: rgba(0, 1, 1, .819); color: rgba(59,141,65,.819); border: none; box-shadow: 0 0 10px 0 #000000">
                                    <div class="panel-body">
                                        <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Section: </small>
                                            
                                        <br />

                                        <asp:Label ID="SectionLabel" runat="server" Text='<%# Bind("Section") %>' />
                                            
                                        <br />

                                        <div class="row">
                                            <div class="col-md-4">
                                                <br />

                                                <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">IMD Operator Number:</small>
                                                    
                                                <br />

                                                <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Bind("OperatorNum") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-4">
                                                    
                                                <br />

                                                <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Operator Name:</small>
                                                    
                                                <br />

                                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Bind("FullName") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-4">
                                                    
                                                <br />

                                                <small style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)">Job Title:</small>
                                                    
                                                <br />

                                                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
                                                    
                                                <br />

                                            </div>
                                        </div>

                                        <hr style=" border: none; height: .2rem; background-color: rgba(59,141,65,.819); box-shadow: 0 0 1rem .2rem #000000" />

                                        <small class="vehicleProfile" style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)"><strong>License Records:</strong></small>
                                            
                                        <div class="row">
                                            <div class="col-md-3">
                                                <small>License Issue Date</small>
                                                    
                                                <br />

                                                <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Bind("LicenseIssueDate","{0:d}") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-3">
                                                <small>License Expiry Date</small>
                                                    
                                                <br />

                                                <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Bind("LicenseExpiryDate","{0:d}") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-3">
                                                <small>Operator Code:</small>
                                                    
                                                <br />

                                                <asp:Label ID="OperatorLicenseCodeLabel" runat="server" Text='<%# Bind("OperatorLicenseCode") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-3">
                                                <small>Operator Status:</small>
                                                    
                                                <br />

                                                <asp:CheckBox ID="OperatorStatusCheckBox" runat="server" Checked='<%# Bind("OperatorStatus") %>' Enabled="false" />
                                            </div>
                                        </div>

                                        <hr style=" border: none; height: .2rem; background-color: rgba(59,141,65,.819); box-shadow: 0 0 1rem .2rem #000000" />

                                        <small class="vehicleProfile" style="color: rgba(59,141,65,.819); text-shadow: 2px 2px 8px rgba(59,141,65,.819)"><strong>Operator Contact Info</strong></small>
                                            
                                        <div class="row">
                                            <div class="col-md-4">
                                                <small>Work Location: </small>
                                                    
                                                <br />

                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' />
                                                    
                                                <br />

                                            </div>

                                            <div class="col-md-4"></div>
                                            <div class="col-md-4"></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <small>Notes:</small>
                                                <asp:TextBox CssClass="form-control" Enabled="FALSE" Font-Bold="true" runat="server" ID="Label4" Text='<%# Bind("Comments") %>' style="border-radius:10px 10px; border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(0, 1, 1, .7); color: rgba(59,141,65,.819);"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-primary btn-sm" CausesValidation="False" CommandName="Edit" style="border: none; box-shadow: 5px 5px 10px 0 #000000; background-color: rgba(5,28,60,.8)" ><span class="glyphicon glyphicon-pencil"></span>&nbsp; Edit</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" Visible="false" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" Visible="false" />
                    </ItemTemplate>
                </asp:FormView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>"
                    DeleteCommand="DELETE FROM [tblVehicleOperators] WHERE [ID] = @ID"
                    InsertCommand="INSERT INTO [tblVehicleOperators] ([OperatorNum], [FullName], [LicenseIssueDate], [LicenseExpiryDate], [Section], [JobTitle], [Location], [OperatorStatus], [OperatorLicenseCode]) VALUES (@OperatorNum, @FullName, @LicenseIssueDate, @LicenseExpiryDate, @Section, @JobTitle, @Location, @OperatorStatus, @OperatorLicenseCode)" SelectCommand="SELECT * FROM [tblVehicleOperators] WHERE ([ID] = @ID)"
                    UpdateCommand="UPDATE [tblVehicleOperators] SET [OperatorNum] = @OperatorNum,[Comments] = @Comments, [FullName] = @FullName, [LicenseIssueDate] = @LicenseIssueDate, [LicenseExpiryDate] = @LicenseExpiryDate, [Section] = @Section, [JobTitle] = @JobTitle, [Location] = @Location, [OperatorStatus] = @OperatorStatus, [OperatorLicenseCode] = @OperatorLicenseCode WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>

                    <InsertParameters>
                        <asp:Parameter Name="OperatorNum" Type="String" />
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
                        <asp:Parameter Name="LicenseExpiryDate" Type="DateTime" />
                        <asp:Parameter Name="Section" Type="String" />
                        <asp:Parameter Name="JobTitle" Type="String" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="OperatorStatus" Type="Boolean" />
                        <asp:Parameter Name="OperatorLicenseCode" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>

                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="OperatorNum" Type="String" />
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
                        <asp:Parameter Name="LicenseExpiryDate" Type="DateTime" />
                        <asp:Parameter Name="Section" Type="String" />
                        <asp:Parameter Name="JobTitle" Type="String" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="OperatorStatus" Type="Boolean" />
                        <asp:Parameter Name="OperatorLicenseCode" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <style>
        .operator-profile-container{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .operator-profile-page{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        @media screen and (max-width: 1368px){
            .pulse-operators {
                animation: pulse 3s infinite;
            }
        }
    </style>
</asp:Content>
