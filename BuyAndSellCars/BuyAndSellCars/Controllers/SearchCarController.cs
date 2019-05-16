using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class SearchCarController : Controller
    {
        // GET: SearchCar
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult SearchCar(int category_parent = -1, int category_child = -1, int min_price = 0, int max_price = 1000000000)
        {
            if (min_price > max_price) { int a = min_price; min_price = max_price; max_price = a; }

            SetCarList(category_parent, category_child, min_price, max_price);
            ViewBag.HangXe = new CarCategoryDAO().GetListMainMenu(0);
            ViewBag.DongXe = null;

            var entity = new MenuDAO().GetDetailByID(3);

            ViewBag.Title = entity.Text;
            ViewBag.MetaKeywords = entity.Text;
            ViewBag.MetaDescription = entity.Text;

            ViewBag.MinPrice = min_price;
            ViewBag.MaxPrice = max_price;
            ViewBag.HangXeID = 0;
            ViewBag.DongXeID = 0;

            return View();
        }

        [HttpPost]
        public ActionResult SearchCar(string selectCarCategory,string selectCarCategoryChild,string selectPrice)
        {
            int min_price = 0;
            int max_price = 1000000000;
            int category_parent = int.Parse(selectCarCategory) == 0 ? -1 : int.Parse(selectCarCategory);
            int category_child = int.Parse(selectCarCategoryChild) == 0 ? -1 : int.Parse(selectCarCategoryChild);

            if (int.Parse(selectPrice) == 0) { min_price = 0; max_price = 1000000000; }
            if (int.Parse(selectPrice) == 1) { min_price = 300000000; max_price = 500000000; }
            if (int.Parse(selectPrice) == 2) { min_price = 500000000; max_price = 700000000; }
            if (int.Parse(selectPrice) == 3) { min_price = 700000000; max_price = 900000000; }
            if (int.Parse(selectPrice) == 4) { min_price = 900000000; max_price = 1000000000; }

            SetCarList(category_parent, category_child, min_price, max_price);

            ViewBag.HangXe = new CarCategoryDAO().GetListMainMenu(0);
            ViewBag.DongXe = new CarCategoryDAO().GetListChildByCategoryID(category_parent);

            var entity = new MenuDAO().GetDetailByID(3);

            ViewBag.Title = entity.Text;
            ViewBag.MetaKeywords = entity.Text;
            ViewBag.MetaDescription = entity.Text;

            ViewBag.MinPrice = min_price;
            ViewBag.MaxPrice = max_price;
            ViewBag.HangXeID = int.Parse(selectCarCategory);
            ViewBag.DongXeID = int.Parse(selectCarCategoryChild);

            return View();
        }

        [HttpGet]
        public JsonResult Search(int category_parent = -1, int category_child = -1, int min_price = 0, int max_price = 1000000000,string btnsort = "")
        {
            if (min_price > max_price) { int a = min_price; min_price = max_price; max_price = a; }
            var carlist = new CarDAO().LoadCar();
            if (category_parent != -1 && category_child == -1)
            {
                List<Car> list = new List<Car>();
                var listchild = new CarCategoryDAO().GetListChildByCategoryID(category_parent);
                foreach (var item in listchild)
                {
                    var listcar = new CarDAO().GetCarListByCategoryID((int)item.ID);
                    foreach (var car in listcar)
                    {
                        list.Add(car);
                    }
                }
                carlist = list;
            }
            if (category_parent != -1 && category_child != -1)
            {
                carlist = new CarDAO().GetCarListByCategoryID(category_child);
            }

            if (btnsort == "") carlist = carlist.Where(x => x.Price > min_price && x.Price < max_price);
            if (btnsort == "xedangban") carlist = carlist.Where(x => x.Price > min_price && x.Price < max_price && x.Sold == true);
            if (btnsort == "xesapve") carlist = carlist.Where(x => x.Price > min_price && x.Price < max_price && x.Sold == false);
            if (btnsort == "giatang") carlist = carlist.Where(x => x.Price > min_price && x.Price < max_price).OrderBy(x => x.Price);
            if (btnsort == "giagiam") carlist = carlist.Where(x => x.Price > min_price && x.Price < max_price).OrderByDescending(x => x.Price);

            carlist = carlist.Where(x => x.Status == true);
            ViewBag.CarListSearch = carlist;

            return Json(new { data = carlist, },JsonRequestBehavior.AllowGet);
        }

        public void SetCarList(int category_parent,int category_child,int min_price,int max_price)
        {
            var carlist = new CarDAO().LoadCar().Where(x=>x.Price > min_price && x.Price < max_price);
            if(category_parent != -1 && category_child == -1)
            {
                List<Car> list = new List<Car>();
                var listchild = new CarCategoryDAO().GetListChildByCategoryID(category_parent);
                foreach (var item in listchild)
                {
                    var listcar = new CarDAO().GetCarListByCategoryID((int)item.ID);
                    foreach (var car in listcar)
                    {
                        list.Add(car);
                    }
                }
                carlist = list.Where(x => x.Price > min_price && x.Price < max_price);
            }
            if(category_parent != -1 && category_child != -1)
            {
                carlist = new CarDAO().GetCarListByCategoryID(category_child).Where(x => x.Price > min_price && x.Price < max_price);
            }

            ViewBag.CarListSearch = carlist.Where(x=>x.Status == true);
        }

        [HttpGet]
        public JsonResult GetCategoryChild (int categoryID)
        {
            var categoryChild = new CarCategoryDAO().GetListChildByCategoryID(categoryID);
            return Json(new { data = categoryChild },JsonRequestBehavior.AllowGet);
        }
    }
}