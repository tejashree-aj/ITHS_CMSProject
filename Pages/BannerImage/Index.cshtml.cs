using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;
using ITHS_CMSProject.Areas.Identity.Data;
using ITHS_CMSProject.ModelClasses;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace ITHS_CMSProject.Pages.BannerImage
{
    public class IndexModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public IndexModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        public string SearchString { get; set; }

        public IList<BannerImageView> BannerImage { get; set; }

        public async Task<IActionResult> OnGet()
        {
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            BannerImage = await httpClient.GetFromJsonAsync<IList<BannerImageView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/bannerimage");

            return Page();

        }
    }
}
