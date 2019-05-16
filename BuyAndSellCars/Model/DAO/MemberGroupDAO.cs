using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class MemberGroupDAO
    {
        BuyAndSellCarsDbContext db = null;
        public MemberGroupDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<MemberGroup> LoadListMemberGroup()
        {
            return db.MemberGroups.OrderBy(x => x.ID);
        }
        public int CreateEditMemberGroup(MemberGroup entity)
        {
            if (entity.ID == 0)
            {
                entity.DecenID = CreateNewDecen();
                db.MemberGroups.Add(entity);
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
                var memberGrp = db.MemberGroups.Find(entity.ID);
                memberGrp.Name = entity.Name;
                memberGrp.Description = entity.Description;
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
        public MemberGroup GetMemberGroupByID(int id)
        {
            return db.MemberGroups.Find(id);
        }
        public int DeleteMemberGroup(int Id)
        {
            MemberGroup entity = db.MemberGroups.Find(Id);
            var decen = db.Decentralizations.SingleOrDefault(x=>x.ID == entity.DecenID);
            db.Decentralizations.Remove(decen);
            db.MemberGroups.Remove(entity);
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
        public bool CheckUsed(int Id)
        {
            IEnumerable<User> res = db.Users.Where(x => x.ID == Id);
            if (res.Count() == 0) return false;
            return true;
        }
        public int CreateNewDecen()
        {
            Decentralization decen = new Decentralization();
            db.Decentralizations.Add(decen);
            db.SaveChanges();
            return db.Decentralizations.Max(x => x.ID);
        }
        public Decentralization GetDecent(int Id)
        {
            return db.Decentralizations.Find(Id);
        }
        public Decentralization GetDecentByUserID(int Id)
        {
            var user = db.Users.Find(Id);
            var group = db.MemberGroups.Find(user.GroupID);
            return db.Decentralizations.Find(group.DecenID);
        }
        public bool SaveDecent(Decentralization entity)
        {
            var decent = db.Decentralizations.Find(entity.ID);
            decent.UserManager = entity.UserManager;
            decent.CarPartManager = entity.CarPartManager;
            decent.CarManager = entity.CarManager;
            decent.NewsManager = entity.NewsManager;
            decent.OrderManager = entity.OrderManager;
            decent.SystemManager = entity.SystemManager;
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
    }
}
