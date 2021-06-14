using ITHS_CMSProject.Areas.Identity.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace ITHS_CMSProject
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                }).ConfigureServices((context, services) =>
                {
                    services.AddDbContext<AuthenticationDBContext>(options =>
                         options.UseSqlServer(context.Configuration.GetConnectionString("AuthenticationDbContextConnection")),
                         ServiceLifetime.Transient);
                              
                });
    }
}
