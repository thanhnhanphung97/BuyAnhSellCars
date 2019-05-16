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
    public class OrderController : BaseController
    {
        // GET: Admin/Order
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetAllOrder(int status,int page = 1,int pageSize = 10)
        {
            var dao = new OrderDAO();
            var totalRow = dao.GetAllByStatus(status).Count();
            var listorder = dao.GetAllByStatus(status).Skip((page-1)* pageSize).Take(pageSize);
            List<string> date = new List<string>();
            foreach (var item in listorder)
            {
                string time = item.CreatedDate.ToString("yyyy-MM-dd");
                date.Add(time);
            }
            return Json(new { data = listorder,date = date, totalRowOrder = totalRow },JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult EditOrder(string strOrder)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var order = serializer.Deserialize<Order>(strOrder);
            var dao = new OrderDAO();
            var orderold = dao.GetDetailById((int)order.ID);
            if (order.Status == 2 && order.Status > orderold.Status)
            {
                var res = dao.DeliveryOrder(order);
                return Json(new { mes = res });
            }
            else if (order.Status == 2 && order.Status == orderold.Status)
            {
                var res = dao.ChangeStatus(order);
                return Json(new { mes = res });
            }
            else if(order.Status < orderold.Status)
            {
                var res = dao.CancelOrder(order);
                return Json(new { mes = res });
            }
            else
            {
                var res = dao.ChangeStatus(order);
                return Json(new { mes = res });
            }
        }
        [HttpGet]
        public JsonResult GetOrderDetail(int orderId)
        {
            var dao = new OrderDAO();
            var order = dao.GetDetailById(orderId);
            var orderdetail = dao.GetOrderDetail(orderId);
            return Json(new { order = order, orderdetail = orderdetail },JsonRequestBehavior.AllowGet);
        }
    }
}