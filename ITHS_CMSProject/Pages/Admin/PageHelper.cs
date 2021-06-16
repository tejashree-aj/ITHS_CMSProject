using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITHS_CMSProject.Pages.Admin
{
    public static class PageHelper
    {
        public static List<string> GetPageList()
        {
            return new List<string>()
            {
                "/Index",
                "/AboutUs",
                "/Contacts",
                "/Privacy",
                "/Test",
                "/Error"
            };
        }
    }
}
