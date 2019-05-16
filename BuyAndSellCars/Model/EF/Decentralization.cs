namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Decentralization")]
    public partial class Decentralization
    {
        public int ID { get; set; }

        public bool UserManager { get; set; }

        public bool CarPartManager { get; set; }

        public bool CarManager { get; set; }

        public bool OrderManager { get; set; }

        public bool NewsManager { get; set; }

        public bool SystemManager { get; set; }
    }
}
