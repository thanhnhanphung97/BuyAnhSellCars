using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class UserDAO
    {
        BuyAndSellCarsDbContext db = null; 
        public UserDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<User> GetListUser()
        {
            return db.Users.OrderByDescending(x=>x.CreatedDate);
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        public int Login(string userName,string password)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null) return 0;
            else if (result.Status == false) return -1;
            else if (result.Password == password) return 1;
            return -2;
        }
    }
}
