using DataAccess_CMSProject.DataModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CMS_APIProject.ViewModels
{
    public class PageContentView
    {
        public PageContentView()
        {
        }

        public PageContentView(PageContent content, bool includeContent)
        {
            PageContentId = content.PageContentId;
            if (includeContent)
                Content = content.Content;
            Title = content.Title;
            PageId = content.PageId;          
        }

        public int PageContentId { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }
        public int PageId { get; set; }
    }
}
