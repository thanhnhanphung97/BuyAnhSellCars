using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BuyAndSellCars.Controllers
{
    public class FeedBackController : Controller
    {
        // GET: FeedBack
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult FeedBack(string strFeedback)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Feedback entity = serializer.Deserialize<Feedback>(strFeedback);
            var dao = new FeedBackDAO();
            bool res = dao.InsertFeedBack(entity);
            return Json(new { res = res });
        }
    }
}