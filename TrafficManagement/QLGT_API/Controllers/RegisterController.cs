using QLGT_API.Data;
using QLGT_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace QLGT_API.Controllers
{
    public class RegisterController : ApiController
    {
        private QLGT_APIContext db = new QLGT_APIContext();
        // GET: Register
        [HttpPost]
        [Route("api/register")]
        public async Task<IHttpActionResult> Register(Customer customer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (customer.Phone==null|| customer.Address==null|| customer.Name==null|| customer.UserName==null|| customer.Password == null)
            {
                return BadRequest("Please fill in the form");
            }
            if (db.Customers.Any(k => k.UserName.Equals(customer.UserName))){
                return BadRequest("This username has been taken");
            }
            // Check password length
            if (customer.Password.Length < 8)
            {
                return BadRequest("Minimum password length is 8.");
            }

            if (!customer.Password.Any(c => char.IsLower(c)))
            {
                return BadRequest("Password must include at least 1 lower character.");
                
            }

            if (!customer.Password.Any(c => char.IsUpper(c)))
            {
                return BadRequest("Password must include at least 1 upper character.");

            }

            db.Customers.Add(new Customer()
            {
                Phone = customer.Phone,
                Address = customer.Address,
                Name = customer.Name,
                UserName = customer.UserName,
                Password = Encrypt.ConvertToEncrypt(customer.Password)
            });
            db.SaveChanges();
            return Ok();
        }
    }
}
