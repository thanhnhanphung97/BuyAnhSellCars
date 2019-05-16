using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class FooterDAO
    {
        BuyAndSellCarsDbContext db = null;
        public FooterDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }

        public Footer GetFooter()
        {
            return db.Footers.SingleOrDefault(x => x.Status == true);
        }
    }
}
