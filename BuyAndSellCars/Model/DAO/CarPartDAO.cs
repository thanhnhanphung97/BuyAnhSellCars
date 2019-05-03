using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CarPartDAO
    {
        BuyAndSellCarsDbContext db = null;
        public CarPartDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<CarPartCategory> LoadCarPartCategory()
        {
            return db.CarPartCategories.Where(x => x.Status == true && x.ParentID != 0).OrderBy(x => x.DisplayOrder);
        }
        public IEnumerable<CarPartCategory> LoadNameCategory(IEnumerable<CarPart> listCarPart)
        {
            var list = new List<CarPartCategory>();
            foreach (var item in listCarPart)
            {
                var category = db.CarPartCategories.SingleOrDefault(x => x.ID == item.CategoryID);
                list.Add(category);
            }
            return list;
        }
        public IEnumerable<CarPart> LoadCarPart()
        {
            return db.CarParts.OrderByDescending(x => x.ID);
        }
        public int CreateEditCarPart(CarPart entity,string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                db.CarParts.Add(entity);
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
                var carpart = db.CarParts.Find(entity.ID);
                carpart.Name = entity.Name;
                carpart.Code = entity.Code;
                carpart.MetaTitle = entity.MetaTitle;
                carpart.SeoTitle = entity.SeoTitle;
                carpart.Description = entity.Description;
                carpart.Image = entity.Image;
                carpart.Price = entity.Price;
                carpart.PromotionPrice = entity.PromotionPrice;
                carpart.Quantity = entity.Quantity;
                carpart.CategoryID = entity.CategoryID;
                carpart.Warranty = entity.Warranty;
                carpart.OriginID = entity.OriginID;
                carpart.ManufacturerID = entity.ManufacturerID;
                carpart.ModifiedBy = username;
                carpart.ModifiedDate = DateTime.Now;
                carpart.MetaKeywords = entity.MetaKeywords;
                carpart.MetaDescriptions = entity.MetaDescriptions;
                carpart.Status = entity.Status;
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
        public CarPart GetCarPartByID(int id)
        {
            return db.CarParts.Find(id);
        }
        public bool DeleteCarPart(int Id)
        {
            CarPart entity = db.CarParts.Find(Id);
            db.CarParts.Remove(entity);
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
        public bool? ChangeStatus(int Id)
        {
            CarPart entity = db.CarParts.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
    }
}
