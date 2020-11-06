using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using StoreFrontLab.DATA.EF;

namespace StoreFront.Controllers
{
    public class FiltersController : Controller
    {

        private StoreFrontProjectEntities db = new StoreFrontProjectEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }
    }
}