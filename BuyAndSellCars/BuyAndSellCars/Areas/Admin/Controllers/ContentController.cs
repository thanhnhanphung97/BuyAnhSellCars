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
    public class ContentController : BaseController
    {
        // GET: Admin/Content
        public ActionResult Index()
        {
            return View();
        }
        //Content
        [HttpGet]
        public JsonResult LoadListContent(int page = 1, int pageSize = 10)
        {
            var dao = new ContentDAO();
            var data = dao.GetListContent().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.GetListContent().Count();
            return Json(new
            {
                data = data,
                totalRowContent = totalRow
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditContent(string strContent)
        {
            var dao = new ContentDAO();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Content content = serializer.Deserialize<Content>(strContent);
            content.MetaTitle = Common.convertToUnSign.convert(content.Name);
            content.Detail = (String)System.Net.WebUtility.HtmlDecode(content.Detail);
            int result = dao.CreateEditContent(content, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { rel = result });
        }
        [HttpGet]
        public JsonResult GetContentByID(int Id)
        {
            var dao = new ContentDAO();
            var data = dao.GetContentByID(Id);
            return Json(new { data = data },JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteContent(int Id)
        {
            var dao = new ContentDAO();
            bool msg = dao.DeleteContent(Id); 
            return Json(new { mes = msg });
        }
        [HttpPost]
        public JsonResult ChangedStatus(int Id)
        {
            var dao = new ContentDAO();
            var stt = dao.ChangedStatus(Id);
            return Json(new { res = stt });
        }
    }
}