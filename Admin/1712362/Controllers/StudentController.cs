using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace _1712362.Models
{
    public class StudentController : ApiController
        {
        Student[] students = new Student[]
        {
            new Student {  MSSV = "1712362", Name = "Duc Cao", Address = "Quan 8", BornYear = 1999 },
            new Student {MSSV = "1712645", Name = "Nhung Bui", Address = "CG", BornYear = 1999 },
            new Student {MSSV = "1712171", Name = "Anonymous", Address = "Dormitory B", BornYear = 1999 },
        };
        // GET api/student
        public IEnumerable<Student> GetAllStudents()
        {
            return students;
        }

        // GET api/student/mssv
        public IHttpActionResult GetStudentByMSSV(String mssv)
        {

            var student = students.FirstOrDefault((st) => st.MSSV == mssv);

            if (student == null)
            {
                return NotFound();
            }
            return Ok(student);
        }


    }
}