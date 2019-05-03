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
    public class SalientController : Controller
    {
        // GET: Admin/Salient
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadSalient(int page, int pageSize)
        {
            SalientFeatureDAO dao = new SalientFeatureDAO();
            var data = dao.LoadListSalient().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.LoadListSalient().Count();
            return Json(new { data = data, totalRowSalient = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadListSalient()
        {
            SalientFeatureDAO dao = new SalientFeatureDAO();
            var data = dao.LoadListSalient().Where(x => x.Status == true);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditSalient(string strSalient)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            SalientFeature entity = serializer.Deserialize<SalientFeature>(strSalient);
            SalientFeatureDAO dao = new SalientFeatureDAO();
            int res = dao.CreateEditSalient(entity);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetSalientById(int Id)
        {
            var dao = new SalientFeatureDAO();
            var data = dao.GetSalientByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteSalient(int Id)
        {
            var dao = new SalientFeatureDAO();
            int result = dao.DeleteSalient(Id);
            return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new SalientFeatureDAO();
            bool? result = dao.ChangeStatus(Id);
            return Json(new { res = result });
        }
    }
}