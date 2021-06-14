using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Threading.Tasks;


namespace ITHS_CMSProject.Pages.Admin.Blog
{
    public class EditModel : PageModel
    {
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;
        private readonly IHostingEnvironment _hostingEnvironment;

        public EditModel(IConfiguration configuration, UserManager<UserInformation> userManager,
             IHostingEnvironment hostingEnvironment)
        {
            _configuration = configuration;
            _userManager = userManager;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public BlogView Blog { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Blog = await GetBlog(id.Value);

            if (Blog == null)
            {
                return NotFound();
            }
            return Page();
        }

        private async Task<BlogView> GetBlog(int id)
        {
            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return null;
            }
            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            return await httpClient.GetFromJsonAsync<BlogView>($"{_configuration.GetValue<string>("APIEndpoint")}api/Blog/{id}");
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync(List<IFormFile> files)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (files.Count > 0)
            {

                string path = Path.Combine(this._hostingEnvironment.WebRootPath, _configuration.GetValue<string>("BlogImagePath"));
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                foreach (IFormFile postedFile in files)
                {
                    string fileName = Path.GetFileName(postedFile.FileName);
                    using (FileStream stream = new FileStream(Path.Combine(path, fileName), FileMode.Create))
                    {
                        postedFile.CopyTo(stream);
                        Blog.ImageURL = $"\\{_configuration.GetValue<string>("BlogImagePath")}{ fileName}";
                    }
                }
            }
            else
            {
                BlogView blogView = await GetBlog(Blog.BlogId);
                Blog.ImageURL = blogView.ImageURL;

                if (Blog == null)
                {
                    return NotFound();
                }
            }

            var token = HttpContext.Request.Cookies["access_token"];
            if (string.IsNullOrEmpty(token))
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            using HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await httpClient.PutAsJsonAsync($"{_configuration.GetValue<string>("APIEndpoint")}api/blog/{Blog.BlogId}", Blog);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
