using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDetailsDAO
    {
        BuyAndSellCarsDbContext db = null;
        public OrderDetailsDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public bool InsertDetails(OrderDetail entity,long id)
        {
            entity.OrderID = id;
            try
            {
                db.OrderDetails.Add(entity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
