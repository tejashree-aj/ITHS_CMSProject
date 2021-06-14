using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess_CMSProject.DataModels
{
    public class Pages
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PageId { get; set; }

        [Required, MaxLength(50), StringLength(50)]
        public string PageName { get; set; }


        [Required, MaxLength(50), StringLength(50)]
        public string PageLink { get; set; }

        [Required]
        public bool IsDeleted { get; set; } = false;

        public PageContent PageContent { get; set; }
        
    }
}
