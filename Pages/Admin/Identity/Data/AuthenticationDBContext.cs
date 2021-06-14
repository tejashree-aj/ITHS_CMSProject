using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace ITHS_CMSProject.Areas.Identity.Data
{
    public class AuthenticationDBContext : IdentityDbContext<UserInformation>
    {
        public AuthenticationDBContext(DbContextOptions<AuthenticationDBContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);
        }
    }
}
