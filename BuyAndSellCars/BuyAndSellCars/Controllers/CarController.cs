using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class CarController : Controller
    {
        // GET: Car
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewCar(int id)
        {
            CarDAO dao = new CarDAO();
            Car car = dao.GetCarByID(id);
            ViewBag.CategoryCar = new CarCategoryDAO().GetParentNameByCategoryID((int)car.CategoryID);
            ViewBag.ListImages = new CarDAO().GetListImages((int)car.ID);
            ViewBag.ListSalients = new CarDAO().GetListSalients((int)car.ID);
            ViewBag.Title = car.SeoTitle;
            ViewBag.MetaKeywords = car.MetaKeywords;
            ViewBag.MetaDescription = car.MetaDescriptions;
            ViewBag.CarDetail = car;
            return View(car);
        }
    }
}