﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ViewOrderDetailModel
    {
        public long ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductImg { get; set; }
        public int Quantity { get; set; }
        public decimal? Price { get; set; }
        public decimal TotalPrice { get; set; }

    }
}
