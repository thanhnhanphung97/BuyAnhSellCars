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
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadUserData(int page, int pageSize = 10, int typeAccount = 1)
        {
            var dao = new UserDAO();
            var listUser = dao.GetListUser().Where(x => x.Type == typeAccount).Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.GetListUser().Where(x => x.Type == typeAccount).Count();
            return Json(new
            {
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
            return Json(new
            {
                data = user
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteUser(int Id)
        {
            var dao = new UserDAO();
            bool result = dao.DeleteUser(Id);
            return Json(new { status = result });
        }
        [HttpPost]
        public JsonResult ChangeStatus(long Id)
        {
            var dao = new UserDAO();
            bool? result = dao.ChangeStatus(Id);
            return Json(new
            {
                res = result
            });
        }
        [HttpGet]
        public JsonResult GetUserByUN()
        {
            var userLogin = (UserLogin)Session[Common.CommonConstants.USER_SESSION];
            var dao = new UserDAO();
            var user = dao.GetByUN(userLogin.UserName);
            return Json(new { data = user }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult ChangePassword(int Id, string newPass)
        {
            var dao = new UserDAO();
            string newpass = Common.Encryptor.MD5Hash(newPass);
            int result = dao.changePassword(Id, newpass);
            return Json(new { res = result });
        }
        [HttpPost]
        public JsonResult LogOutToLogin()
        {
            string data = null;
            Session.Add(Common.CommonConstants.USER_NAME, data);
            return Json(new { data = data });
        }
        [HttpGet]
        public JsonResult GetDecent()
        {
            var userLogin = (UserLogin)Session[Common.CommonConstants.USER_SESSION];
            var dao = new MemberGroupDAO();
            var decent = dao.GetDecentByUserID((int)userLogin.UserID);
            return Json(new { data = decent }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetMemberGroup()
        {
            var dao = new MemberGroupDAO();
            var data = dao.LoadListMemberGroup();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
    }
}