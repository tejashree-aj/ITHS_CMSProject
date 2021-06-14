using DataAccess_CMSProject.DataModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
//using System.Data.Entity;
using System.Text;

namespace DataAccess_CMSProject
{
    public class CMSDBContext : DbContext
    {
        public CMSDBContext(DbContextOptions<CMSDBContext> options) : base(options)
        {

        }

        public DbSet<Pages> Pages { get; set; }

        public DbSet<Blog> Blogs { get; set; }

        public DbSet<PageContent> PageContents { get; set; }

        public DbSet<Footer> Footers { get; set; }

        public DbSet<Header> Headers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {          

            base.OnModelCreating(modelBuilder);
        }
    }
}
