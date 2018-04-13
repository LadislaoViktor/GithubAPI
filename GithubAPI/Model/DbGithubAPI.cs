using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace GithubAPI.Model
{
  public class DbGithubAPI:DbContext
  {
    public DbGithubAPI():base("DefaultConnection")
    {
    }
   
    public DbSet<Item> Item { get; set; }
    public DbSet<Owner> Owner { get; set; }
    public DbSet<Permissions> Permission { get; set; }
    public DbSet<License> License { get; set; }
    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
      
      modelBuilder.Entity<Item>()
                  .HasOptional(r => r.owner) 
                  .WithRequired(ow => ow.Item);

      modelBuilder.Entity<Item>()
                  .HasOptional(r => r.license)
                  .WithRequired(l => l.Item);

      modelBuilder.Entity<Item>()
                  .HasOptional(r => r.permission)
                  .WithRequired(p => p.Item);

      base.OnModelCreating(modelBuilder);
    }
  }
}