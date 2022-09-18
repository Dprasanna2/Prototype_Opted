using OptedApi.ViewModels;

namespace OptedApi.Interfaces
{
    public interface IResearchDetailsService
    {
        public int AddResearchDetails(ResearchDetails researchDetals);
        public List<ResearchDetails> GetGridData(SearchRequest searchRequest);
        public List<ResearchDetails> GetManageGridData();
        public List<CountryLookUp> GetCountryLookUp();
        public List<string> GetLanguageLookUp();
        public int ApproveResource(ApproveRejectRequest approveRejectRequest);

    }
}
