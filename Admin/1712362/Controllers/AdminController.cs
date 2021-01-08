using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace _1712362.Models
{
    public class AdminController : ApiController
    {
        Admin[] Admin = new Admin[]
        {
            new Admin {  idAdmin = "11", name = "Duc Cao", password = "1", username =" duccao1 "},
          new Admin {  idAdmin = "22", name = "Duc Cao", password = "1", username = "duccao2" },
              new Admin {  idAdmin = "33", name = "Duc Cao", password = "1", username = "duccao3"}
        };
        // GET api/admin
        public IEnumerable<Admin> GetAllStudents()
        {
            return Admin;
        }

        // GET api/admin/id
        public IHttpActionResult GetAdminByID(String id)
        {

            var admin = Admin.FirstOrDefault((ad) => ad.idAdmin == id);

            if (admin == null)
            {
                return NotFound();
            }
            return Ok(admin);
        }

      


    }
}