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
    public class OriginController : BaseController
    {
        // GET: Admin/Origin
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult LoadOrigin(int page, int pageSize,int typeOrigin)
        {
            OriginDAO dao = new OriginDAO();
            var data = dao.LoadListOrigin().Where(x => x.Type == typeOrigin).Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.LoadListOrigin().Where(x => x.Type == typeOrigin).Count();
            return Json(new { data = data, totalRowOrigin = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadListOrigin(int type)
        {
            OriginDAO dao = new OriginDAO();
            var data = dao.LoadListOrigin().Where(x => x.Status == true && x.Type == type);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditOrigin(string strOrigin)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Origin entity = serializer.Deserialize<Origin>(strOrigin);
            OriginDAO dao = new OriginDAO();
            int res = dao.CreateEditOrigin(entity, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetOriginById(int Id)
        {
            var dao = new OriginDAO();
            var data = dao.GetOriginByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteOrigin(int Id)
        {
            var dao = new OriginDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if(check == false)
            {
                result = dao.DeleteOrigin(Id);
                return Json(new { res = result });
            }
            return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new OriginDAO();
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