using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;
using ITHS_CMSProject.Areas.Identity.Data;
using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace ITHS_CMSProject.Pages.Admin.Header
{
    [Authorize(Roles = "Admin")]
    public class EditHeaderModel : PageModel
    {
        private readonly ILogger<EditHeaderModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        
        public EditHeaderModel(IConfiguration configuration, UserManager<UserInformation> userManager, ILogger<EditHeaderModel> logger)
        {
            _configuration = configuration;
            _userManager = userManager;
            _logger = logger;
        }

       

        [BindProperty]
        public HeaderView HeaderView { get; set; }

        public async Task<IActionResult> OnGet(int? id)
        {
            var token = HttpContext.Request.Cookies["access_token"];

            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HeaderView = await client.GetFromJsonAsync<HeaderView>($"{_configuration.GetValue<string>("APIEndpoint")}api/header/{id}");

            if (HeaderView == null)
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
                    $"{_configuration.GetValue<string>("APIEndpoint")}api/header/{HeaderView.HeaderId}", HeaderView);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./IndexHeader");
            }
            return Page();
        }
    }
}
