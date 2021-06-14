using ITHS_CMSProject.ModelClasses;
using ITHS_CMSProject.Pages.Admin.Identity.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;


namespace ITHS_CMSProject.Pages
{
    public class BlogModel : PageModel
    {
        private readonly ILogger<BlogModel> _logger;
        private readonly UserManager<UserInformation> _userManager;
        private readonly IConfiguration _configuration;


        public BlogModel(ILogger<BlogModel> logger, IConfiguration configuration, UserManager<UserInformation> userManager)
        {
            _logger = logger;
            _configuration = configuration;
            _userManager = userManager;
        }

        [BindProperty]
        public BlogView BlogView { get; set; }
        public IList<PageView> Pages { get; set; }
        public HeaderView HeaderView { get; set; }
        public FooterView FooterView { get; set; }

        /// <summary>  
        /// GET: /Index  
        /// </summary>  
        /// <returns>Returns - Appropriate page </returns>  
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            using HttpClient httpClient = new HttpClient();
            Pages = await httpClient.GetFromJsonAsync<IList<PageView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/pages");
                        
            BlogView = await httpClient.GetFromJsonAsync<BlogView>($"{_configuration.GetValue<string>("APIEndpoint")}api/Blog/{id}");

            HeaderView = await httpClient.GetFromJsonAsync<HeaderView>($"{_configuration.GetValue<string>("APIEndpoint")}api/header/1");
            FooterView = await httpClient.GetFromJsonAsync<FooterView>($"{_configuration.GetValue<string>("APIEndpoint")}api/footer/1"); 
            return Page();

        }
    }
}
