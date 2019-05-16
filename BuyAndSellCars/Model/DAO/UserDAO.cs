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
        public User GetByUN(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        public User GetById(int Id)
        {
            return db.Users.SingleOrDefault(x => x.ID == Id);
        }
        public int Login(string userName,string password,int type)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName && x.Type == type);
            if (result == null) return 0;
            else if (result.Status == false) return -1;
            else if (result.Password == password) return 1;
            return -2;
        }
        public int CreateEditUser(User entity,string userName)
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
        public bool DeleteUser(int Id)
        {
            User user = db.Users.Find(Id);
            db.Users.Remove(user);
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool? ChangeStatus(long Id)
        {
            User user = db.Users.Find(Id);
            user.Status = user.Status == true ? false : true;
            try
            {
                db.SaveChanges();
                return user.Status;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int changePassword(int Id, string newPass)
        {
            User entity = db.Users.Find(Id);
            entity.Password = newPass;
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
    }
}
