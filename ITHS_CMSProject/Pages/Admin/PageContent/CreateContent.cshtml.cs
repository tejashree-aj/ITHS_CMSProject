using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;
using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authorization;

namespace ITHS_CMSProject.Pages.Admin.PageContent
{
    [Authorize(Roles = "Admin")]
    public class CreateContentModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public CreateContentModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        public string SearchString { get; set; }

        [BindProperty]
        public PageContentView PageContent { get; set; }

        public List<PageView> Pages { get; set; }

        public async Task<IActionResult> OnGet()
        {
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

            HttpResponseMessage response = await httpClient.PostAsJsonAsync($"{_configuration.GetValue<string>("APIEndpoint")}api/pagecontent/Create", PageContent);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./IndexContent");
            }
            return Page();
        }

        public async Task GetPages()
        {
            using HttpClient httpClient = new HttpClient();
            var token = HttpContext.Request.Cookies["access_token"];
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            Pages = await httpClient.GetFromJsonAsync<List<PageView>>($"{_configuration.GetValue<String>("APIEndpoint")}api/Pages");

            Pages = Pages.Where(x => x.PageId > 1).ToList();
        }

    }
}
