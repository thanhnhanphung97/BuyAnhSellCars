using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BuyAndSellCars.Models
{
    [Serializable]
    public class CartItem
    {
        public CarPart CarPart { get; set; }
        public int Quantity { get; set; }
    }
}