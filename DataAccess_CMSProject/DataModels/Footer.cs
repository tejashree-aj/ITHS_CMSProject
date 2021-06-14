using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DataAccess_CMSProject.DataModels
{
    public class Footer
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int FooterId { get; set; }

        [Required, MaxLength(1000), StringLength(1000)]
        public string HtmlText { get; set; }
    }
}
