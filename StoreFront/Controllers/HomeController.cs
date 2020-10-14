using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using StoreFrontLabMVC.UI.MVC.Models;

namespace StoreFront.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "No Playstation users allowed here!! ";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Products()
        {
            ViewBag.Message = "Take a look at what we have to offer!";

            return View();
        }
        public ActionResult Store()
        {
            ViewBag.Message = "Welcome to our store's page.";

            return View();
        }
    }
}