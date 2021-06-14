using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages.Admin.Footer
{
    public class EditFooterModel : PageModel
    {
        private readonly ILogger<EditFooterModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;


        public EditFooterModel(IConfiguration configuration, UserManager<UserInformation> userManager, ILogger<EditFooterModel> logger)
        {
            _configuration = configuration;
            _userManager = userManager;
            _logger = logger;
        }



        [BindProperty]
        public FooterView FooterView { get; set; }

        public async Task<IActionResult> OnGet(int? id)
        {
            var token = HttpContext.Request.Cookies["access_token"];

            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            FooterView = await client.GetFromJsonAsync<FooterView>($"{_configuration.GetValue<string>("APIEndpoint")}api/footer/{id}");

            if (FooterView == null)
            {
                return NotFound();
            }
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

            HttpResponseMessage response = await httpClient.PutAsJsonAsync(
                    $"{_configuration.GetValue<string>("APIEndpoint")}api/footer/{FooterView.FooterId}", FooterView);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./IndexFooter");
            }
            return Page();
        }
    }
}
