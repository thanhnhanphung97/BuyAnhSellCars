using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class NewsCategoryDAO
    {
        BuyAndSellCarsDbContext db = null;
        public NewsCategoryDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<NewsCategory> GetListNewCategory()
        {
            return db.NewsCategories.OrderByDescending(x => x.CreatedDate);
        }

    }
}
