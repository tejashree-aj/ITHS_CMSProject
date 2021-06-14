using DataAccess_CMSProject.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CMS_APIProject.ViewModels
{
    public class PagesView
    {
        public int PageId { get; set; }      

        public string PageName { get; set; }

        public string PageLink { get; set; }

        public bool IsDeleted { get; set; }

        public PagesView()
        {
        }

        public PagesView(Pages page)
        {
            PageId = page.PageId;
            PageName = page.PageName;
            PageLink = page.PageLink;
            IsDeleted = page.IsDeleted;
        }
    }
}
