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
    
    public partial class tblDailyInspection
    {
        public int ID { get; set; }
        public Nullable<bool> FuelLevelPass { get; set; }
        public Nullable<bool> MileagePass { get; set; }
        public Nullable<bool> ConditionPass { get; set; }
        public string Comments { get; set; }
        public Nullable<int> DispatchID { get; set; }
        public Nullable<bool> InspectionDone { get; set; }
        public Nullable<System.DateTime> InspectionDateCompleted { get; set; }
        public Nullable<bool> CleanPass { get; set; }
        public string DispatchInspector { get; set; }
        public Nullable<bool> ExteriorDamage { get; set; }
        public Nullable<bool> ExteriorClean { get; set; }
        public Nullable<bool> InteriorClean { get; set; }
        public Nullable<bool> WindowDamage { get; set; }
        public Nullable<bool> Lights { get; set; }
        public Nullable<bool> FluidLeaks { get; set; }
        public Nullable<bool> TireInflation { get; set; }
        public string ExteriorDamageComment { get; set; }
        public string ExteriorCleanComment { get; set; }
        public string InteriorCleanComment { get; set; }
        public string WindowDamageComment { get; set; }
        public string LightsComment { get; set; }
        public string FluidLeaksComment { get; set; }
        public string TireInflationComment { get; set; }
        public Nullable<bool> IsMVA { get; set; }
    }
}