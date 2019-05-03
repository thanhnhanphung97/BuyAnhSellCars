﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ViewCarCategoryModel
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public IEnumerable<CarCategoryChild> CategoryChild { get; set; }
        public int? DisplayOrder { get; set; }
        public bool? Status { get; set; }
    }
}
