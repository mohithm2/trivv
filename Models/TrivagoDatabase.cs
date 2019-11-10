namespace Trivago.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TrivagoDatabase : DbContext
    {
        public TrivagoDatabase()
            : base("name=TrivagoDatabase")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Agent> Agents { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Hotel> Hotels { get; set; }
        public virtual DbSet<Hotel_Booking> Hotel_Booking { get; set; }
        public virtual DbSet<Package> Packages { get; set; }
        public virtual DbSet<Package_Booking> Package_Booking { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Agent>()
                .Property(e => e.AGENTID)
                .IsUnicode(false);

            modelBuilder.Entity<Agent>()
                .Property(e => e.NAME)
                .IsUnicode(false);

            modelBuilder.Entity<Agent>()
                .Property(e => e.LOCATION)
                .IsUnicode(false);

            modelBuilder.Entity<Agent>()
                .Property(e => e.CONTACT)
                .IsUnicode(false);

            modelBuilder.Entity<Agent>()
                .Property(e => e.EMAIL)
                .IsUnicode(false);

            modelBuilder.Entity<Agent>()
                .Property(e => e.PASSWORD)
                .IsUnicode(false);

            modelBuilder.Entity<AspNetRole>()
                .HasMany(e => e.AspNetUsers)
                .WithMany(e => e.AspNetRoles)
                .Map(m => m.ToTable("AspNetUserRoles").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserClaims)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.AspNetUserLogins)
                .WithRequired(e => e.AspNetUser)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<Customer>()
                .Property(e => e.CUSTOMERID)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.NAME)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.LOCATION)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.CONTACT)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.EMAIL)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.PASSWORD)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Hotel_Booking)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Package_Booking)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.HOTELID)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.NAME)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.CONTACT)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.LOCATION)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.DESCRIPTION)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .Property(e => e.AGENTID)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel>()
                .HasMany(e => e.Hotel_Booking)
                .WithRequired(e => e.Hotel)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Hotel_Booking>()
                .Property(e => e.HOTELID)
                .IsUnicode(false);

            modelBuilder.Entity<Hotel_Booking>()
                .Property(e => e.CUSTOMERID)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.PACKAGEID)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.PRICE)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.DESCRIPTION)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.ACTIVITIES)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.NO_OF_DAYS)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.PLACES)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .Property(e => e.AGENTID)
                .IsUnicode(false);

            modelBuilder.Entity<Package>()
                .HasMany(e => e.Package_Booking)
                .WithRequired(e => e.Package)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Package_Booking>()
                .Property(e => e.PACKAGEID)
                .IsUnicode(false);

            modelBuilder.Entity<Package_Booking>()
                .Property(e => e.CUSTOMERID)
                .IsUnicode(false);
        }
    }
}
