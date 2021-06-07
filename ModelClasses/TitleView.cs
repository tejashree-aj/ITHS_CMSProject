using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ITHS_CMSProject.ModelClasses
{
    public class TitleView
    {
        public int TitleId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Short Description")]
        public string ShortDescription { get; set; }
    }
}
