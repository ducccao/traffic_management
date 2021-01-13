using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API.Models
{
    public class Feedback
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public DateTime Date { get; set; }
    }
}