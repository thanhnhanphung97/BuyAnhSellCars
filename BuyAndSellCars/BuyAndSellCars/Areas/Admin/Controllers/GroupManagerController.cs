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
    public class GroupManagerController : Controller
    {
        // GET: Admin/GroupManager
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadListMemberGroup(int page, int pageSize)
        {
            MemberGroupDAO dao = new MemberGroupDAO();
            var data = dao.LoadListMemberGroup().Skip((page - 1) * pageSize).Take(pageSize);
            int totalRow = dao.LoadListMemberGroup().Count();
            return Json(new { data = data , totalRowMemberGroup = totalRow, }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateEditGroupMember(string strGrpMember)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            MemberGroup entity = serializer.Deserialize<MemberGroup>(strGrpMember);
            MemberGroupDAO dao = new MemberGroupDAO();
            int res = dao.CreateEditMemberGroup(entity);
            return Json(new { res = res });
        }
        [HttpGet]
        public JsonResult GetMemberGroupById(int Id)
        {
            var dao = new MemberGroupDAO();
            var data = dao.GetMemberGroupByID(Id);
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteMemberGroup(int Id)
        {
            var dao = new MemberGroupDAO();
            bool check = dao.CheckUsed(Id);
            int result = 2;
            if (check == false)
            {
                result = dao.DeleteMemberGroup(Id);
                return Json(new { res = result });
            }
            return Json(new { res = result });
        }
        [HttpGet]
        public JsonResult GetDecent(int Id)
        {
            var dao = new MemberGroupDAO();
            var decent = dao.GetDecent(Id);
            return Json(new { data = decent }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveDecent(string strDecent)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Decentralization entity = serializer.Deserialize<Decentralization>(strDecent);
            var dao = new MemberGroupDAO();
            bool res = dao.SaveDecent(entity);
            return Json(new { res = res });
        }
    }
}