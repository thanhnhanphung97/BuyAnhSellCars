using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CarCategoryDAO
    {
        BuyAndSellCarsDbContext db = null;
        public CarCategoryDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<CarCategory> GetListCarCategory()
        {
            return db.CarCategories.OrderByDescending(x => x.ID);
        }
        public IEnumerable<CarCategory> GetListMainMenu(int Id)
        {
            if (Id == 0) return db.CarCategories.Where(x => x.ParentID == 0).OrderBy(x => x.DisplayOrder);
            else return db.CarCategories.Where(x => x.ParentID == 0 && x.ID != Id).OrderBy(x => x.DisplayOrder);
        }
        public int GetDisplayOrder(int parentId, int display, string cal)
        {
            int res = 0;
            if (cal == "none") res = (int)db.CarCategories.Where(x => x.ParentID == parentId).Max(x => x.DisplayOrder) + 1;
            if (cal == "minus")
            {
                for (int i = display - 1; i > 0; i--)
                {
                    CarCategory entity = db.CarCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == i);
                    if (entity == null) return i;
                }
                return 0;
            }
            if (cal == "plus")
            {
                while (true)
                {
                    display++;
                    CarCategory entity = db.CarCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == display);
                    if (entity == null) return display;
                }
            }
            return res;
        }
        public IEnumerable<ViewCarCategoryModel> LoadCarCategory()
        {
            var entity = from a in db.CarCategories
                         where a.ParentID == 0
                         select new ViewCarCategoryModel()
                         {
                             ID = a.ID,
                             Name = a.Name,
                             DisplayOrder = a.DisplayOrder,
                             CategoryChild = from b in db.CarCategories
                                             where b.ParentID == a.ID
                                             orderby b.DisplayOrder
                                             select new CarCategoryChild()
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
        public int CreateEditCarCategory(CarCategory entity, string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                db.CarCategories.Add(entity);
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
                CarCategory car = db.CarCategories.Find(entity.ID);
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
                    IEnumerable<CarCategory> listCar = db.CarCategories.Where(x => x.ParentID == entity.ID);
                    int i = GetDisplayOrder(0, 0, "none") - 1;
                    foreach (var item in listCar)
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
        public CarCategory GetDetailByID(int Id)
        {
            return db.CarCategories.Find(Id);
        }
        public int DeleteCarCategory(int Id)
        {
            CarCategory entity = db.CarCategories.Find(Id);
            db.CarCategories.Remove(entity);
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
            CarCategory entity = db.CarCategories.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
        public bool CheckUsed(int Id)
        {
            IEnumerable<Car> res = db.Cars.Where(x => x.CategoryID == Id);
            if (res.Count() == 0) return false;
            return true;
        }

        public CarCategory GetParentNameByCategoryID(int categoryId)
        {
            var child = db.CarCategories.SingleOrDefault(x => x.ID == categoryId);
            var parent = db.CarCategories.SingleOrDefault(x => x.ID == child.ParentID);
            return parent;
        }
        public IEnumerable<CarCategory> GetListChildByCategoryID(int categoryID)
        {
            var listchild = db.CarCategories.Where(x => x.ParentID == categoryID);
            return listchild;
        }
    }
}
