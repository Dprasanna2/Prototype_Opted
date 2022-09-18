namespace OptedApi.ViewModels
{
    public class ResearchDetails
    {
        public Guid? uid { get; set; }
        public string? researchOld_uid { get; set; }
        public string? country_name { get; set; }
        public string? country_iso { get; set; }
        public string? region { get; set; }
        public string? parties { get; set; }
        public string? eu_member { get; set; }
        public string? text_category { get; set; }
        public string? text_type { get; set; }
        public string? source_name { get; set; }
        public string? source_link { get; set; }
        public string? start_year { get; set; }
        public string? end_year { get; set; }
        public string? start_date { get; set; }
        public string? end_date { get; set; }
        public string? complete { get; set; }
        public string? retrieval_way { get; set; }
        public string? file_type { get; set; }
        public string? primary_secondary { get; set; }
        public string? storage { get; set; }
        public string? archive { get; set; }
        public string? init_source { get; set; }
        public string? scientific { get; set; }
        public string? source_type { get; set; }
        public string? meta_vars { get; set; }
        public string? organization_name_av { get; set; }
        public string? annot_av { get; set; }
        public string? codebook_av { get; set; }
        public string? vars { get; set; }
        public string? analysis_type { get; set; }
        public string? full_text_av { get; set; }
        public string? text_ready { get; set; }
        public string? corpus_type { get; set; }
        public string? registration { get; set; }
        public string? free_access { get; set; }
        public string? copyright { get; set; }
        public string? copyright_owner { get; set; }
        public string? notes { get; set; }
        public string? type { get; set; }
        public string? description { get; set; }
        public string? regio_supranat { get; set; }
        public string? regio_subnat_dummy { get; set; }
        public string? regio_subnat_labels { get; set; }
        public string? language { get; set; }
        public string? subtype { get; set; }
        public string? license { get; set; }
        public string? date { get; set; }
        public string? interruptions { get; set; }
        public string? platform { get; set; }
        public string? doi { get; set; }
        public string? linked_opted_material { get; set; }
        public string? user_access { get; set; }
        public string? general_concept { get; set; }
        public string? programming_language { get; set; }
        public string? createdBy { get; set; }
        public string? createdDate { get; set; }
        public string? updatedBy { get; set; }
        public string? updatedDate { get; set; }
        public bool? isApproved { get; set; }
        public string? approvedBy { get; set; }
        public string? approvedDate { get; set; }
        public string? comment { get; set; }
        public bool isActive { get; set; }
    }

    public class CountryLookUp 
    {
        public int Id { get; set; }
        public string CountryName { get; set; }
        public string CountryIso { get; set; }
    }

    public class LanguageLookUp
    {
        public int Id { get; set; }
        public string LanguageName { get; set; }
    }

    public class LookUp
    {
        public string Value { get; set; }
    }
}
