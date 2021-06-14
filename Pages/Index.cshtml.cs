using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;


        public IndexModel(ILogger<IndexModel> logger, IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _logger = logger;
            _configuration = configuration;
            _userManager = userManager;
        }

        [BindProperty]

        public IList<PageView> Pages { get; set; }
        public IList<PageContentView> Title { get; set; }
        public IList<BlogView> Blogs { get; set; }

        public HeaderView HeaderView { get; set; }
        public FooterView FooterView { get; set; }

        public BlogView FeatureBlog { get; set; }

        /// <summary>  
        /// GET: /Index  
        /// </summary>  
        /// <returns>Returns - Appropriate page </returns>  
        public async Task<IActionResult> OnGetAsync()
        {
            using HttpClient httpClient = new HttpClient();
            //Title = await httpClient.GetFromJsonAsync<IList<TitleView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/title");
            Pages = await httpClient.GetFromJsonAsync<IList<PageView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/pages");
            HeaderView = await httpClient.GetFromJsonAsync<HeaderView>($"{_configuration.GetValue<string>("APIEndpoint")}api/header/1");
            FooterView = await httpClient.GetFromJsonAsync<FooterView>($"{_configuration.GetValue<string>("APIEndpoint")}api/footer/1");
            Blogs = await httpClient.GetFromJsonAsync<IList<BlogView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/Blog");

            var randomBlogId = new Random().Next(0, Blogs.Count - 1);
            FeatureBlog = new BlogView
            {
                Author = Blogs[randomBlogId].Author,
                BlogId = Blogs[randomBlogId].BlogId,
                Content = Blogs[randomBlogId].Content,
                ImageURL = Blogs[randomBlogId].ImageURL,
                Title = Blogs[randomBlogId].Title
            };

            Blogs.RemoveAt(randomBlogId);
            return Page();
        }
    }
}
