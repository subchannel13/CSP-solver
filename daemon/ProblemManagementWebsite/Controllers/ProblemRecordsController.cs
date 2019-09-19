using ProblemManagementWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProblemManagementWebsite.Controllers
{
    public class ProblemRecordsController : ApiController
    {
		private CspContext db = new CspContext();

		// GET: api/ProblemRecords
		public IQueryable<Problem> GetProblemRecords() => db.Problems;
	}
}
