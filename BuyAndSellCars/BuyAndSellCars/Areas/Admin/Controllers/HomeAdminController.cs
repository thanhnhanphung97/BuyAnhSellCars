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
        public JsonResult CreateEditUser(string strUser)
        {
            var dao = new UserDAO();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            User user = serializer.Deserialize<User>(strUser);
            user.Password = Common.Encryptor.MD5Hash(user.Password);
            int result = dao.CreateEditUser(user, (string)Session[Common.CommonConstants.USER_NAME]);
            return Json(new { messenge = result });
        }
        [HttpGet]
        public JsonResult LoadUserDetail(int Id)
        {
            var dao = new UserDAO();
            User user = dao.GetById(Id);
            return Json(new {
                data = user
            },JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteUser(int Id)
        {
            var dao = new UserDAO();
            bool result = dao.DeleteUser(Id);
            return Json(new { status = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(int Id)
        {
            var dao = new UserDAO();
            bool? result = dao.ChangeStatus(Id);
            return Json(new
            {
                result = result
            });
        }
    }
}