using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class AssignmentController : ControllerBase
{
    private readonly ILogger<AssignmentController> _logger;

    public AssignmentController(ILogger<AssignmentController> logger)
    {
        _logger = logger;
    }

    [HttpGet()]
    [Route("List")]
    public IEnumerable<Assignment> List()
    {
        return new[] { new Assignment { Id = 0, Name = "Task 1", } };
    }
}
