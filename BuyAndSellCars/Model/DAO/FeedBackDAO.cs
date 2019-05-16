using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class FeedBackDAO
    {
        BuyAndSellCarsDbContext db = null;
        public FeedBackDAO() {
            db = new BuyAndSellCarsDbContext();
        }
        public bool InsertFeedBack(Feedback entity)
        {
            try
            {
                entity.CreatedDate = DateTime.Now;
                entity.Status = false;
                db.Feedbacks.Add(entity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
