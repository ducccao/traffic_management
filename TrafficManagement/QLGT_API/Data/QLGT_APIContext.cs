﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace QLGT_API.Data
{
    public class QLGT_APIContext : DbContext    
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public QLGT_APIContext() : base("name=QLGT_APIContext")
        {
        }

        public System.Data.Entity.DbSet<QLGT_API.Models.Customer> Customers { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Profile> Profiles { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Vehicle> Vehicles { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Schedule> Schedules { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Feedback> Feedbacks { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Test> Tests { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.Payment> Payments { get; set; }

        public System.Data.Entity.DbSet<QLGT_API.Models.TypeVehicle> TypeVehicles { get; set; }
    }
}
