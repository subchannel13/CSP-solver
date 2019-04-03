namespace SolverDaemon
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class GA_params
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long problemId { get; set; }

        public int populationSize { get; set; }

        public int tournamentSize { get; set; }

        public int maxGenerations { get; set; }

        public float crossoverRatio { get; set; }

        public float mutationRatio { get; set; }

        public virtual Problem Problem { get; set; }
    }
}
