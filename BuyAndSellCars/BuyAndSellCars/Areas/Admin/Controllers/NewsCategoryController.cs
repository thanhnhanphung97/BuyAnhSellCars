using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class NewsCategoryController : BaseController
    {
        // GET: Admin/NewCategory
        public ActionResult Index()
        {
            return View();
        }
        //[HttpGet]
        //public JsonResult LoadNewCategoryData(int page, int pageSize = 7)
        //{
        //    var dao = new UserDAO();
        //    var listUser = dao.GetListUser().Skip((page - 1) * pageSize).Take(pageSize);
        //    int totalRow = dao.GetListUser().Count();
        //    return Json(new
        //    {
        //        data = listUser,
        //        totalRowUser = totalRow
        //    }, JsonRequestBehavior.AllowGet);
        //}
        //public JsonResult CreateEditUser(string strUser)
        //{
        //    var dao = new UserDAO();
        //    JavaScriptSerializer serializer = new JavaScriptSerializer();
        //    User user = serializer.Deserialize<User>(strUser);
        //    user.Password = Common.Encryptor.MD5Hash(user.Password);
        //    int result = dao.CreateEditUser(user, (string)Session[Common.CommonConstants.USER_NAME]);
        //    return Json(new { messenge = result });
        //}
        //[HttpGet]
        //public JsonResult LoadUserDetail(int Id)
        //{
        //    var dao = new UserDAO();
        //    User user = dao.GetById(Id);
        //    return Json(new
        //    {
        //        data = user
        //    }, JsonRequestBehavior.AllowGet);
        //}
        //[HttpPost]
        //public JsonResult DeleteUser(int Id)
        //{
        //    var dao = new UserDAO();
        //    bool result = dao.DeleteUser(Id);
        //    return Json(new { status = result });
        //}
        //[HttpPost]
        //public JsonResult ChangeStatus(int Id)
        //{
        //    var dao = new UserDAO();
        //    bool? result = dao.ChangeStatus(Id);
        //    return Json(new
        //    {
        //        result = result
        //    });
        //}
        [HttpGet]
        public JsonResult GetListNewsName()
        {
            var dao = new NewsCategoryDAO();
            var data = dao.GetListNewsCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetListMainMenu()
        {
            var dao = new NewsCategoryDAO();
            var mainMenu = dao.GetListMainMenu();
            return Json(new { data = mainMenu },JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDisplayOrder(int parentId, int display, string cal)
        {
            var dao = new NewsCategoryDAO();
            int rel = dao.GetDisplayOrder(parentId, display, cal);
            return Json(new { rel = rel }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult LoadNewsCategory()
        {
            var dao = new NewsCategoryDAO();
            var data = dao.LoadNewsCategory();
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
    }
}