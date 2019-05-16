using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.CarList = new CarDAO().LoadCar().Where(x => x.Status == true).Take<Car>(4);
            ViewBag.ContentList = new ContentDAO().LoadContent().Where(x => x.Status == true).Take<Content>(4);
            ViewBag.CarCategory = new CarCategoryDAO().GetListCarCategory().Where(x => x.Status == true && x.ParentID == 0).OrderBy(x => x.DisplayOrder);
            return View();
        }
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var dao = new MenuDAO();
            var model = dao.GetListHomeCategory().Where(x => x.Status == true).OrderBy(x => x.DisplayOrder);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult Footer()
        {
            var dao = new FooterDAO();
            var model = dao.GetFooter();
            return PartialView(model);
        }
        [HttpGet]
        public JsonResult GetCategoryChild(int categoryId)
        {
            var categorychild = new CarCategoryDAO().GetListChildByCategoryID(categoryId);
            return Json(new { data = categorychild },JsonRequestBehavior.AllowGet);
        }
    }
}