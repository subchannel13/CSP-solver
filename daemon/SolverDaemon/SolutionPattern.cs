namespace SolverDaemon
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SolutionPattern
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SolutionPattern()
        {
            PatternOrders = new HashSet<PatternOrder>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long problemId { get; set; }

        public int solutionId { get; set; }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long patternId { get; set; }

        public int quantity { get; set; }

        public int stock { get; set; }

        public int trimLength { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatternOrder> PatternOrders { get; set; }
    }
}
