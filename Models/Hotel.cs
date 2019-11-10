namespace Trivago.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hotel")]
    public partial class Hotel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hotel()
        {
            Hotel_Booking = new HashSet<Hotel_Booking>();
        }

        [StringLength(5)]
        public string HOTELID { get; set; }

        [StringLength(50)]
        public string NAME { get; set; }

        [StringLength(50)]
        public string CONTACT { get; set; }

        [StringLength(50)]
        public string LOCATION { get; set; }

        [StringLength(200)]
        public string DESCRIPTION { get; set; }

        [StringLength(5)]
        public string AGENTID { get; set; }

        public virtual Agent Agent { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hotel_Booking> Hotel_Booking { get; set; }
    }
}
