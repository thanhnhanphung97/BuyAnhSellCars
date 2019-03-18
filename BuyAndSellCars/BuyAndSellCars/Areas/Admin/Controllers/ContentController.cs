using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class ContentController : Controller
    {
        // GET: Admin/Content
        public ActionResult Index()
        {
            return View();
        }
        //Content
        [HttpGet]
        public JsonResult LoadListContent(int page = 1, int pageSize = 7)
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
    }
}