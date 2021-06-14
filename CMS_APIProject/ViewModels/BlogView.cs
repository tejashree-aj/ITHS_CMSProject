using DataAccess_CMSProject.DataModels;
using System.ComponentModel.DataAnnotations;

namespace CMS_APIProject.ViewModels
{
    public class BlogView
    {
        public BlogView()
        {

        }
        public BlogView(Blog blog, bool includeContent)
        {
            BlogId = blog.BlogId;
            if (includeContent)
                Content = blog.Content;
            Title = blog.Title;
            ImageURL = blog.ImageURL;
            Author = blog.Author;
        }

        public int BlogId { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Author { get; set; }

        public string ImageURL { get; set; }
    }
}
