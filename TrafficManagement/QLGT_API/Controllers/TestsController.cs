﻿using System;
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
    public class TestsController : ApiController
    {
        private QLGT_APIContext db = new QLGT_APIContext();

        // GET: api/Tests
        public IQueryable<Test> GetTests()
        {
            return db.Tests;
        }

        // GET: api/Tests/5
        [ResponseType(typeof(Test))]
        public async Task<IHttpActionResult> GetTest(int id)
        {
            Test test = await db.Tests.FindAsync(id);
            if (test == null)
            {
                return NotFound();
            }

            return Ok(test);
        }

        // PUT: api/Tests/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutTest(int id, Test test)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != test.Id)
            {
                return BadRequest();
            }

            db.Entry(test).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestExists(id))
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

        // POST: api/Tests
        [ResponseType(typeof(Test))]
        public async Task<IHttpActionResult> PostTest(Test test)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Tests.Add(test);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = test.Id }, test);
        }

        // DELETE: api/Tests/5
        [ResponseType(typeof(Test))]
        public async Task<IHttpActionResult> DeleteTest(int id)
        {
            Test test = await db.Tests.FindAsync(id);
            if (test == null)
            {
                return NotFound();
            }

            db.Tests.Remove(test);
            await db.SaveChangesAsync();

            return Ok(test);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TestExists(int id)
        {
            return db.Tests.Count(e => e.Id == id) > 0;
        }
    }
}