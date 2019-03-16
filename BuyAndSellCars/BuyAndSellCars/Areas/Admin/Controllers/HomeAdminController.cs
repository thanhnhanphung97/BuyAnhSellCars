using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class HomeAdminController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        // users
        [HttpGet]
        public JsonResult LoadUserData(int page, int pageSize = 5)
        {
            var dao = new UserDAO();
            var listUser = dao.GetListUser().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.GetListUser().Count();
            return Json(new {
                data = listUser,
                totalRowUser = totalRow
            }, JsonRequestBehavior.AllowGet);
        }
    }
}