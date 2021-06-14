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
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace ITHS_CMSProject.Pages.Admin.BannerImage
{
    public class CreateModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;
        private IHostingEnvironment _hostingEnvironment;
        public CreateModel(IConfiguration configuration, UserManager<UserInformation> userManager, IHostingEnvironment hostingEnvironment)
        {
            _configuration = configuration;
            _userManager = userManager;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public BannerImageView BannerImage { get; set; }

        public IActionResult OnGet()
        {
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(IFormFile file)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            BannerImage = new BannerImageView();

            string wwwPath = this._hostingEnvironment.WebRootPath;
            string path = Path.Combine(this._hostingEnvironment.WebRootPath, _configuration.GetValue<String>("BannerImagePath"));
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //string fileName = Path.GetFileName(file.FileName);
            //using (FileStream stream = new FileStream(Path.Combine(path, fileName), FileMode.Create))
            //{
            //    file.CopyTo(stream);
            //    BannerImage.Add(new BannerImageView
            //    {
            //        ImageURL = $"\\{_configuration.GetValue<String>("ProducImagePath")}{ fileName}"
            //    });
            //}

           

            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await httpClient.PostAsJsonAsync($"{_configuration.GetValue<String>("APIEndpoint")}api/bannerimage/create", BannerImage);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
