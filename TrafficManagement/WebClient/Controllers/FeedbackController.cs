using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebClient.Controllers
{
    public class FeedbackController : Controller
    {
        // GET: Feedback
        public ActionResult All()
        {
            return View();
        }

        public ActionResult Add()
        {
            return View();
        }
    }
}