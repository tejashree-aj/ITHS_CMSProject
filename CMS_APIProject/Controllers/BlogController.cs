using CMS_APIProject.ViewModels;
using DataAccess_CMSProject;
using DataAccess_CMSProject.DataModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace CMS_APIProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        private readonly CMSDBContext _context;

        public BlogController(CMSDBContext context)
        {
            _context = context;
        }

        [HttpGet()]
        public async Task<ActionResult<IEnumerable<BlogView>>> GetAllBlogsView()
        {
            var blogs = await _context.Blogs.Select(p => new BlogView(p, true)).ToListAsync();

            return blogs;
        }

        [HttpGet("AdminView")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<BlogView>>> GetAllBlogs()
        {
            var blogs = await _context.Blogs.Select(p => new BlogView(p, false)).ToListAsync();

            return blogs;
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<BlogView>> GetBlog(int id)
        {
            var blogView = await _context.Blogs.Where(x => x.BlogId == id).Select(blog =>
                          new BlogView(blog, true)).FirstOrDefaultAsync();

            // Get page from database
            if (blogView == null)
            {
                return NotFound();
            }
            return blogView;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<ActionResult> PostBlog(BlogView blogView)
        {
            Blog blog = new Blog
            {
                ImageURL = blogView.ImageURL,
                Author = blogView.Author,
                Content = blogView.Content,
                Title = blogView.Title
            };

            _context.Blogs.Add(blog);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/Blogs/5
        [Authorize(Roles = "Admin")]
        [HttpPut("{id}")]
        public async Task<ActionResult> PutBlogs(int id, BlogView blog)
        {
            Blog blogDB = await _context.Blogs.FindAsync(id);

            if (blogDB == null)
            {
                return NotFound();
            }
            else
            {
                blogDB.ImageURL = blog.ImageURL;
                blogDB.Author = blog.Author;
                blogDB.Content = blog.Content;
                blogDB.Title = blog.Title;
            }

            _context.Entry(blogDB).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BlogExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return NoContent();
        }

        [Authorize(Roles = "Admin")]
        // DELETE: api/TodoItems/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBlog(int id)
        {
            var blog = await _context.Blogs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            _context.Blogs.Remove(blog);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        private bool BlogExists(int id)
        {
            return _context.Blogs.Any(e => e.BlogId == id);
        }
    }
}
