using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronBarCode;
using Microsoft.AspNet.Identity;

namespace VASR_WEB
{
    public partial class Vehicles : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        string CS = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateadd60 = DateTime.Today.AddDays(60);

            //>>>>>-----Adding Non-Servicable Tab----->>>>>

            if (!IsPostBack)
            {
                BindNonServicableVehicles();
            }

            //<<<<<-----Adding Non-Servicable Tab-----<<<<<

            var list = ctx.tblVehicleFleets.Where(v => (bool)v.VehicleStatus == true).ToList();

            if (User.IsInRole("Dept. Manager"))
            {
                var userID = User.Identity.GetUserId();
                var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                list = ctx.tblVehicleFleets
                                .Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();

                ListViewVehicleAll.DataSource = list;
                ListViewVehicleAll.DataBind();
            }
            else
            {

                ListViewVehicleAll.DataSource = list;
                ListViewVehicleAll.DataBind();
            }

            ListView30VehiclesExpired.DataSource = ctx.tblVehicleFleets
                                          .Where(x => x.RegExpiry < dateadd60)
                                          .Where(v => (bool)v.VehicleStatus == true)
                                          .ToList();
            ListView30VehiclesExpired.DataBind();

            ListViewVehiclesExpired.DataSource = ctx.tblVehicleFleets
                                         .Where(x => x.RegExpiry < DateTime.Today)
                                         .Where(v => (bool)v.VehicleStatus == true)
                                         .ToList();
            ListViewVehiclesExpired.DataBind();
        }

        protected void txtfilterVehicles_TextChanged(object sender, EventArgs e)
        {
            int skip = 0;
            int take = 20;

            if (String.IsNullOrEmpty(txtfilterVehicles.Text))
            {
                var list = ctx.tblVehicleFleets.ToList();

                if (User.IsInRole("Dept. Manager"))
                {
                    var userID = User.Identity.GetUserId();
                    var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                    list = ctx.tblVehicleFleets
                                    .Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();

                    ListViewVehicleAll.DataSource = list;
                    ListViewVehicleAll.DataBind();
                }
                else
                {
                    ListViewVehicleAll.DataSource = list;
                    ListViewVehicleAll.DataBind();
                }
            }
            else
            {
                if (vehicleSearchSelector.SelectedValue.ToString().Contains("Admin Number"))
                {
                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.AdminNumber.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.AdminNumber).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();
                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }
                }
                else if (vehicleSearchSelector.SelectedValue.ToString().Contains("Department"))
                {
                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.Section.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.Section).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();
                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }
                }

                else if (vehicleSearchSelector.SelectedValue.ToString().Contains("Model"))
                {
                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.Model.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.Model).Skip(skip).Take(take)).ToList();
                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();
                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }


                }

                else
                {


                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.PlateNumber.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.PlateNumber).Skip(skip).Take(take)).ToList();


                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();
                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }
                }
            }
        }

        protected string GetStatusColor(object val)
        {
            string output = "text-success";
            if (!(bool)val)
            {
                output = "text-danger";
            }
            return output;
        }

        protected void btnExportVehicles_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "IMD_VehicleList_" + DateTime.Now.Date.ToString("d") + ".xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = GetDatafromDatabase();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        protected DataTable GetDatafromDatabase()

        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("spExportToExcel", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();

                    return dt;
                }
            }
        }

        protected void btnAddOperator_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewVehicle.aspx");
        }

        protected void lnkAddVehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewVehicle.aspx");
        }

        protected void lnkExportVehicles_Click(object sender, EventArgs e)
        {

        }

        //protected void btnAddNewVehicle_Click(object sender, EventArgs e)
        //{
        //    var insertNewVehicle = new tblVehicleFleet()
        //    {
        //        AdminNumber = VehicleAdminNumberText.Text,
        //        PlateNumber = VehiclePlateNumberText.Text,
        //        Model = ModelText.Text,
        //        RegExpiry = DateTime.Parse(RegistrationExpiryText.Text.ToString()),
        //        CurrentMileage=CurrentMileageText.Text,
        //        CurrentFuelLevel = CurrentFuelTankLevelText.Text,
        //        DueMileage = DueMileageText.Text

        //    };

        //    ctx.tblVehicleFleets.Add(insertNewVehicle);
        //    ctx.SaveChanges();


        //}

        //------------------>>>>>-----IMD V2X Software Revision----->>>>>----------------------------------------------------------------------------------------------------------



        //>>>>>-----Add sorting function to "Admin #" (JaQuan)----->>>>>

        protected void ListViewVehicleAll_Sorting(object sender, ListViewSortEventArgs e)
        {
            // Toggle sort direction
            var sortDirection = ViewState["SortDirection"] as string == "ASC" ? "DESC" : "ASC";

            ViewState["SortExpression"] = e.SortExpression;
            ViewState["SortDirection"] = sortDirection;

            BindListView(); // Call the method to bind data to the ListView
        }

        private void BindListView()
        {
            var list = ctx.tblVehicleFleets.Where(v => (bool)v.VehicleStatus == true).ToList(); // Fetch your data
            var nonServicableList = ctx.tblVehicleFleets.Where(v => (bool)v.VehicleStatus == false).ToList(); // Fetch your data


            string sortExpression = ViewState["SortExpression"] as string;
            string sortDirection = ViewState["SortDirection"] as string;

            if (!string.IsNullOrEmpty(sortExpression))
            {
                list = sortDirection == "ASC"
                    ? list.OrderBy(x => x.GetType().GetProperty(sortExpression).GetValue(x, null)).ToList()
                    : list.OrderByDescending(x => x.GetType().GetProperty(sortExpression).GetValue(x, null)).ToList();
            }

            ListViewVehicleAll.DataSource = list;
            ListViewVehicleAll.DataBind();

            ListView30VehiclesExpired.DataSource = list;
            ListView30VehiclesExpired.DataBind();

            ListViewVehiclesExpired.DataSource = list;
            ListViewVehiclesExpired.DataBind();

            ListViewNonServicable.DataSource = nonServicableList;
            ListViewNonServicable.DataBind();
        }

        //<<<<<-----Add sorting function to "Admin #" (JaQuan)-----<<<<<

        //>>>>>-----Adding Non-Servicable Tab----->>>>>

        private void BindNonServicableVehicles()
        {
            var nonServiceableList = ctx.tblVehicleFleets.Where(v => (bool)v.VehicleStatus == false).ToList(); // Assuming 'false' means non-serviceable
            ListViewNonServicable.DataSource = nonServiceableList;
            ListViewNonServicable.DataBind();
        }

        protected void TxtfilterVehicles_TextChanged(object sender, EventArgs e)
        {
            // Check if the text box for filtering vehicles is empty
            if (String.IsNullOrEmpty(txtfilterVehicles.Text))
            {
                // If the text box is empty, we want to show all vehicles again
                // Call the methods to bind data to both ListViews
                BindNonServicableVehicles();
            }
            else
            {
                // If there's some text in the text box, we apply the filter based on this text
                // You need to adapt this part based on your actual data model and what fields you want to filter by
                // For example, if you're filtering by 'AdminNumber', you'd do something like this:
                if (vehicleSearchSelector.SelectedValue.ToString().Contains("Admin Number"))
                {
                    // Your existing logic for filtering based on 'Admin Number'
                    // ...

                    // After filtering, again bind the updated list to both ListViews
                    //BindAllVehicles();
                    BindNonServicableVehicles();
                }
                // Similar logic for other types of filters (like 'Department', 'Model', etc.)
                // ...
            }
        }
        // Note: You need to implement the BindAllVehicles and BindNonServicableVehicles methods as described previously

        //<<<<<-----Adding Non-Servicable Tab-----<<<<<
    }
}