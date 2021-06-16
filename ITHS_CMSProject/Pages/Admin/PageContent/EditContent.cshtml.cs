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
    [Authorize(Roles = "Admin")]
    public class EditContentModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public EditContentModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        [BindProperty]
        public PageContentView PageContentView { get; set; }
        public List<PageView> Pages { get; set; }

        public async Task GetPages()
        {
            using HttpClient httpClient = new HttpClient();
            var token = HttpContext.Request.Cookies["access_token"];
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            Pages = await httpClient.GetFromJsonAsync<List<PageView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/Pages");
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return null;
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            PageContentView = await httpClient.GetFromJsonAsync<PageContentView>($"{_configuration.GetValue<string>("APIEndpoint")}api/PageContent/{id}");

            if (PageContentView == null)
            {
                return NotFound();
            }
            await GetPages();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await httpClient.PutAsJsonAsync($"{_configuration.GetValue<string>("APIEndpoint")}api/pageContent/{PageContentView.PageContentId}", PageContentView);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./IndexContent");
            }
            return Page();
        }
    }
}
