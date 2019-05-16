using BuyAndSellCars.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BuyAndSellCars.Common;
using Model.DAO;

namespace BuyAndSellCars.Controllers
{
    public class LoginClientController : Controller
    {
        // GET: LoginClient
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginClientModel model) 
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                int result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password), 0);
                if (result == 0) ModelState.AddModelError("", "Tài khoản không tồn tại.");
                else if (result == -1) ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                else if (result == 1)
                {
                    var user = dao.GetByUN(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    userSession.Name = user.Name;
                    Session.Add(LoginClientConstant.CLIENT_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else ModelState.AddModelError("", "Thông tin đăng nhập không chính xác.");
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session[LoginClientConstant.CLIENT_SESSION] = null;
            return Redirect("/");
        }
    }
}