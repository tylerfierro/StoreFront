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
    
    public partial class Game
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Game()
        {
            this.XboxEmployees = new HashSet<XboxEmployee>();
        }
    
        public int GameID { get; set; }
        public string G_Name { get; set; }
        public string G_Company { get; set; }
        public Nullable<decimal> GamePrice { get; set; }
        public string G_Description { get; set; }
        public Nullable<int> G_UnitsSold { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XboxEmployee> XboxEmployees { get; set; }
    }
}
