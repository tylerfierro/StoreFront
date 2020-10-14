using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFront.Controllers
{
    public class GamesController : Controller
    {
        private StoreFrontProject db = new StoreFrontProject();
        // GET: Games
        public ActionResult Index()
        {
            return View();
        }
    }
}