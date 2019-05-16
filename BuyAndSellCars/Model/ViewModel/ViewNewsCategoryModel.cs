using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.ViewModel;

namespace Model.ViewModel
{
    public class ViewNewsCategoryModel
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public string MetaTitle { get; set; }
        public IEnumerable<NewsCategoryChild> CategoryChild { get; set; }
        public int? DisplayOrder { get; set; }
        public bool? Status { get; set; }
    }
}
