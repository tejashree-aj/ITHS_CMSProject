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
using Microsoft.Extensions.Logging;

namespace ITHS_CMSProject.Pages.Title
{
    public class EditModel : PageModel
    {
        private readonly ILogger<EditModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;


        public EditModel( IConfiguration configuration, UserManager<UserInformation> userManager, ILogger<EditModel> logger)
        {
            _configuration = configuration;
            _userManager = userManager;
            _logger = logger;
        }

        [BindProperty]
        public TitleView Title { get; set; }

        public async Task<IActionResult> OnGet(int? id)
        {
            var token = HttpContext.Request.Cookies["access_token"];

            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient client = new();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            Title = await client.GetFromJsonAsync<TitleView>($"{_configuration.GetValue<string>("APIEndpoint")}api/admin/{id.Value}");

            if (Title == null)
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
                    $"{_configuration.GetValue<string>("APIEndpoint")}api/admin/{Title.TitleId}", Title);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }


    }
}
