using ITHS_CMSProject.ModelClasses;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    [IgnoreAntiforgeryToken]
    public class ErrorModel : PageModel
    {
        public string RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);

        private readonly ILogger<ErrorModel> _logger;
        private readonly IConfiguration _configuration;

        public ErrorModel(ILogger<ErrorModel> logger,IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;

        }

        [BindProperty]

        public IList<PageView> Pages { get; set; }
        public IList<PageContentView> Title { get; set; }
        public HeaderView HeaderView { get; set; }
        public FooterView FooterView { get; set; }


        /// <summary>  
        /// GET: /Index  
        /// </summary>  
        /// <returns>Returns - Appropriate page </returns>  
        public async Task<IActionResult> OnGetAsync()
        {
            RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier;

            using HttpClient httpClient = new HttpClient();
            //Title = await httpClient.GetFromJsonAsync<IList<TitleView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/title");
            Pages = await httpClient.GetFromJsonAsync<IList<PageView>>($"{_configuration.GetValue<string>("APIEndpoint")}api/pages");

            HeaderView = await httpClient.GetFromJsonAsync<HeaderView>($"{_configuration.GetValue<string>("APIEndpoint")}api/header/1");
            FooterView = await httpClient.GetFromJsonAsync<FooterView>($"{_configuration.GetValue<string>("APIEndpoint")}api/footer/1"); 
            return Page();

        }
    }
}
