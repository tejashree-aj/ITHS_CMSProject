using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess_CMSProject.DataModels;

namespace CMS_APIProject.ViewModels
{
    public class FooterView
    {
        public int FooterId { get; set; }
        public string HtmlText { get; set; }


        public FooterView()
        {

        }

        public FooterView(Footer footer)
        {
            FooterId = footer.FooterId;
            HtmlText = footer.HtmlText;
        }
    }
}
