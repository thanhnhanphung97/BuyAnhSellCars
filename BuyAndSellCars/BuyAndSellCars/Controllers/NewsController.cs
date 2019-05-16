using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult ViewNews(int id)
        {
            var listcategory = new NewsCategoryDAO().NewsCategoryClient();
            var listnews = new ContentDAO().GetAllContent();
            ViewBag.ListCategoryNews = listcategory;

            if (id != 12)
            {
                listcategory = new NewsCategoryDAO().NewsCategoryClient();
                ViewBag.ListCategoryNews = listcategory;
                var categorCurrent = new NewsCategoryDAO().GetDetailByID(id);
                ViewBag.CategoryCurrent = categorCurrent;
                listnews = new ContentDAO().GetContentByCategoryID(id);
            }

            return View(listnews);
        }

        public ActionResult Details(int id)
        {
            var newsdetail = new ContentDAO().GetContentByID(id);
            var categoryCurrent = new NewsCategoryDAO().GetDetailByID((int)newsdetail.CategoryID);
            ViewBag.CategoryCurrent = categoryCurrent;
            return View(newsdetail);
        }
    }
}