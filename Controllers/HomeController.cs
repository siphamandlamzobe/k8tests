using Microsoft.AspNetCore.Mvc;

namespace k8Test.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult> GetResponse()
        {
            return Ok(new { message = "live..." });
        }
    }
}
