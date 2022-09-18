namespace OptedApi.ViewModels
{
    public class SearchRequest
    {
        public string? country_name { get; set; }
        public string? region { get; set; }
        public string? start_year { get; set; }
        public string? end_year { get; set; }
        public string? search_text { get; set; }
    }

    public class ApproveRejectRequest
    {
        public string? uid { get; set; }
        public string? comment { get; set; }
        public bool? isApproved { get; set; }
    }
}
