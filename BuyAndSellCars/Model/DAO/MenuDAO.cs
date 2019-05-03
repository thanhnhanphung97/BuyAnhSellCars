using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class MenuDAO
    {
        BuyAndSellCarsDbContext db = null;
        public MenuDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<Menu> GetListHomeCategory()
        {
            return db.Menus.OrderBy(x => x.DisplayOrder);
        }
        public int GetDisplayOrder(int display, string cal)
        {
            int res = 0;
            if (cal == "none") res = (int)db.Menus.Max(x => x.DisplayOrder) + 1;
            if (cal == "minus")
            {
                for (int i = display - 1; i > 0; i--)
                {
                    Menu entity = db.Menus.SingleOrDefault(x => x.DisplayOrder == i);
                    if (entity == null) return i;
                }
                return 0;
            }
            if (cal == "plus")
            {
                while (true)
                {
                    display++;
                    Menu entity = db.Menus.SingleOrDefault(x => x.DisplayOrder == display);
                    if (entity == null) return display;
                }
            }
            return res;
        }
        public int CreateEditHomeCategory(Menu entity)
        {
            if (entity.ID == 0)
            {
                db.Menus.Add(entity);
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
            if (entity.ID != 0)
            {
                Menu menu = db.Menus.Find(entity.ID);
                menu.Text = entity.Text;
                menu.Link = entity.Link;
                menu.DisplayOrder = entity.DisplayOrder;
                menu.Target = entity.Target;
                menu.Status = entity.Status;
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
        public Menu GetDetailByID(int Id)
        {
            return db.Menus.Find(Id);
        }
        public int DeleteHomeCategory(int Id)
        {
            Menu entity = db.Menus.Find(Id);
            db.Menus.Remove(entity);
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
            Menu entity = db.Menus.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
    }
}
