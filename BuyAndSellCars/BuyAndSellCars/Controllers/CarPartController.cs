using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class CarPartController : Controller
    {
        // GET: CarPart
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ViewCarPart(int id)
        {
            ViewBag.CarPartCategory = new CarPartCategoryDAO().LoadCarPartCategory();
            CarPart carpart = new CarPartDAO().GetCarPartByID(id);
            ViewBag.Title = carpart.SeoTitle;
            ViewBag.MetaKeywords = carpart.MetaKeywords;
            ViewBag.MetaDescription = carpart.MetaDescriptions;
            ViewBag.CategoryName = new CarPartCategoryDAO().GetDetailByID((int)carpart.CategoryID);
            ViewBag.OriginName = new OriginDAO().GetOriginByID(carpart.OriginID);
            ViewBag.ManuName = new ManufacturerDAO().GetManufacturerByID(carpart.ManufacturerID);
            return View(carpart);
        }
        public ActionResult ViewListCarPart(int id, int page = 1, int pageSize = 8,int nsx = 0,int xuatxu = 0)
        {
            ViewBag.CarPartCategory = new CarPartCategoryDAO().LoadCarPartCategory();
            ViewBag.ManufacturerCarPart = new ManufacturerDAO().LoadListManufacturer().Where(x => x.Status == true);
            ViewBag.OriginCarPart = new OriginDAO().LoadListOrigin().Where(x => x.Status == true && x.Type == 0);

            ViewBag.ManuID = nsx;
            ViewBag.OriginID = xuatxu;

            var entity = new CarPartCategoryDAO().GetDetailByID(id);
            ViewBag.Title = entity.SeoTitle;
            ViewBag.MetaKeywords = entity.MetaKeywords;
            ViewBag.MetaDescription = entity.MetaDescriptions;

            ViewBag.CategoryCurrent = entity;

            IEnumerable<CarPart> carpart = new CarPartDAO().LoadCarPart();
            int totalRecord = new CarPartDAO().LoadCarPart().Count();

            if (id != 20)
            {
                carpart = new CarPartDAO().GetCarPartByCategoryID(carpart, id);
                totalRecord = carpart.Count();
            }
            if(xuatxu != 0)
            {
                carpart = carpart.Where(x => x.OriginID == xuatxu);
                totalRecord = carpart.Count();
            }
            if (nsx != 0)
            {
                carpart = carpart.Where(x => x.ManufacturerID == nsx);
                totalRecord = carpart.Count();
            }
            carpart = carpart.Skip((page - 1) * pageSize).Take(pageSize);

            ViewBag.totalRecord = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize)) + 1;
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Next = page + 1;
            ViewBag.Last = totalPage;
            ViewBag.Prev = page - 1 > 0 ? page -1 : 1;
            
            return View(carpart);
        }
    }
}