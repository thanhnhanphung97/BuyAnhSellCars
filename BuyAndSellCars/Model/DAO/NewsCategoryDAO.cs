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
        public IEnumerable<NewsCategory> GetListMainMenu()
        {
            return db.NewsCategories.Where(x => x.ParentID == 0).OrderBy(x => x.DisplayOrder);
        }
        public int GetDisplayOrder(int parentId, int display, string cal)
        {
            int rel = 0;
            if (cal == "none") rel = (int)db.NewsCategories.Where(x => x.ParentID == parentId).Max(x=>x.DisplayOrder) + 1;
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
            return rel;
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
                                             select new NewsCategoryChild()
                                             {
                                                 Id = b.ID,
                                                 Name = b.Name,
                                                 DisplayOrder = b.DisplayOrder,
                                                 Status = b.Status,
                                             },
                             Status = a.Status
                         };
            foreach (var item in entity)
            {
                item.CategoryChild.OrderBy(x => x.DisplayOrder);
            }
            return entity.OrderBy(x => x.DisplayOrder);
        }
    }
}
