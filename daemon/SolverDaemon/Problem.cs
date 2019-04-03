namespace SolverDaemon
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Problem")]
    public partial class Problem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Problem()
        {
            ProblemOrders = new HashSet<ProblemOrder>();
        }

        public long problemId { get; set; }

        public int status { get; set; }

        public int material { get; set; }

        public int algorithm { get; set; }

        [Column(TypeName = "date")]
        public DateTime dateAssinged { get; set; }

        [Column(TypeName = "date")]
        public DateTime dateSolved { get; set; }

        [Required]
        public string note { get; set; }

        public int cutWidth { get; set; }

        public virtual ACO_params ACO_params { get; set; }

        public virtual GA_params GA_params { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProblemOrder> ProblemOrders { get; set; }
    }
}
