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
            return db.Users.OrderByDescending(x=>x.ID);
        }
        //public long Insert(User entity)
        //{
        //    db.Users.Add(entity);
        //    db.SaveChanges();
        //    return entity.ID;
        //}
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
        public int CreateUpdateUser(User entity,string userName)
        {
            if (entity.ID == 0)
            {
                // id = 0 => user not exits => add
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = userName;
                entity.ModifiedBy = userName;
                entity.Status = true;
                db.Users.Add(entity);
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
                // user != 0 => user exits in table => edit
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                user.Address = entity.Address;
                user.Phone = entity.Phone;
                user.Email = entity.Email;
                user.ModifiedDate = entity.ModifiedDate;
                user.ModifiedBy = userName;
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

    }
}
