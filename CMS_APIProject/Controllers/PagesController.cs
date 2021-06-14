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
    public class PagesController : Controller
    {
        private readonly CMSDBContext _context;

        public PagesController(CMSDBContext context)
        {
            _context = context;
        }

        // GET: api/Pages
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PagesView>>> GetPages()
        {
            var pages = await _context.Pages.Where(x => !x.IsDeleted).Select(p => new PagesView
            {
                PageId = p.PageId,
                PageName = p.PageName,
                PageLink = p.PageLink
            }).ToListAsync();

            return pages;

        }

        [HttpGet("AdminView")]
        [Authorize(Policy = "RequireAdministratorRole")]
        public async Task<ActionResult<IEnumerable<PagesView>>> GetAllPages()
        {
            var pages = await _context.Pages.Select(p => new PagesView
            {
                PageId = p.PageId,
                PageName = p.PageName,
                PageLink = p.PageLink,
                IsDeleted = p.IsDeleted
            }).ToListAsync();

            return pages;

        }


        // GET: api/Pages/5
        //[Authorize(Policy = "RequireAdministratorRole")]
        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<PagesView>> GetPage(int id)
        {
            var pageView = await _context.Pages.Where(x => x.PageId == id).Select(page =>
                          new PagesView(page)).FirstOrDefaultAsync();

            // Get page from database
            if (pageView == null)
            {
                return NotFound();
            }
            return pageView;
        }

        //[Authorize(Policy = "RequireAdministratorRole")]
        [HttpPost]
        public async Task<ActionResult<Pages>> PostProduct(PagesView pageView)
        {
            Pages page = new Pages
            {
                PageName = pageView.PageName,
                PageLink = pageView.PageLink,
                IsDeleted = false

            };

            _context.Pages.Add(page);
            await _context.SaveChangesAsync();

            return NoContent();
        }


        // GET: api/Pages/5
        //[Authorize(Policy = "RequireAdministratorRole")]
        [HttpPut("{id}")]
        public async Task<ActionResult> PutPages(int id, PagesView pages)
        {
            Pages pageDB = await _context.Pages.FindAsync(id);

            if (pageDB == null)
            {
                return NotFound();
            }
            else
            {
                pageDB.PageName = pages.PageName;
                pageDB.PageLink = pages.PageLink;
                pageDB.IsDeleted = pages.IsDeleted;
            }

            _context.Entry(pageDB).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PageExists(id))
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

        
        private bool PageExists(int id)
        {
            return _context.Pages.Any(e => e.PageId == id);
        }
    }
}
