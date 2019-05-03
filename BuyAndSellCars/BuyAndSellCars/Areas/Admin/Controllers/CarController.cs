using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class CarController : BaseController
    {
        // GET: Admin/Car
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadCarCategory()
        {
            CarDAO dao = new CarDAO();
            var category = dao.LoadCarCategory();
            return Json(new { category = category }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadCar(int page, int pageSize)
        {
            CarDAO dao = new CarDAO();
            var data = dao.LoadCar().Skip((page - 1) * pageSize).Take(pageSize);
            var category = dao.LoadNameCategory(data);
            int totalRow = data.Count();
            return Json(new { data = data, category = category, totalRowCar = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditCar(string strCar)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Car entity = serializer.Deserialize<Car>(strCar);
            CarDAO dao = new CarDAO();
            entity.MetaTitle = Common.convertToUnSign.convert(entity.Name);
            int res = dao.CreateEditCar(entity, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetCarById(int Id)
        {
            var dao = new CarDAO();
            var data = dao.GetCarByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteCar(int Id)
        {
            var dao = new CarDAO();
            bool mes = dao.DeleteCar(Id);
            return Json(new { mes = mes });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new CarDAO();
            bool? res = dao.ChangeStatus(Id);
            return Json(new { res = res });
        }
        [HttpPost]
        public JsonResult SaveImages(string[] strImages,int Id)
        {
            var dao = new CarDAO();
            XElement xElement = new XElement("Images");
            var entity = dao.GetCarByID(Id);
            xElement.Add(new XElement("Image", entity.Image));
            foreach (var item in strImages)
            {
                xElement.Add(new XElement("Image", item));
            }
            int res = dao.UploadImages(xElement.ToString(), Id);
            return Json(new { res = res });
        }
        [HttpPost]
        public JsonResult SaveSalients(string[] strSalients, int Id)
        {
            var dao = new CarDAO();
            XElement xElement = new XElement("Salients");
            foreach (var item in strSalients)
            {
                xElement.Add(new XElement("Salient", item));
            }
            int res = dao.UploadSalients(xElement.ToString(), Id);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetListImages(int Id)
        {
            var dao = new CarDAO();
            var data = dao.GetListImages(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetListSalients(int Id)
        {
            var dao = new CarDAO();
            var data = dao.GetListSalients(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
    }
}