namespace SolverDaemon
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class CspContext : DbContext
	{
		public CspContext()
			: base("name=CspContext")
		{
		}

		public virtual DbSet<ACO_params> ACO_params { get; set; }
		public virtual DbSet<GA_params> GA_params { get; set; }
		public virtual DbSet<PatternOrder> PatternOrders { get; set; }
		public virtual DbSet<Problem> Problems { get; set; }
		public virtual DbSet<ProblemOrder> ProblemOrders { get; set; }
		public virtual DbSet<ProblemStatu> ProblemStatus { get; set; }
		public virtual DbSet<SolutionPattern> SolutionPatterns { get; set; }
		public virtual DbSet<Stock> Stocks { get; set; }
		public virtual DbSet<StockType> StockTypes { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Problem>()
				.HasOptional(e => e.ACO_params)
				.WithRequired(e => e.Problem)
				.WillCascadeOnDelete();

			modelBuilder.Entity<Problem>()
				.HasOptional(e => e.GA_params)
				.WithRequired(e => e.Problem)
				.WillCascadeOnDelete();

			modelBuilder.Entity<SolutionPattern>()
				.HasMany(e => e.PatternOrders)
				.WithRequired(e => e.SolutionPattern)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<StockType>()
				.HasMany(e => e.Stocks)
				.WithRequired(e => e.StockType)
				.HasForeignKey(e => e.materialType)
				.WillCascadeOnDelete(false);
		}
	}
}
