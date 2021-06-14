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
    [ApiController] 
    [Route("api/[controller]")]
    public class BannerImageController : Controller
    {
        private readonly CMSDBContext _context;


        public BannerImageController(CMSDBContext context)
        {
            _context = context;
        }

        //// GET: api/Admin
        //[HttpGet]
        //public async Task<List<BannerImageView>> GetBannerImage()
        //{
        //    var bannerImage = await _context.BannerImage.Select(x => new BannerImageView { ImageId = x.ImageId, ImageURL = x.ImageURL }).ToListAsync();

        //    return bannerImage;
        //}

        //// POST: api/Admin
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //[Route("Create")]
        //public async Task<ActionResult<BannerImage>> PostCategory(BannerImage bannerImage)
        //{
            
        //    _context.BannerImage.Select(x => new BannerImage {ImageURL = x.ImageURL }).ToList().Add(bannerImage);
        //    await _context.SaveChangesAsync();
        //    return NoContent();
        //}

        //public IActionResult Index()
        //{
        //    return View();
        //}
    }
} 
