using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using QLGT_API.Data;
using QLGT_API.Models;

namespace QLGT_API.Controllers
{
    public class TypeVehiclesController : ApiController
    {
        private QLGT_APIContext db = new QLGT_APIContext();

        // GET: api/TypeVehicles
        public IQueryable<TypeVehicle> GetTypeVehicles()
        {
            return db.TypeVehicles;
        }

        // GET: api/TypeVehicles/5
        [ResponseType(typeof(TypeVehicle))]
        public async Task<IHttpActionResult> GetTypeVehicle(int id)
        {
            TypeVehicle typeVehicle = await db.TypeVehicles.FindAsync(id);
            if (typeVehicle == null)
            {
                return NotFound();
            }

            return Ok(typeVehicle);
        }

        // PUT: api/TypeVehicles/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutTypeVehicle(int id, TypeVehicle typeVehicle)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != typeVehicle.Id)
            {
                return BadRequest();
            }

            db.Entry(typeVehicle).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypeVehicleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/TypeVehicles
        [ResponseType(typeof(TypeVehicle))]
        public async Task<IHttpActionResult> PostTypeVehicle(TypeVehicle typeVehicle)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TypeVehicles.Add(typeVehicle);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = typeVehicle.Id }, typeVehicle);
        }

        // DELETE: api/TypeVehicles/5
        [ResponseType(typeof(TypeVehicle))]
        public async Task<IHttpActionResult> DeleteTypeVehicle(int id)
        {
            TypeVehicle typeVehicle = await db.TypeVehicles.FindAsync(id);
            if (typeVehicle == null)
            {
                return NotFound();
            }

            db.TypeVehicles.Remove(typeVehicle);
            await db.SaveChangesAsync();

            return Ok(typeVehicle);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TypeVehicleExists(int id)
        {
            return db.TypeVehicles.Count(e => e.Id == id) > 0;
        }
    }
}