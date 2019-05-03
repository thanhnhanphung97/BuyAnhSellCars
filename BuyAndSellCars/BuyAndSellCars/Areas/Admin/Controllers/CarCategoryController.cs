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
    public class CarCategoryController : BaseController
    {
        // GET: Admin/CarCategory
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetListCarName()
        {
            var dao = new CarCategoryDAO();
            var data = dao.GetListCarCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetListMainMenu(int Id)
        {
            var dao = new CarCategoryDAO();
            var mainMenu = dao.GetListMainMenu(Id);
            return Json(new { data = mainMenu }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDisplayOrder(int parentId, int display, string cal)
        {
            var dao = new CarCategoryDAO();
            int res = dao.GetDisplayOrder(parentId, display, cal);
            return Json(new { res = res }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCarCategory()
        {
            var dao = new CarCategoryDAO();
            var data = dao.LoadCarCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult CreateEditCarCategory(string strCarCategory)
        {
            var dao = new CarCategoryDAO();
            JavaScriptSerializer seriliazer = new JavaScriptSerializer();
            CarCategory entity = seriliazer.Deserialize<CarCategory>(strCarCategory);
            entity.MetaTitle = Common.convertToUnSign.convert(entity.Name);
            string username = (string)Session[Common.CommonConstants.USER_NAME];
            int res = dao.CreateEditCarCategory(entity, username);
            return Json(new
            {
                result = res
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCarCategoryDetail(int Id)
        {
            var dao = new CarCategoryDAO();
            CarCategory entity = dao.GetDetailByID(Id);
            return Json(new
            {
                data = entity
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteCarCategory(int Id)
        {
            var dao = new CarCategoryDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if (check == false)
            {
                result = dao.DeleteCarCategory(Id);
                return Json(new { res = result });
            }
            else return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new CarCategoryDAO();
            bool? result = dao.ChangeStatus(Id);
            return Json(new
            {
                res = result
            });
        }
    }
}