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
    public class CarPartCategoryController : BaseController
    {
        // GET: Admin/CarPartCategory
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetListCarPartName()
        {
            var dao = new CarPartCategoryDAO();
            var data = dao.GetListCarPartCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetListMainMenu(int Id)
        {
            var dao = new CarPartCategoryDAO();
            var mainMenu = dao.GetListMainMenu(Id);
            return Json(new { data = mainMenu }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDisplayOrder(int parentId, int display, string cal)
        {
            var dao = new CarPartCategoryDAO();
            int res = dao.GetDisplayOrder(parentId, display, cal);
            return Json(new { res = res }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCarPartCategory()
        {
            var dao = new CarPartCategoryDAO();
            var data = dao.LoadCarPartCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult CreateEditCarPartCategory(string strCarPartCategory)
        {
            var dao = new CarPartCategoryDAO();
            JavaScriptSerializer seriliazer = new JavaScriptSerializer();
            CarPartCategory entity = seriliazer.Deserialize<CarPartCategory>(strCarPartCategory);
            entity.MetaTitle = Common.convertToUnSign.convert(entity.Name);
            string username = (string)Session[Common.CommonConstants.USER_NAME];
            int res = dao.CreateEditCarPartCategory(entity, username);
            return Json(new
            {
                result = res
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCarPartCategoryDetail(int Id)
        {
            var dao = new CarPartCategoryDAO();
            CarPartCategory entity = dao.GetDetailByID(Id);
            return Json(new
            {
                data = entity
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteCarPartCategory(int Id)
        {
            var dao = new CarPartCategoryDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if(check == false)
            {
                result = dao.DeleteCarPartCategory(Id);
                return Json(new { res = result });
            }
            else return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new CarPartCategoryDAO();
            bool check = dao.CheckUsed(Id);
            if (check == false)
            {
                bool? res = dao.ChangeStatus(Id);
                return Json(new { res = res, used = check, });
            }
            else
            {
                return Json(new { used = check, });
            }
        }
    }
}