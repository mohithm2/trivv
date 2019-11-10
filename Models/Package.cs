namespace Trivago.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Package")]
    public partial class Package
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Package()
        {
            Package_Booking = new HashSet<Package_Booking>();
        }

        [StringLength(5)]
        public string PACKAGEID { get; set; }

        [StringLength(50)]
        public string PRICE { get; set; }

        [StringLength(200)]
        public string DESCRIPTION { get; set; }

        [StringLength(50)]
        public string ACTIVITIES { get; set; }

        [StringLength(50)]
        public string NO_OF_DAYS { get; set; }

        [StringLength(200)]
        public string PLACES { get; set; }

        [StringLength(5)]
        public string AGENTID { get; set; }

        public virtual Agent Agent { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Package_Booking> Package_Booking { get; set; }
    }
}
