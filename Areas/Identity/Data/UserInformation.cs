using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace ITHS_CMSProject.Areas.Identity.Data
{
    // Add profile data for application users by adding properties to the UserInformation class
    public class UserInformation : IdentityUser
    {
        //[Required]
        [StringLength(60, MinimumLength = 3, ErrorMessage = "Firstname is mandatory")]
        [Display(Name = "FirstName")]
        public string FirstName { get; set; }

        //[Required]
        [Display(Name = "LastName")]
        public string LastName { get; set; }

        //[Required]
        //[Display(Name = "Address")]
        //public string Address { get; set; }
    }
}
