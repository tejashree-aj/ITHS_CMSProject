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

namespace ITHS_CMSProject.Pages.Title
{
    public class CreateModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;

        public CreateModel(IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _configuration = configuration;
            _userManager = userManager;
        }

        [BindProperty]
        public TitleView Title { get; set; }

        public IActionResult OnGet()
        {
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

            HttpResponseMessage response = await httpClient.PostAsJsonAsync($"{_configuration.GetValue<String>("APIEndpoint")}api/admin/create", Title);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
