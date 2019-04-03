using System.Linq;
using System.Threading;

namespace SolverDaemon
{
	class Program
	{
		static void Main(string[] args)
		{
			var db = new CspContext();

			while (true)
			{
				var task = pullNextProblem(db);

				if (task != null)
					solve(db, task);
				else
					Thread.Sleep(2000);
			}
		}

		private static Problem pullNextProblem(CspContext db)
		{
			return db.Problems.FirstOrDefault(x => x.status == 2);
		}

		private static void solve(CspContext db, Problem task)
		{
			task.status = 5;
			db.SaveChanges();
		}

	}
}
