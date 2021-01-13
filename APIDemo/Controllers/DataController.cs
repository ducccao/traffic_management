using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Security.Claims;

namespace APIDemo.Controllers
{
    public class DataController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/authorize")]
        public IHttpActionResult Get()
        {
            var identity = (ClaimsIdentity)User.Identity;
            return Ok("Hello " + identity.Name);
        }
    }
}
