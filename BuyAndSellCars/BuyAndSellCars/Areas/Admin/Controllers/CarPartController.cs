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
    public class CarPartController : BaseController
    {
        // GET: Admin/CarPart
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadCarPartCategory()
        {
            CarPartDAO dao = new CarPartDAO();
            var category = dao.LoadCarPartCategory();
            return Json(new { category = category },JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCarPart(int page,int pageSize)
        {
            CarPartDAO dao = new CarPartDAO();
            var data = dao.LoadCarPart().Skip((page - 1) * pageSize).Take(pageSize);
            var category = dao.LoadNameCategory(data);
            int totalRow = data.Count();
            return Json(new { data = data, category = category, totalRowCarPart = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditCarPart(string strCarpart)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            CarPart entity = serializer.Deserialize<CarPart>(strCarpart);
            CarPartDAO dao = new CarPartDAO();
            entity.MetaTitle = Common.convertToUnSign.convert(entity.Name);
            entity.Description = (String)System.Net.WebUtility.HtmlDecode(entity.Description);
            int res = dao.CreateEditCarPart(entity, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetCarPartById(int Id)
        {
            var dao = new CarPartDAO();
            var data = dao.GetCarPartByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteCarPart(int Id)
        {
            var dao = new CarPartDAO();
            bool mes = dao.DeleteCarPart(Id);
            return Json(new { mes = mes });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new CarPartDAO();
            bool? res = dao.ChangeStatus(Id);
            return Json(new { res = res });
        }
    }
}