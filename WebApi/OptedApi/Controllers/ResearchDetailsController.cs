using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OptedApi.Interfaces;
using OptedApi.ViewModels;

namespace OptedApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResearchDetailsController : ControllerBase
    {
        private readonly IResearchDetailsService _researchDetailsService;

        public ResearchDetailsController(IResearchDetailsService researchDetailsService)
        {
            this._researchDetailsService = researchDetailsService;
        }
        [HttpPost]
        [Route("AddBulkResearchDetails")]
        public int AddResearchDetails([FromBody] List<ResearchDetails> data)
        {
            foreach (ResearchDetails item in data)
            {
                item.isApproved = true;
                item.isActive = true;
                this._researchDetailsService.AddResearchDetails(item);
            }
            return 10;
        }

        [HttpPost]
        [Route("AddResearchDetail")]
        public int AddResearchDetails([FromBody] ResearchDetails data)
        {
            data.isApproved = null;
            data.isActive = true;
            this._researchDetailsService.AddResearchDetails(data);
            return 10;
        }

        [HttpPost]
        [Route("GetGridData")]
        public List<ResearchDetails> GetGridData([FromBody] SearchRequest data)
        {
            return this._researchDetailsService.GetGridData(data);
        }

        [HttpGet]
        [Route("GetManageGridData")]
        public List<ResearchDetails> GetManageGridData()
        {
            return this._researchDetailsService.GetManageGridData();
        }

        [HttpGet]
        [Route("GetCountryLookUp")]
        public List<CountryLookUp> GetCountryLookUp()
        {
            return this._researchDetailsService.GetCountryLookUp();
        }

        [HttpGet]
        [Route("GetLanguageLookUp")]
        public List<string> GetLanguageLookUp()
        {
            return this._researchDetailsService.GetLanguageLookUp();
        }

        [HttpPost]
        [Route("ApproveResource")]
        public int ActivateResource([FromBody] ApproveRejectRequest data)
        {
            return this._researchDetailsService.ApproveResource(data);
        }
    }
}
