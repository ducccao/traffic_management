using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API.Models
{
    public class Video
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string URL { get; set; }
    }
}