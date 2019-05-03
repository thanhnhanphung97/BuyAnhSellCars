using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class CarPartCategoryChild
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public int? DisplayOrder { get; set; }
        public bool? Status { get; set; }
    }
}
