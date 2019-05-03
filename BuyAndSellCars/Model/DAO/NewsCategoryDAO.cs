using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;

namespace Model.DAO
{
    public class NewsCategoryDAO
    {
        BuyAndSellCarsDbContext db = null;
        public NewsCategoryDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<NewsCategory> GetListNewsCategory()
        {
            return db.NewsCategories.OrderByDescending(x => x.ID);
        }
        public IEnumerable<NewsCategory> GetListMainMenu(int Id)
        {
            if(Id == 0) return db.NewsCategories.Where(x => x.ParentID == 0).OrderBy(x => x.DisplayOrder);
            else return db.NewsCategories.Where(x => x.ParentID == 0 && x.ID != Id).OrderBy(x => x.DisplayOrder);
        }
        public int GetDisplayOrder(int parentId, int display, string cal)
        {
            int res = 0;
            if (cal == "none") res = (int)db.NewsCategories.Where(x => x.ParentID == parentId).Max(x=>x.DisplayOrder) + 1;
            if (cal == "minus")
            {
                for(int i = display - 1; i > 0; i--)
                {
                    NewsCategory entity = db.NewsCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == i);
                    if (entity == null) return i;
                }
                return 0;
            }
            if(cal == "plus")
            {
                while(true)
                {
                    display++;
                    NewsCategory entity = db.NewsCategories.SingleOrDefault(x => x.ParentID == parentId && x.DisplayOrder == display);
                    if (entity == null) return display;
                }
            }
            return res;
        }
        public IEnumerable<ViewNewsCategoryModel> LoadNewsCategory()
        {
            var entity = from a in db.NewsCategories
                         where a.ParentID == 0
                         select new ViewNewsCategoryModel()
                         {
                             ID = a.ID,
                             Name = a.Name,
                             DisplayOrder = a.DisplayOrder,
                             CategoryChild = from b in db.NewsCategories
                                             where b.ParentID == a.ID
                                             orderby b.DisplayOrder
                                             select new NewsCategoryChild()
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
        public int CreateEditNewsCategory(NewsCategory entity,string username)
        {
            if(entity.ID == 0)
            {
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                db.NewsCategories.Add(entity);
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
            if(entity.ID != 0)
            {
                NewsCategory news = db.NewsCategories.Find(entity.ID);
                news.Name = entity.Name;
                news.MetaTitle = entity.MetaTitle;
                news.ParentID = entity.ParentID;
                news.DisplayOrder = entity.DisplayOrder;
                news.SeoTitle = entity.SeoTitle;
                news.ModifiedBy = username;
                news.ModifiedDate = DateTime.Now;
                news.MetaKeywords = entity.MetaKeywords;
                news.MetaDescriptions = entity.MetaDescriptions;
                news.Status = entity.Status;
                if(news.ParentID != 0)
                {
                    IEnumerable<NewsCategory> listNews = db.NewsCategories.Where(x => x.ParentID == entity.ID);
                    int i = GetDisplayOrder(0, 0, "none") - 1;
                    foreach (var item in listNews)
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
        public NewsCategory GetDetailByID(int Id)
        {
            return db.NewsCategories.Find(Id);
        }
        public int DeleteNewsCategory(int Id)
        {
            NewsCategory entity = db.NewsCategories.Find(Id);
            db.NewsCategories.Remove(entity);
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
            NewsCategory entity = db.NewsCategories.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }

        public bool CheckUsed(int Id)
        {
            IEnumerable<Content> res = db.Contents.Where(x => x.CategoryID == Id);
            if (res.Count() == 0) return false;
            return true;
        }
    }
}
