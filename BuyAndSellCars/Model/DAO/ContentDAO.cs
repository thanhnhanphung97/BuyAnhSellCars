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
            model.OrderByDescending(x => x.CreatedDate);
            return model;
        }
    }
}
