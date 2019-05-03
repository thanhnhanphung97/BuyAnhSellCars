using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ManufacturerDAO
    {
        BuyAndSellCarsDbContext db = null;
        public ManufacturerDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<Manufacturer> LoadListManufacturer()
        {
            return db.Manufacturers.OrderBy(x => x.ID);
        }
        public int CreateEditManufacturer(Manufacturer entity, string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                db.Manufacturers.Add(entity);
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
                var manufacturer = db.Manufacturers.Find(entity.ID);
                manufacturer.Name = entity.Name;
                manufacturer.ModifiedBy = username;
                manufacturer.ModifiedDate = DateTime.Now;
                manufacturer.Status = entity.Status;
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
        public Manufacturer GetManufacturerByID(int id)
        {
            return db.Manufacturers.Find(id);
        }
        public int DeleteManufacturer(int Id)
        {
            Manufacturer entity = db.Manufacturers.Find(Id);
            db.Manufacturers.Remove(entity);
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
            Manufacturer entity = db.Manufacturers.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
        public bool CheckUsed(int Id)
        {
            IEnumerable<CarPart> res = db.CarParts.Where(x => x.ManufacturerID == Id);
            if (res.Count() == 0) return false;
            return true;
        }
    }
}
