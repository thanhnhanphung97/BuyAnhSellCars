using BuyAndSellCars.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BuyAndSellCars.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();

            if(cart != null)
            {
                list = (List<CartItem>)cart;
            }

            ViewBag.CarPartCategory = new CarPartCategoryDAO().LoadCarPartCategory();
            ViewBag.Title = "Trang Giỏ Hàng | Buy And Sell Cars";

            return View(list);
        }
        public ActionResult AddItem(long carpartId,int quantity)
        {
            var carpart = new CarPartDAO().GetCarPartByID((int)carpartId);
            var cart = Session[CartSession];
            if(cart != null)
            {
                var list = (List<CartItem>)cart;
                if(list.Exists(x=>x.CarPart.ID == carpartId))
                {
                    foreach (var item in list)
                    {
                        if (item.CarPart.ID == carpartId) item.Quantity += quantity;
                    }
                }
                else
                {
                    //Tạo mới cart item 
                    var item = new CartItem();
                    item.CarPart = carpart;
                    item.Quantity = quantity;
                    list.Add(item);

                    //Gán vào session
                    Session[CartSession] = list;
                }
            }
            else
            {
                //Tạo mới cart item 
                var item = new CartItem();
                item.CarPart = carpart;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                //Gán vào session
                Session[CartSession] = list;
            }

            ViewBag.CarPartCategory = new CarPartCategoryDAO().LoadCarPartCategory();
            ViewBag.Title = "Giỏ Hàng | Buy And Sell Cars";
            
            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.CarPart.ID == item.CarPart.ID);
                if(jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new { res = true });
        }
        [HttpPost]
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new { res = true });
        }
        [HttpPost]
        public JsonResult DeleteItem(int itemID)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.CarPart.ID == itemID);
            Session[CartSession] = sessionCart;
            return Json(new { res = true });
        }
        
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            var userlogin = (UserLogin)Session[Common.LoginClientConstant.CLIENT_SESSION];
            if(userlogin != null)
            {
                var user = new UserDAO().GetById((int)userlogin.UserID);
                ViewBag.UserInfo = user;
            }
            ViewBag.Title = "Giỏ Hàng | Buy And Sell Cars";

            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string shipName,string mobile,string address,string email)
        {
            ViewBag.Title = "Trang Thanh Toán | Buy And Sell Cars";
            var order = new Order();
            order.CreatedDate = DateTime.Now;
            var user = (UserLogin)Session[Common.LoginClientConstant.CLIENT_SESSION];
            if (user != null) order.CustomerID = user.UserID;
            else order.CustomerID = 0;
            order.ShipName = shipName;
            order.ShipMobile = mobile;
            order.ShipAddress = address;
            order.ShipEmail = email;
            order.Status = 1;

            try
            {
                long orderID = new OrderDAO().InsertOrder(order);

                var sessionCart = (List<CartItem>)Session[CartSession];
                foreach (var item in sessionCart)
                {
                    var orderdetail = new OrderDetail();
                    orderdetail.OrderID = orderID;
                    orderdetail.ProductID = item.CarPart.ID;
                    orderdetail.Price = item.CarPart.PromotionPrice != -1 ? item.CarPart.PromotionPrice : item.CarPart.Price;
                    orderdetail.Quantity = item.Quantity;

                    var res = new OrderDetailsDAO().InsertDetails(orderdetail, orderID);
                }
            }
            catch (Exception)
            {
                //
                return Redirect("/loi-thanh-toan");
            }
            Session[CartSession] = null;
            return Redirect("/hoan-thanh");
        }
        public ActionResult Success()
        {
            ViewBag.CarPartCategory = new CarPartCategoryDAO().LoadCarPartCategory();
            return View();
        }
    }
}