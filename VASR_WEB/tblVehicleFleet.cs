//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VASR_WEB
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblVehicleFleet
    {
        public int ID { get; set; }
        public string AdminNumber { get; set; }
        public string PlateNumber { get; set; }
        public string Model { get; set; }
        public string DueMileage { get; set; }
        public Nullable<System.DateTime> RegExpiry { get; set; }
        public string CurrentMileage { get; set; }
        public string CurrentFuelLevel { get; set; }
        public Nullable<bool> VehicleStatus { get; set; }
        public Nullable<int> VehicleCode { get; set; }
        public string DesignatedOperator { get; set; }
        public string PhoneNumber { get; set; }
        public string VehicleLocation { get; set; }
        public string Section { get; set; }
        public string Comments { get; set; }
        public Nullable<bool> PermIssued { get; set; }
    }
}