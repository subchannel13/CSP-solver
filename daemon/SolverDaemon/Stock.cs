namespace SolverDaemon
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Stock
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int materialType { get; set; }

        public int materialLength { get; set; }

        public int quantity { get; set; }

        [Key]
        [Column(Order = 1)]
        public int stockId { get; set; }

        public virtual StockType StockType { get; set; }
    }
}
