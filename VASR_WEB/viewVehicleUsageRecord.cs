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
    
    public partial class viewVehicleUsageRecord
    {
        public string AdminNumber { get; set; }
        public string PlateNumber { get; set; }
        public string Model { get; set; }
        public string FullName { get; set; }
        public string Location { get; set; }
        public Nullable<System.DateTime> StartDateAndTime { get; set; }
        public string EndMileage { get; set; }
        public int VehicleID { get; set; }
        public int ID { get; set; }
        public string Inspector { get; set; }
        public Nullable<System.DateTime> InspectDate { get; set; }
        public Nullable<bool> ConditionPass { get; set; }
    }
}