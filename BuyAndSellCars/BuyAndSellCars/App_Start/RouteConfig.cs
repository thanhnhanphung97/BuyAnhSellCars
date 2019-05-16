using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BuyAndSellCars
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "View Car",
                url: "xe-oto/{metatitle}-{id}",
                defaults: new { controller = "Car", action = "ViewCar", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
               name: "View Contact",
               url: "lien-he",
               defaults: new { controller = "FeedBack", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "BuyAndSellCars.Controllers" }
           );
            

            routes.MapRoute(
               name: "View News By Category",
               url: "tin-tuc/{metatitle}-{id}",
               defaults: new { controller = "News", action = "ViewNews", id = UrlParameter.Optional },
               namespaces: new[] { "BuyAndSellCars.Controllers" }
           );

            routes.MapRoute(
               name: "View News Detail",
               url: "tin-tuc/chi-tiet/{metatitle}-{id}",
               defaults: new { controller = "News", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "BuyAndSellCars.Controllers" }
           );

            routes.MapRoute(
                name: "View CarPart",
                url: "phu-tung/chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "CarPart", action = "ViewCarPart", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Register",
                url: "dang-ky",
                defaults: new { controller = "Register", action = "Register", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Login Client",
                url: "dang-nhap",
                defaults: new { controller = "LoginClient", action = "Login", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Add Cart",
                url: "them-gio-hang",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "View List CarPart",
                url: "phu-tung/{metatitle}-{id}",
                defaults: new { controller = "CarPart", action = "ViewListCarPart", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Cart",
                url: "gio-hang",
                defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Payment",
                url: "thanh-toan",
                defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Alert Payment",
                url: "hoan-thanh",
                defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Search Car",
                url: "tim-mua-xe",
                defaults: new { controller = "SearchCar", action = "SearchCar", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "BuyAndSellCars.Controllers"}
            );

        }
    }
}
