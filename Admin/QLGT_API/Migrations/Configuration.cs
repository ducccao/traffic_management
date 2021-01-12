namespace QLGT_API.Migrations
{
    using QLGT_API.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<QLGT_API.Data.QLGT_APIContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(QLGT_API.Data.QLGT_APIContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.

            context.Customers.AddOrUpdate(x => x.Id,
new Customer() { Id = 1, Name = "Duc", Address = "asd", Password = "123", Phone = "123", UserName = "duccao" }

      );

        }
    }
}
