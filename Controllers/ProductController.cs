using System;
using dymmy_asp_net_core_web_api.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace dymmy_asp_net_core_web_api.Controllers
{
    [ApiVersion("1.0")]
    [ApiController]
    [Route("v{version:apiVersion}/[controller]")]
    public class ProductController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new Product[] {
                new Product
                {
                    Id = Guid.NewGuid(),
                    Name = "The first product"
                },
                new Product
                {
                    Id = Guid.NewGuid(),
                    Name = "The second product"
                }
            });
        }
    }
}