using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using OptedApi.Interfaces;
using OptedApi.ViewModels;

namespace OptedApi.Services
{
    public class ResearchDetailsService : IResearchDetailsService
    {
        private readonly IConfiguration _configuration;

        public ResearchDetailsService(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        public int AddResearchDetails(ResearchDetails data)
        {
            int insertData = 0;
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@researchOld_uid", data.researchOld_uid);
                    parameter.Add("@country_name", data.country_name);
                    parameter.Add("@country_iso", data.country_iso);
                    parameter.Add("@region", data.region);
                    parameter.Add("@parties", data.parties);
                    parameter.Add("@eu_member", data.eu_member);
                    parameter.Add("@text_category", data.text_category);
                    parameter.Add("@text_type", data.text_type);
                    parameter.Add("@source_name", data.source_name);
                    parameter.Add("@source_link", data.source_link);
                    parameter.Add("@start_year", data.start_year);
                    parameter.Add("@end_year", data.end_year);
                    parameter.Add("@start_date", data.start_date);
                    parameter.Add("@end_date", data.end_date);
                    parameter.Add("@complete", data.complete);
                    parameter.Add("@retrieval_way", data.retrieval_way);
                    parameter.Add("@file_type", data.file_type);
                    parameter.Add("@primary_secondary", data.primary_secondary);
                    parameter.Add("@storage", data.storage);
                    parameter.Add("@archive", data.archive);
                    parameter.Add("@init_source", data.init_source);
                    parameter.Add("@scientific", data.scientific);
                    parameter.Add("@source_type", data.source_type);
                    parameter.Add("@meta_vars", data.meta_vars);
                    parameter.Add("@organization_name_av", data.organization_name_av);
                    parameter.Add("@annot_av", data.annot_av);
                    parameter.Add("@codebook_av", data.codebook_av);
                    parameter.Add("@vars", data.vars);
                    parameter.Add("@analysis_type", data.analysis_type);
                    parameter.Add("@full_text_av", data.full_text_av);
                    parameter.Add("@text_ready", data.text_ready);
                    parameter.Add("@corpus_type", data.corpus_type);
                    parameter.Add("@registration", data.registration);
                    parameter.Add("@free_access", data.free_access);
                    parameter.Add("@copyright", data.copyright);
                    parameter.Add("@copyright_owner", data.copyright_owner);
                    parameter.Add("@notes", data.notes);
                    parameter.Add("@type", data.type);
                    parameter.Add("@description", data.description);
                    parameter.Add("@regio_supranat", data.regio_supranat);
                    parameter.Add("@regio_subnat_dummy", data.regio_subnat_dummy);
                    parameter.Add("@regio_subnat_labels", data.regio_subnat_labels);
                    parameter.Add("@language", data.language);
                    parameter.Add("@subtype", data.subtype);
                    parameter.Add("@license", data.license);
                    parameter.Add("@date", data.date);
                    parameter.Add("@interruptions", data.interruptions);
                    parameter.Add("@platform", data.platform);
                    parameter.Add("@doi", data.doi);
                    parameter.Add("@linked_opted_material", data.linked_opted_material);
                    parameter.Add("@user_access", data.user_access);
                    parameter.Add("@general_concept", data.general_concept);
                    parameter.Add("@programming_language", data.programming_language);
                    parameter.Add("@isApproved", data.isApproved);
                    parameter.Add("@isActive", data.isActive);
                    insertData = connection.Query<int>("SP_AddResearchDetails", parameter, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return insertData;
        }

        public List<ResearchDetails> GetGridData(SearchRequest searchRequest)
        {
            List<ResearchDetails> gridDatra = new List<ResearchDetails>();
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    if (!string.IsNullOrEmpty(searchRequest.country_name)) 
                    {
                        parameter.Add("@country_name", searchRequest.country_name);
                    }
                    if (!string.IsNullOrEmpty(searchRequest.region))
                    {
                        parameter.Add("@region", searchRequest.region);
                    }
                    if (!string.IsNullOrEmpty(searchRequest.start_year))
                    {
                        parameter.Add("@start_year", searchRequest.start_year);
                    }
                    if (!string.IsNullOrEmpty(searchRequest.end_year))
                    {
                        parameter.Add("@end_year", searchRequest.end_year);
                    }
                    if (!string.IsNullOrEmpty(searchRequest.search_text))
                    {
                        parameter.Add("@search_text", searchRequest.search_text);
                    }

                    gridDatra = connection.Query<ResearchDetails>("SP_GetResearchDetails", parameter, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return gridDatra;
        }

        public List<ResearchDetails> GetManageGridData()
        {
            List<ResearchDetails> gridDatra = new List<ResearchDetails>();
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    gridDatra = connection.Query<ResearchDetails>("SP_GetManageResearchDetails", parameter, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return gridDatra;
        }

        public List<CountryLookUp> GetCountryLookUp()
        {
            List<CountryLookUp> lookUp = new List<CountryLookUp>();
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    lookUp = connection.Query<CountryLookUp>("SP_GetCountryList", parameter, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return lookUp;
        }

        public List<string> GetLanguageLookUp()
        {
            List<string> lookUp = new List<string>();
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    lookUp = connection.Query<string>("SP_GetLanguageList", parameter, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return lookUp;
        }

        public int ApproveResource(ApproveRejectRequest approveRejectRequest)
        {
            try
            {

                using (IDbConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    DynamicParameters parameter = new DynamicParameters();
                    if (!string.IsNullOrEmpty(approveRejectRequest.comment))
                    {
                        parameter.Add("@comment", approveRejectRequest.comment);
                    }
                    parameter.Add("@isApproved", approveRejectRequest.isApproved);
                    parameter.Add("@uid", approveRejectRequest.uid);
                    connection.Query<LookUp>("SP_ApproveRejectResource", parameter, commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ResetColor();
            }

            return 10;
        }
    }
}
