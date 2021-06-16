using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;
using ITHS_CMSProject.Areas.Identity.Data;
using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace ITHS_CMSProject.Pages.Admin.Footer
{
    [Authorize(Roles = "Admin")]
    public class IndexFooterModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public IndexFooterModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        [BindProperty]
        public IList<FooterView> Footer { get; set; }

        public async Task<IActionResult> OnGet()
        {
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            Footer = await httpClient.GetFromJsonAsync<List<FooterView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/Footer");

            return Page();

        }
    }
}
