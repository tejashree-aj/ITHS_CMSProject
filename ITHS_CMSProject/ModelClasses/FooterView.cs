using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ITHS_CMSProject.ModelClasses
{
    public class FooterView
    {

        public int FooterId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string HtmlText { get; set; }
    }
}
