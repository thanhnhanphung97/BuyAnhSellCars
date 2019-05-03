using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CarPartCategoryDAO
    {
        BuyAndSellCarsDbContext db = null;
        public CarPartCategoryDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<CarPartCategory> GetListCarPartCategory()
        {
            return db.CarPartCategories.OrderByDescending(x => x.ID);
        }
        public IEnumerable<CarPartCategory> GetListMainMenu(int Id)
        {
            if(Id == 0) return db.CarPartCategories.Where(x => x.ParentID == 0).OrderBy(x => x.DisplayOrder);
            else return db.CarPartCategories.Where(x => x.ParentID == 0 && x.ID != Id).OrderBy(x => x.DisplayOrder);
        }
        public int GetDisplayOrder(int parentId, int display, string cal)
        {
            int res = 0;
            if (cal == "none") res = (int)db.CarPartCategories.Where(x => x.ParentID == parentId).Max(x => x.DisplayOrder) + 1;
            if (cal == "minus")
            {
                for (int i = display - 1; i > 0; i--)
                {
                    CarPartCategory entity = db.CarPartCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == i);
                    if (entity == null) return i;
                }
                return 0;
            }
            if (cal == "plus")
            {
                while (true)
                {
                    display++;
                    CarPartCategory entity = db.CarPartCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == display);
                    if (entity == null) return display;
                }
            }
            return res;
        }
        public IEnumerable<ViewCarPartCategoryModel> LoadCarPartCategory()
        {
            var entity = from a in db.CarPartCategories
                         where a.ParentID == 0
                         select new ViewCarPartCategoryModel()
                         {
                             ID = a.ID,
                             Name = a.Name,
                             DisplayOrder = a.DisplayOrder,
                             CategoryChild = from b in db.CarPartCategories
                                             where b.ParentID == a.ID
                                             orderby b.DisplayOrder
                                             select new CarPartCategoryChild()
                                             {
                                                 Id = b.ID,
                                                 Name = b.Name,
                                                 DisplayOrder = b.DisplayOrder,
                                                 Status = b.Status,
                                             },
                             Status = a.Status
                         };
            return entity.OrderBy(x => x.DisplayOrder);
        }
        public int CreateEditCarPartCategory(CarPartCategory entity, string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                db.CarPartCategories.Add(entity);
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
            if (entity.ID != 0)
            {
                CarPartCategory car = db.CarPartCategories.Find(entity.ID);
                car.Name = entity.Name;
                car.MetaTitle = entity.MetaTitle;
                car.ParentID = entity.ParentID;
                car.DisplayOrder = entity.DisplayOrder;
                car.SeoTitle = entity.SeoTitle;
                car.ModifiedBy = username;
                car.ModifiedDate = DateTime.Now;
                car.MetaKeywords = entity.MetaKeywords;
                car.MetaDescriptions = entity.MetaDescriptions;
                car.Status = entity.Status;
                if(car.ParentID != 0)
                {
                    IEnumerable<CarPartCategory> listCarPart = db.CarPartCategories.Where(x => x.ParentID == entity.ID);
                    int i = GetDisplayOrder(0, 0, "none") - 1;
                    foreach (var item in listCarPart)
                    {
                        item.ParentID = 0;
                        item.DisplayOrder = i++;
                    }
                }
                try
                {
                    db.SaveChanges();
                    return 2;
                }
                catch (Exception)
                {
                    return 0;
                }
            }
            return 0;
        }
        public CarPartCategory GetDetailByID(int Id)
        {
            return db.CarPartCategories.Find(Id);
        }
        public int DeleteCarPartCategory(int Id)
        {
            CarPartCategory entity = db.CarPartCategories.Find(Id);
            db.CarPartCategories.Remove(entity);
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
            CarPartCategory entity = db.CarPartCategories.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
        public bool CheckUsed(int Id)
        {
            IEnumerable<CarPart> res = db.CarParts.Where(x => x.CategoryID == Id);
            if (res.Count() == 0) return false;
            return true;
        }
    }
}
