using Microsoft.AspNetCore.Mvc;
using TestServiceAPI ; 

namespace TestServiceAPI.Controllers
{
    //create a new controller named PSOKPIController
    [ApiController]
    [Route("[controller]")]
    public class PSOKPIController : ControllerBase
    {
        //create a new method named Get
        [HttpGet(Name = "GetPSOKPI")]
        public IEnumerable<PSOKPI> Get()
        {
            //return a list of PSOKPI objects
            return Enumerable.Range(1, 5).Select(index => new PSOKPI
            {
                SessionStart = DateTime.Now.AddDays(index),
                UserId = Guid.NewGuid(),
                UserName = "Sayed Saad",
                ACR =  0.5M / index,
                SessionDurationinMS = 1000
            })
            .ToArray();
        }
    }
   
  
    
}