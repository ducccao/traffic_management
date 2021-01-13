using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API.Models
{
    public class Payment
    {
        public bool TypePay { get; set; }
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}