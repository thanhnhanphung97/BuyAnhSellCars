using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OriginDAO
    {
        BuyAndSellCarsDbContext db = null;
        public OriginDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<Origin> LoadListOrigin()
        {
            return db.Origins.OrderBy(x => x.ID);
        }
        public int CreateEditOrigin(Origin entity, string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                db.Origins.Add(entity);
                try
                {
                    db.SaveChanges();
                    return 1;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else if (entity.ID != 0)
            {
                var origin = db.Origins.Find(entity.ID);
                origin.Name = entity.Name;
                origin.ModifiedBy = username;
                origin.ModifiedDate = DateTime.Now;
                origin.Status = entity.Status;
                try
                {
                    db.SaveChanges();
                    return 2;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else return 0;
        }
        public Origin GetOriginByID(int id)
        {
            return db.Origins.Find(id);
        }
        public int DeleteOrigin(int Id)
        {
            Origin entity = db.Origins.Find(Id);
            db.Origins.Remove(entity);
            try
            {
                db.SaveChanges();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public bool? ChangeStatus(int Id)
        {
            Origin entity = db.Origins.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
        public bool CheckUsed(int Id)
        {
            IEnumerable<CarPart> res = db.CarParts.Where(x => x.OriginID == Id);
            if (res.Count() == 0) return false;
            return true;
        }
    }
}
