using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ITHS_CMSProject.ModelClasses
{
    public class PageView
    {
        public int PageId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string PageName { get; set; }

        [Required]
        [Display(Name = "PageLink")]
        public string PageLink { get; set; }
                
        public bool IsDeleted { get; set; } = false;
    }
}
