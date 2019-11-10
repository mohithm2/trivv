namespace Trivago.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Hotel_Booking
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string HOTELID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string CUSTOMERID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CHECK_IN { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CHECK_OUT { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual Hotel Hotel { get; set; }
    }
}
