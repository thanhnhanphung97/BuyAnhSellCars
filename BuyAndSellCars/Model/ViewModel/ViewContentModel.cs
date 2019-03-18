using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ViewContentModel
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CategoryName { get; set; }
        public int? ViewCount { get; set; }
        public bool? Status { get; set; }
    }
}
