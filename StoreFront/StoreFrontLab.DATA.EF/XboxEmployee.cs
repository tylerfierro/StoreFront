//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFrontLab.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class XboxEmployee
    {
        public int XboxEmployeesID { get; set; }
        public int GameID { get; set; }
        public int EmployeeID { get; set; }
    
        public virtual Employee_s Employee_s { get; set; }
        public virtual Game Game { get; set; }
    }
}
