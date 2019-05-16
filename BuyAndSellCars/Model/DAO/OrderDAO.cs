using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDAO
    {
        BuyAndSellCarsDbContext db = null;
        public OrderDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public long InsertOrder(Order entity)
        {
            try
            {
                db.Orders.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }
            catch (Exception)
            {
                return entity.ID;
            }
        }
        public IEnumerable<Order> GetAllByStatus(int status)
        {
            return db.Orders.Where(x => x.Status == status).OrderByDescending(x => x.CreatedDate);
        }
        public bool DeliveryOrder(Order entity)
        {
            IEnumerable<OrderDetail> listorderdetail = db.OrderDetails.Where(x => x.OrderID == entity.ID);
            foreach (var item in listorderdetail)
            {
                CarPart carpart = db.CarParts.Find(item.ProductID);
                carpart.Quantity = carpart.Quantity - item.Quantity;
            }
            var order = db.Orders.Find(entity.ID);
            order.ShipName = entity.ShipName;
            order.ShipMobile = entity.ShipMobile;
            order.ShipEmail = entity.ShipEmail;
            order.ShipAddress = entity.ShipAddress;
            order.Status = 2;
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool CancelOrder(Order entity)
        {
            IEnumerable<OrderDetail> listorderdetail = db.OrderDetails.Where(x => x.OrderID == entity.ID);
            foreach (var item in listorderdetail)
            {
                CarPart carpart = db.CarParts.Find(item.ProductID);
                carpart.Quantity = carpart.Quantity + item.Quantity;
            }
            var order = db.Orders.Find(entity.ID);
            order.ShipName = entity.ShipName;
            order.ShipMobile = entity.ShipMobile;
            order.ShipEmail = entity.ShipEmail;
            order.ShipAddress = entity.ShipAddress;
            order.Status = entity.Status;
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool ChangeStatus(Order entity)
        {
            var order = db.Orders.Find(entity.ID);
            order.ShipName = entity.ShipName;
            order.ShipMobile = entity.ShipMobile;
            order.ShipEmail = entity.ShipEmail;
            order.ShipAddress = entity.ShipAddress;
            order.Status = entity.Status;
            db.SaveChanges();
            return true;
        }
        public Order GetDetailById(int Id)
        {
            return db.Orders.SingleOrDefault(x => x.ID == Id);
        }
        public IEnumerable<ViewOrderDetailModel> GetOrderDetail(int orderId)
        {
            var entity = from a in db.OrderDetails
                         from b in db.CarParts
                         where a.OrderID == orderId && a.ProductID == b.ID
                         select new ViewOrderDetailModel()
                         {
                             ProductID = a.ProductID,
                             ProductName = b.Name,
                             ProductImg = b.Image,
                             Quantity = a.Quantity,
                             Price = a.Price,
                             TotalPrice = a.Quantity * (int)a.Price
                         };
            return entity;
        }
    }
}
