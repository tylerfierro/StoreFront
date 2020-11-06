using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF;
using System.Web.Mvc;
using System.Net;
using System.Drawing;
using System.Data;
using System.Data.Entity;
using StoreFront.Utilities;
using StoreFront.Models;

namespace StoreFront.Controllers
{
    public class GamesController : Controller
    {
        private StoreFrontProjectEntities db = new StoreFrontProjectEntities();

        // GET: Games
        public ActionResult Index()
        {
            var games = db.Games.Include(g => g.XboxEmployees).Include(g => g.XboxStatus).Include(g => g.Xbox).Include(g => g.Department_s).Include(g => g.Employee_s);
            return View(games.ToList());
        }

        // GET: Games/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            return View(game);
        }

        // GET: Games/Create
        public ActionResult Create()
        {
            ViewBag.GameID = new SelectList(db.XboxEmployees, "GameID", "GameID");
            ViewBag.DepartmentsID = new SelectList(db.Department_s, "DepartmentsID", "DeptName");
            ViewBag.EmployeeID = new SelectList(db.Employee_s, "EmployeeID", "GenreName");
            ViewBag.XboxID = new SelectList(db.Xbox, "XboxID", "G_Company");
            return View();
        }

        // POST: Games/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GameID,G_Name,G_Company,GamePrice,G_Description,G_UnitsSold,GameImage,ReleaseDate")] Game game, HttpPostedFileBase gameCover)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";

                if (gameCover != null)
                {
                    file = gameCover.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    // check that the uploaded file ext is in our list of good file extensions 
                    if (goodExts.Contains(ext))
                    {
                        // if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (gameCover.ContentLength <= 4194304)
                        {
                            // create a new file name using a guid 
                            file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/imgstore/books/");
                            Image convertedImage = Image.FromStream(gameCover.InputStream);
                            int maxImageSize = 500;
                            int maxThumbSize = 100;
                            ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion
                        }
                    }
                    book.BookImage = file;

                }
                #endregion

                db.Games.Add(game);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GameID = new SelectList(db.XboxEmployees, "GameID", "GameID", game.GameID);
            ViewBag.DepartmentsID = new SelectList(db.Department_s, "DepartmentsID", "DeptName", game.Department_s);
            ViewBag.EmployeeID = new SelectList(db.Employee_s, "EmployeeID", "GenreName", game.Employee_s);
            ViewBag.XboxID = new SelectList(db.Xbox, "XboxID", "G_Company", game.Xbox);
            return View(game);
        }
 
        // GET: Games/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Games.Find(id);
            if (game == null)
            {
                return HttpNotFound();
            }
            ViewBag.GameID = new SelectList(db.XboxEmployees, "GameID", "GameID", game.GameID);
            ViewBag.DepartmentsID = new SelectList(db.Department_s, "DepartmentsID", "DeptName", game.Department_s);
            ViewBag.EmployeeID = new SelectList(db.Employee_s, "EmployeeID", "GenreName", game.Employee_s);
            ViewBag.XboxID = new SelectList(db.Xbox, "XboxID", "G_Company", game.Xbox);
            return View(game);
        }

        // POST: Games/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GameID,G_Name,G_Company,GamePrice,G_Description,G_UnitsSold,GameImage,ReleaseDate")] Game game, HttpPostedFileBase gameCover)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";

                if (gameCover != null)
                {
                    file = gameCover.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    // check that the uploaded file ext is in our list of good file extensions 
                    if (goodExts.Contains(ext))
                    {
                        // if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (gameCover.ContentLength <= 4194304)
                        {
                            // create a new file name using a guid 
                            file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/imgstore/books/");
                            Image convertedImage = Image.FromStream(gameCover.InputStream);
                            int maxImageSize = 500;
                            int maxThumbSize = 100;
                            ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion

                            if (game.GameImage != null && game.GameImage != "NoImage.png")
                            {
                                string path = Server.MapPath("~/Content/img/");
                                ImageService.Delete(path, game.GameImage);
                            }
                        }
                    }
                    game.GameImage = file;

                }
                #endregion
                db.Entry(game).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GameID = new SelectList(db.XboxEmployees, "GameID", "GameID", game.GameID);
            ViewBag.DepartmentsID = new SelectList(db.Department_s, "DepartmentsID", "DeptName", game.Department_s);
            ViewBag.EmployeeID = new SelectList(db.Employee_s, "EmployeeID", "GenreName", game.Employee_s);
            ViewBag.XboxID = new SelectList(db.Xbox, "XboxID", "G_Company", game.Xbox);
            return View(game);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Game book = db.Games.Find(id);

            // Delete the image file of the record that is being removed
            string path = Server.MapPath("~/Content/imgstore/books/");
            ImageService.Delete(path, game.GameImage);

            db.Games.Remove(game);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}