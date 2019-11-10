namespace Trivago.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Package_Booking
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string PACKAGEID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string CUSTOMERID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? BOOKING_DATE { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual Package Package { get; set; }
    }
}
