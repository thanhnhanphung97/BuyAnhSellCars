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
    public class HomeAdminController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            ViewBag.userNameSession = Session[Common.CommonConstants.USER_NAME];
            return View();
        }
        // users
        [HttpGet]
        public JsonResult LoadUserData(int page, int pageSize = 7)
        {
            var dao = new UserDAO();
            var listUser = dao.GetListUser().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.GetListUser().Count();
            return Json(new {
                data = listUser,
                totalRowUser = totalRow
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateUpdateUser(string strUser)
        {
            var dao = new UserDAO();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            User user = serializer.Deserialize<User>(strUser);
            user.Password = Common.Encryptor.MD5Hash(user.Password);
            int result = dao.CreateUpdateUser(user, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { messenge = result });
        }
    }
}