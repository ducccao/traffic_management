using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API.Models
{
    public class Vehicle
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Capacity { get; set; }
        public string Type { get; set; }
        public string LicensePlates { get; set; }
        public double Price { get; set; }
        public DateTime SignedUpDate { get; set; }
        public bool Status { get; set; }

    }
}