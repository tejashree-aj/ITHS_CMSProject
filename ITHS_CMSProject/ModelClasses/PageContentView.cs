    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ITHS_CMSProject.ModelClasses
{
    public class PageContentView
    {
        public int PageContentId { get; set; }

        [Required]
        [Display(Name = "Caption")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Content")]
        public string Content { get; set; }

        [Required]
        [Display(Name = "Page Name")]
        public int PageId { get; set; }

    }
}
