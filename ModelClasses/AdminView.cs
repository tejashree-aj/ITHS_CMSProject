using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ITHS_CMSProject.ModelClasses
{
    public class AdminView
    {
        public int AdminId { get; set; }

        [Required]
        [Display(Name = "Name")]
        public string Name { get; set; }
    }
}
