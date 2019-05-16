using BuyAndSellCars.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BuyAndSellCars.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Register register = null)
        {
            if(ModelState.IsValid)
            {
                if(CheckUserName(register.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else
                {
                    var user = new User();
                    user.ID = 0;
                    user.Name = register.Name;
                    user.Phone = register.Phone;
                    user.Address = register.Address;
                    user.Email = register.Email;
                    user.UserName = register.UserName;
                    user.Password = Common.Encryptor.MD5Hash(register.Password);
                    user.Status = true;
                    user.Type = 0;
                    int res = new UserDAO().CreateEditUser(user, "admin");
                    if(res == 1)
                    {
                        register = null;
                        return RedirectToAction("Login", "LoginClient");
                    }
                    else ModelState.AddModelError("", "Đăng ký thành viên không thành công!");
                }
            }
            return View(register);
        }
        private bool CheckUserName(string username)
        {
            var dao = new UserDAO();
            var user = dao.GetByUN(username);
            if (user != null) return true;
            else return false;
        }
    }
}