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
    public class FooterController : Controller
    {
        private readonly CMSDBContext _context;
        public FooterController(CMSDBContext context)
        {
            _context = context;
        }
        // GET: api/Footer
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<FooterView>>> GetFooter()
        {
            var header = await _context.Footers.Select(f => new FooterView
            {
                FooterId = f.FooterId,
                HtmlText = f.HtmlText
            }).ToListAsync();

            return header;
        }

        // GET: api/Footer/5
        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<ActionResult<FooterView>> GetHeader(int id)
        {
            var footerView = await _context.Footers.Where(x => x.FooterId == id).Select(footer =>
                            new FooterView(footer)).FirstOrDefaultAsync();

            //get footer from database
            if (footerView == null)
            {
                return NotFound();
            }

            return footerView;
        }

        // POST: api/Footer
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<ActionResult<Header>> PostFooter(FooterView footerView)
        {
            Footer footer = new Footer
            {
                HtmlText = footerView.HtmlText
            };

            _context.Footers.Add(footer);
            await _context.SaveChangesAsync();
            return NoContent();
        }

        // PUT: api/Footer/5
        [Authorize(Roles = "Admin")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFooter(int id, FooterView footerView)
        {
            Footer footer = await _context.Footers.FindAsync(id);

            if (id != footerView.FooterId)
            {
                return BadRequest();
            }
            else
            {
                footer.HtmlText = footerView.HtmlText;
            }

            _context.Entry(footer).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                if (!FooterExists(id))
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



        private bool FooterExists(int id)
        {
            return _context.Headers.Any(e => e.HeaderId == id);
        }

    }
}
