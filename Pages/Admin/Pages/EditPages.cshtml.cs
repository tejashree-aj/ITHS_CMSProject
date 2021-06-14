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

namespace ITHS_CMSProject.Pages.Admin.Pages
{
    [Authorize(Policy = "RequireAdministratorRole")]
    public class EditPagesModel : PageModel
    {
        private readonly ILogger<EditPagesModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        private readonly IWebHostEnvironment _environment;
        public EditPagesModel(IConfiguration configuration, UserManager<UserInformation> userManager, ILogger<EditPagesModel> logger,
            IWebHostEnvironment environment)
        {
            _configuration = configuration;
            _userManager = userManager;
            _logger = logger;
            _environment = environment;
            LoadPageLinks();
        }

        private void LoadPageLinks()
        {
            string pageFolderPath = Path.Combine(_environment.ContentRootPath, "Pages/");
            PageLinks = Directory.GetFiles(pageFolderPath)
                .Where(x => x.EndsWith(".cshtml.cs") == true).Select(x => x.Replace(pageFolderPath, "/").Replace(".cshtml.cs", "")).ToList();
        }

        [BindProperty]
        public PageView PageView { get; set; }

        public List<string> PageLinks { get; set; }

        public async Task<IActionResult> OnGet(int? id)
        {
            var token = HttpContext.Request.Cookies["access_token"];

            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            PageView = await client.GetFromJsonAsync<PageView>($"{_configuration.GetValue<string>("APIEndpoint")}api/pages/{id}");

            if (PageView == null)
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
                    $"{_configuration.GetValue<string>("APIEndpoint")}api/pages/{PageView.PageId}", PageView);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./IndexPages");
            }
            return Page();
        }

    }
}
