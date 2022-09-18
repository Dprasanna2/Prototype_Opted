export class ResearchDetail {
    public uid!: string;
    public researchOld_uid!: string;
    public country_name!: string;
    public country_iso!: string;
    public region!: string;
    public parties!: string;
    public eu_member!: string;
    public text_category!: string;
    public text_type!: string;
    public source_name!: string;
    public source_link!: string;
    public start_year!: string;
    public end_year!: string;
    public start_date!: string;
    public end_date!: string;
    public complete!: string;
    public retrieval_way!: string;
    public file_type!: string;
    public primary_secondary!: string;
    public storage!: string;
    public archive!: string;
    public init_source!: string;
    public scientific!: string;
    public source_type!: string;
    public meta_vars!: string;
    public organization_name_av!: string;
    public annot_av!: string;
    public codebook_av!: string;
    public vars!: string;
    public analysis_type!: string;
    public full_text_av!: string;
    public text_ready!: string;
    public corpus_type!: string;
    public registration!: string;
    public free_access!: string;
    public copyright!: string;
    public copyright_owner!: string;
    public notes!: string;
    public type!: string;
    public description!: string;
    public regio_supranat!: string;
    public regio_subnat_dummy!: string;
    public regio_subnat_labels!: string;
    public language!: string;
    public subtype!: string;
    public license!: string;
    public date!: string;
    public interruptions!: string;
    public platform!: string;
    public doi!: string;
    public linked_opted_material!: string;
    public user_access!: string;
    public general_concept!: string;
    public programming_language!: string;
    public createdBy!: string;
    public createdDate!: string;
    public updatedBy!: string;
    public updatedDate!: string;
}

export class SearchRequest {
    public country_name!: string;
    public region!: string;
    public start_year!: string;
    public end_year!: string;
    public search_text!: string;
}

export class ApproveRejectRequest
{
    public uid!: string;
    public comment!: string;
    public isApproved!: boolean;
}