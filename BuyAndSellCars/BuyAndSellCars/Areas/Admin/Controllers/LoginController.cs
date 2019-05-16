using BuyAndSellCars.Areas.Admin.Models;
using BuyAndSellCars.Common;
using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            Session.Add(CommonConstants.USER_SESSION, null);
            return View();
        }
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                int result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password),1);
                if (result == 0) ModelState.AddModelError("", "Tài khoản không tồn tại.");
                else if (result == -1) ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                else if (result == 1)
                {
                    var user = dao.GetByUN(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "HomeAdmin");
                }
                else ModelState.AddModelError("", "Thông tin đăng nhập không chính xác.");
            }
            return View("Index");
        }
    }
}