using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFrontLab.DATA.EF
{
    [MetadataType(typeof(XboxMetadata))]
    public partial class Xbox { }

    public class XboxMetadata
    {
        [Required]
        public string XboxID { get; set; }
        
        [Required]
        public int XboxStatusID { get; set; }

        [Required]
        public int DepartmentsID { get; set; }

        [Required]
        public int XboxUnitsSold { get; set; }

        [Required]
        public int G_Company { get; set; }

        public string Description { get; set; }
        public Nullable<int> AccessoriesID { get; set; }

        [Display(Name = "Released")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public Nullable<System.DateTime> ReleaseDate { get; set; }
    }

    [MetadataType(typeof(GameMetadata))]
    public partial class Games { }

    public class GameMetadata
    {
        [StringLength(100)]
        [Required]
        public string G_Name { get; set; }

        public string Description { get; set; }
        public Nullable<int> AccessoriesID { get; set; }

        [DisplayFormat(DataFormatString = "{0:c}")]
        public Nullable<decimal> GamePrice { get; set; }

        public Nullable<int> XboxUnitsSold { get; set; }

        [Display(Name = "Released")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public Nullable<System.DateTime> ReleaseDate { get; set; }

        [Required]
        public int G_Company { get; set; }

        public string GameImage { get; set; }
    }
}
