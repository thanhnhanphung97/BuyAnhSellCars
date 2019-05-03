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
    public class ManufacturerController : Controller
    {
        // GET: Admin/Manufacturer
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadManufacturer(int page, int pageSize)
        {
            ManufacturerDAO dao = new ManufacturerDAO();
            var data = dao.LoadListManufacturer().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.LoadListManufacturer().Count();
            return Json(new { data = data, totalRowManufacturer = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadListManufacturer()
        {
            ManufacturerDAO dao = new ManufacturerDAO();
            var data = dao.LoadListManufacturer().Where(x=>x.Status == true);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditManufacturer(string strManufacturer)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Manufacturer entity = serializer.Deserialize<Manufacturer>(strManufacturer);
            ManufacturerDAO dao = new ManufacturerDAO();
            int res = dao.CreateEditManufacturer(entity, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetManufacturerById(int Id)
        {
            var dao = new ManufacturerDAO();
            var data = dao.GetManufacturerByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteManufacturer(int Id)
        {
            var dao = new ManufacturerDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if (check == false)
            {
                int res = dao.DeleteManufacturer(Id);
                return Json(new { res = result });
            }
            else return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult ChangedStatus(int Id)
        {
            var dao = new ManufacturerDAO();
            bool check = dao.CheckUsed(Id);
            if(check == false)
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