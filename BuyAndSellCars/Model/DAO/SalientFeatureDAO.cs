using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class SalientFeatureDAO
    {
        BuyAndSellCarsDbContext db = null;
        public SalientFeatureDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<SalientFeature> LoadListSalient()
        {
            return db.SalientFeatures.OrderByDescending(x => x.ID);
        }
        public int CreateEditSalient(SalientFeature entity)
        {
            if (entity.ID == 0)
            {
                db.SalientFeatures.Add(entity);
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
                var salient = db.SalientFeatures.Find(entity.ID);
                salient.Name = entity.Name;
                salient.Status = entity.Status;
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
        public SalientFeature GetSalientByID(int id)
        {
            return db.SalientFeatures.Find(id);
        }
        public int DeleteSalient(int Id)
        {
            SalientFeature entity = db.SalientFeatures.Find(Id);
            db.SalientFeatures.Remove(entity);
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
            SalientFeature entity = db.SalientFeatures.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
    }
}
