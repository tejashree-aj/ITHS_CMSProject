using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess_CMSProject.DataModels
{
    public class PageContent
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PageContentId { get; set; }

        [Required, MaxLength(100), StringLength(100)]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        [ForeignKey("Pages")]
        public int PageId { get; set; }

        public Pages Pages { get; set; }
    }
}
