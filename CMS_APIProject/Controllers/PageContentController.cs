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
    [AllowAnonymous]
    [Route("api/[controller]")]
    [ApiController]
    public class PageContentController : Controller
    {

        private readonly CMSDBContext _context;
        public PageContentController(CMSDBContext context)
        {
            _context = context;
        }

        // GET: api/PageContent
        [HttpGet("PageContentByPage/{id}")]
        public async Task<ActionResult<PageContentView>> GetPageContentByPageId(int id)
        {
            var content = await _context.PageContents.Where(x => x.PageId == id).Select(p => new PageContentView(p, true)).FirstOrDefaultAsync();

            return content;
        }


        // GET: api/PageContent
        [HttpGet("AdminView")]
        [Authorize(Policy = "RequireAdministratorRole")]
        public async Task<ActionResult<IEnumerable<PageContentView>>> GetAllPageContents()
        {
            var content = await _context.PageContents.Include(p => p.Pages).Select(p => new PageContentView(p, false)).ToListAsync();

            return content;
        }


        // GET: api/PageContent/5
        [HttpGet()]
        [Route("{id:int}")]

        public async Task<ActionResult<PageContentView>> GetPageContent(int id)
        {
            var contentView = await _context.PageContents.Where(x => x.PageContentId == id).Select(content =>
                          new PageContentView(content, true)).FirstOrDefaultAsync();

            // Get page from database
            if (contentView == null)
            {
                return NotFound();
            }
            return contentView;
        }



        // POST: api/PageContent
        //[Authorize(Policy = "RequireAdministratorRole")]
        [HttpPost]
        [Route("Create")]
        public async Task<ActionResult<PageContentView>> PostPageContent(PageContentView pageContentView)
        {
            PageContent pageContent = new PageContent
            {
                Title = pageContentView.Title,
                Content = pageContentView.Content,
                PageId = pageContentView.PageId
            };

            _context.PageContents.Add(pageContent);
            await _context.SaveChangesAsync();
            return NoContent();
        }


        // PUT: api/pageContent/5
        [Authorize(Policy = "RequireAdministratorRole")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPageContent(int id, PageContentView pageContentView)
        {
            PageContent pageContents = await _context.PageContents.FindAsync(id);

            if (id != pageContentView.PageContentId)
            {
                return BadRequest();
            }
            else
            {
                pageContents.Title = pageContentView.Title;
                pageContents.Content = pageContentView.Content;
                pageContents.PageId = pageContentView.PageId;
            }

            _context.Entry(pageContents).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                if (!TitleExists(id))
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

        private bool TitleExists(int id)
        {
            return _context.PageContents.Any(e => e.PageContentId == id);
        }


        // DELETE: api/pageContent/5
        [Authorize(Policy = "RequireAdministratorRole")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePageCntent(int id)
        {
            var pageContent = await _context.PageContents.FindAsync(id);
            if (pageContent == null)
            {
                return NotFound();
            }

            _context.PageContents.Remove(pageContent);
            await _context.SaveChangesAsync();

            return NoContent();
        }

    }
}
