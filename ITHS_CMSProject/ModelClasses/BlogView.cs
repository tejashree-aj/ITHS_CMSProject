    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ITHS_CMSProject.ModelClasses
{
    public class BlogView
    {
        public int BlogId { get; set; }

        [Required]
        public string Content { get; set; }

        public string ImageURL { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Author { get; set; }
    }
}
