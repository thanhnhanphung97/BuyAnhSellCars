using System.Linq;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using System.Web.Script.Serialization;

namespace BuyAndSellCars.Areas.Admin.Controllers
{
    public class HomeAdminController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            ViewBag.Name = (string)Session[Common.CommonConstants.USER_NAME];
            return View();
        }
        
    }
}