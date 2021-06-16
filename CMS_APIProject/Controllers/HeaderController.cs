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
    public class HeaderController : Controller
    {
        private readonly CMSDBContext _context;
        public HeaderController(CMSDBContext context)
        {
            _context = context;
        }

        // GET: api/Header
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<HeaderView>>> GetHeader()
        {
            var header = await _context.Headers.Select(h => new HeaderView
            {
                HeaderId = h.HeaderId,
                HtmlText = h.HtmlText
            }).ToListAsync();

            return header;
        }

        // GET: api/Header/5
        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<ActionResult<HeaderView>> GetHeader(int id)
        {
            var headerView = await _context.Headers.Where(x => x.HeaderId == id).Select(header => 
                            new HeaderView(header)).FirstOrDefaultAsync();

            //get header from database
            if (headerView == null)
            {
                return NotFound();
            }

            return headerView;
        }


        // POST: api/Header
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<ActionResult<Header>> PostHeader(HeaderView headerView)
        {
            Header header = new Header
            {
                HtmlText = headerView.HtmlText
            };

            _context.Headers.Add(header);
            await _context.SaveChangesAsync();
            return NoContent();
        }


        // PUT: api/Header/5
        [Authorize(Roles = "Admin")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHeader(int id, HeaderView headerView)
        {
            Header header = await _context.Headers.FindAsync(id);

            if (id != headerView.HeaderId)
            {
                return BadRequest();
            }
            else
            {
                header.HtmlText = headerView.HtmlText;              
            }

            _context.Entry(header).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                if (!HeaderExists(id))
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



        private bool HeaderExists(int id)
        {
            return _context.Headers.Any(e => e.HeaderId == id);
        }
    }
}
