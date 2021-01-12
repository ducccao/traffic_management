using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLGT_API.Models
{
    public class Profile
    {
        public int Id { get; set; }


        public string Avatar { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}