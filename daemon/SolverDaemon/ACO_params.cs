namespace SolverDaemon
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ACO_params
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long problemId { get; set; }

        public int populationSize { get; set; }

        public float beta { get; set; }

        public int gamma { get; set; }

        public float ro { get; set; }

        public int maxIterations { get; set; }

        public virtual Problem Problem { get; set; }
    }
}
