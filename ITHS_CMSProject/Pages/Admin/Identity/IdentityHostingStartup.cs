using System;
using ITHS_CMSProject.Areas.Identity.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(ITHS_CMSProject.Areas.Identity.IdentityHostingStartup))]
namespace ITHS_CMSProject.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<AuthenticationDBContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("AuthenticationDBContextConnection")));                

                services.AddDefaultIdentity<UserInformation>(options => options.SignIn.RequireConfirmedAccount = false).AddRoles<IdentityRole>()
                .AddEntityFrameworkStores<AuthenticationDBContext>();
            });
        }
    }
}