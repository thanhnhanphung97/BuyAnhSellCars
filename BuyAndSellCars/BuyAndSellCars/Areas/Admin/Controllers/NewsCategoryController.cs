using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using System.Web.Script.Serialization;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class NewsCategoryController : BaseController
    {
        // GET: Admin/NewCategory
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetListNewsName()
        {
            var dao = new NewsCategoryDAO();
            var data = dao.GetListNewsCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetListMainMenu(int Id)
        {
            var dao = new NewsCategoryDAO();
            var mainMenu = dao.GetListMainMenu(Id);
            return Json(new { data = mainMenu },JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDisplayOrder(int parentId, int display, string cal)
        {
            var dao = new NewsCategoryDAO();
            int res = dao.GetDisplayOrder(parentId, display, cal);
            return Json(new { res = res }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadNewsCategory()
        {
            var dao = new NewsCategoryDAO();
            var data = dao.LoadNewsCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult CreateEditNewsCategory(string strNewsCategory)
        {
            var dao = new NewsCategoryDAO();
            JavaScriptSerializer seriliazer = new JavaScriptSerializer();
            NewsCategory entity = seriliazer.Deserialize<NewsCategory>(strNewsCategory);
            entity.MetaTitle = Common.convertToUnSign.convert(entity.Name);
            string username = (string)Session[Common.CommonConstants.USER_NAME];
            int res = dao.CreateEditNewsCategory(entity, username);
            return Json(new
            {
                result = res
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadNewsCategoryDetail(int Id)
        {
            var dao = new NewsCategoryDAO();
            NewsCategory entity = dao.GetDetailByID(Id);
            return Json(new
            {
                data = entity
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteNewsCategory(int Id)
        {
            var dao = new NewsCategoryDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if (check == false)
            {
                result = dao.DeleteNewsCategory(Id);
                return Json(new { res = result });
            }
            else return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new NewsCategoryDAO();
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