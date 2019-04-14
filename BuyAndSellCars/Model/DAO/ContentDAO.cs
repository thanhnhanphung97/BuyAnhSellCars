using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ContentDAO
    {
        BuyAndSellCarsDbContext db = null;
        public ContentDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<ViewContentModel> GetListContent()
        {
            var model = from a in db.Contents
                        join b in db.NewsCategories
                        on a.CategoryID equals b.ID
                        where a.CategoryID == b.ID
                        select new ViewContentModel()
                        {
                            ID = a.ID,
                            Name = a.Name,
                            CreatedBy = a.CreatedBy,
                            CreatedDate = a.CreatedDate,
                            CategoryName = b.Name,
                            ViewCount = a.ViewCount,
                            Status = a.Status
                        };
            return model.OrderByDescending(x => x.ID);
        }
        public int CreateEditContent(Content entity,string username)
        {
            if(entity.ID == 0)
            {
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                entity.ViewCount = 0;
                db.Contents.Add(entity);
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
            else if(entity.ID != 0)
            {
                var content = db.Contents.Find(entity.ID);
                content.Name = entity.Name;
                content.Image = entity.Image;
                content.MetaTitle = entity.MetaTitle;
                content.CategoryID = entity.CategoryID;
                content.Detail = entity.Detail;
                content.ModifiedBy = username;
                content.ModifiedDate = DateTime.Now;
                content.MetaKeywords = entity.MetaKeywords;
                content.MetaDescriptions = entity.MetaDescriptions;
                content.Status = entity.Status;
                content.Tags = entity.Tags;
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
        public Content GetContentByID(int id)
        {
            return db.Contents.Find(id);
        }
        public bool DeleteContent(int Id)
        {
            Content entity = db.Contents.Find(Id);
            db.Contents.Remove(entity);
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                throw;
                return false;
            }
        }
        public bool ChangedStatus(int Id)
        {
            Content entity = db.Contents.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
    }
}
