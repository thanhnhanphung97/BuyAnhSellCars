using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class HomeCategoryController : Controller
    {
        // GET: Admin/HomeCategory
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetListHomeCategory()
        {
            var dao = new MenuDAO();
            var data = dao.GetListHomeCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDisplayOrder(int display, string cal)
        {
            var dao = new MenuDAO();
            int res = dao.GetDisplayOrder(display, cal);
            return Json(new { res = res }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult CreateEditHomeCategory(string strHomeCategory)
        {
            var dao = new MenuDAO();
            JavaScriptSerializer seriliazer = new JavaScriptSerializer();
            Menu entity = seriliazer.Deserialize<Menu>(strHomeCategory);
            int res = dao.CreateEditHomeCategory(entity);
            return Json(new
            {
                result = res
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadHomeCategoryDetail(int Id)
        {
            var dao = new MenuDAO();
            Menu entity = dao.GetDetailByID(Id);
            return Json(new
            {
                data = entity
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteHomeCategory(int Id)
        {
            var dao = new MenuDAO();
            int res = dao.DeleteHomeCategory(Id);
            return Json(new { res = res });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new MenuDAO();
            bool? result = dao.ChangeStatus(Id);
            return Json(new
            {
                res = result
            });
        }
    }
}