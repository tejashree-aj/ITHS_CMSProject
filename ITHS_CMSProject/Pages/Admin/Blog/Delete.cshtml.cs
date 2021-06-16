using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages.Admin.Blog
{
    [Authorize(Roles = "Admin")]
    public class DeleteModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public DeleteModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }
        [BindProperty]
        public BlogView Blog { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            Blog = await httpClient.GetFromJsonAsync<BlogView>($"{_configuration.GetValue<string>("APIEndpoint")}api/Blog/{id}");

            if (Blog == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            HttpResponseMessage response = await httpClient.DeleteAsync($"{_configuration.GetValue<string>("APIEndpoint")}api/Blog/{id.Value}");
            return RedirectToPage("./Index");
        }
    }
}
