using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Model.DAO
{
    public class CarDAO
    {
        BuyAndSellCarsDbContext db = null;
        public CarDAO()
        {
            db = new BuyAndSellCarsDbContext();
        }
        public IEnumerable<CarCategory> LoadCarCategory()
        {
            return db.CarCategories.Where(x => x.Status == true && x.ParentID != 0).OrderBy(x => x.DisplayOrder);
        }
        public IEnumerable<Car> LoadCar()
        {
            return db.Cars.OrderByDescending(x => x.ID);
        }
        public IEnumerable<CarCategory> LoadNameCategory(IEnumerable<Car> listCar)
        {
            var list = new List<CarCategory>();
            foreach (var item in listCar)
            {
                var category = db.CarCategories.SingleOrDefault(x => x.ID == item.CategoryID);
                list.Add(category);
            }
            return list;
        }
        public int CreateEditCar(Car entity, string username)
        {
            if (entity.ID == 0)
            {
                entity.CreatedDate = DateTime.Now;
                entity.ModifiedDate = DateTime.Now;
                entity.CreatedBy = username;
                entity.ModifiedBy = username;
                db.Cars.Add(entity);
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
                var car = db.Cars.Find(entity.ID);
                car.CategoryID = entity.CategoryID;
                car.Name = entity.Name;
                car.MetaTitle = entity.MetaTitle;
                car.SeoTitle = entity.SeoTitle;
                car.Image = entity.Image;
                car.Price = entity.Price;
                car.PrePay = entity.PrePay;
                car.Model = entity.Model;
                car.Engine = entity.Engine;
                car.Fuel = entity.Fuel;
                car.Gear = entity.Gear;
                car.KmTraveled = entity.KmTraveled;
                car.CarColor = entity.CarColor;
                car.InteriorColor = entity.InteriorColor;
                car.OriginID = entity.OriginID;
                car.YearOfManufacture = entity.YearOfManufacture;
                car.Seats = entity.Seats;
                car.DriveSystem = entity.DriveSystem;
                car.Doors = entity.Doors;
                car.SalientFeatures = entity.SalientFeatures;
                car.ModifiedBy = username;
                car.ModifiedDate = DateTime.Now;
                car.MetaKeywords = entity.MetaKeywords;
                car.MetaDescriptions = entity.MetaDescriptions;
                car.Sold = entity.Sold;
                car.Status = entity.Status;
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
        public Car GetCarByID(int id)
        {
            return db.Cars.Find(id);
        }
        public bool DeleteCar(int Id)
        {
            Car entity = db.Cars.Find(Id);
            db.Cars.Remove(entity);
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
        public bool? ChangeStatus(int Id)
        {
            Car entity = db.Cars.Find(Id);
            entity.Status = !entity.Status;
            db.SaveChanges();
            return entity.Status;
        }
        public int UploadImages(string Images,int Id)
        {
            var Car = db.Cars.Find(Id);
            Car.MoreImages = Images;
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
        public int UploadSalients(string Salients, int Id)
        {
            var Car = db.Cars.Find(Id);
            Car.SalientFeatures = Salients;
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
        public List<string> GetListImages(int Id)
        {
            var entity = db.Cars.Find(Id);
            var listImages = entity.MoreImages;
            if(listImages != null)
            {
                XElement xImages = XElement.Parse(listImages);
                List<string> listImagesReturn = new List<string>();
                foreach (XElement element in xImages.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
                return listImagesReturn;
            }
            else
            {
                return null;
            }
        }
        public List<string> GetListSalients(int Id)
        {
            var entity = db.Cars.Find(Id);
            var listSalients = entity.SalientFeatures;
            if (listSalients != null)
            {
                XElement xSalients = XElement.Parse(listSalients);
                List<string> listSalientsReturn = new List<string>();
                foreach (XElement element in xSalients.Elements())
                {
                    listSalientsReturn.Add(element.Value);
                }
                return listSalientsReturn;
            }
            else
            {
                return null;
            }
        }
    }
}
