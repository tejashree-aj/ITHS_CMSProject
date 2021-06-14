using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages.Admin.PageContent
{
    [Authorize(Policy = "RequireAdministratorRole")]
    public class IndexContentModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public IndexContentModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        public string SearchString { get; set; }

        [BindProperty]
        public IList<PageContentView> PageContent { get; set; }

        public async Task<IActionResult> OnGet()
        {
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            PageContent = await httpClient.GetFromJsonAsync<List<PageContentView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/PageContent/AdminView");

            return Page();

        }
    }
}
