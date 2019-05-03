namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Car")]
    public partial class Car
    {
        public long ID { get; set; }

        public long? CategoryID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [Column(TypeName = "xml")]
        public string MoreImages { get; set; }

        public decimal? Price { get; set; }

        public decimal? PrePay { get; set; }

        [StringLength(10)]
        public string Model { get; set; }

        public double? Engine { get; set; }

        [StringLength(10)]
        public string Fuel { get; set; }

        [StringLength(15)]
        public string Gear { get; set; }

        public int? KmTraveled { get; set; }

        [StringLength(20)]
        public string CarColor { get; set; }

        [StringLength(20)]
        public string InteriorColor { get; set; }

        public int? OriginID { get; set; }

        public int? YearOfManufacture { get; set; }

        public int? Seats { get; set; }

        [StringLength(50)]
        public string DriveSystem { get; set; }

        public int? Doors { get; set; }

        [Column(TypeName = "xml")]
        public string SalientFeatures { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool? Sold { get; set; }

        public bool? Status { get; set; }
    }
}
