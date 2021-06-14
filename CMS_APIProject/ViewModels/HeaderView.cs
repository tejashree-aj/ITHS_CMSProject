using DataAccess_CMSProject.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CMS_APIProject.ViewModels
{
    public class HeaderView
    {
        public HeaderView(Header header)
        {
            HeaderId = header.HeaderId;
            HtmlText = header.HtmlText;
                
        }

        public HeaderView()
        {

        }
        public int HeaderId { get; set; }

        public string HtmlText { get; set; }

        //public int PageId { get; set; }

        //public PagesView PagesView { get; set; }
    }
}
