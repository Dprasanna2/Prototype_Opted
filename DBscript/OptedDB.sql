CREATE DATABASE OptedDB
Go

USE [OptedDB]
Go

CREATE TABLE ResearchDetails
(
    uid UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
    researchOld_uid NVARCHAR(max),
    country_name NVARCHAR(max),
    country_iso NVARCHAR(max),
    region NVARCHAR(max),
    parties NVARCHAR(max),
    eu_member NVARCHAR(max),
    text_category NVARCHAR(max),
    text_type NVARCHAR(max),
    source_name NVARCHAR(max),
    source_link NVARCHAR(max),
    start_year NVARCHAR(max),
    end_year NVARCHAR(max),
    start_date NVARCHAR(max),
    end_date NVARCHAR(max),
    complete NVARCHAR(max),
    retrieval_way NVARCHAR(max),
    file_type NVARCHAR(max),
    primary_secondary NVARCHAR(max),
    storage NVARCHAR(max),
    archive NVARCHAR(max),
    init_source NVARCHAR(max),
    scientific NVARCHAR(max),
    source_type NVARCHAR(max),
    meta_vars NVARCHAR(max),
    organization_name_av NVARCHAR(max),
    annot_av NVARCHAR(max),
    codebook_av NVARCHAR(max),
    vars NVARCHAR(max),
    analysis_type NVARCHAR(max),
    full_text_av NVARCHAR(max),
    text_ready NVARCHAR(max),
    corpus_type NVARCHAR(max),
    registration NVARCHAR(max),
    free_access NVARCHAR(max),
    copyright NVARCHAR(max),
    copyright_owner NVARCHAR(max),
    notes NVARCHAR(max),
    type NVARCHAR(max),
    description NVARCHAR(max),
    regio_supranat NVARCHAR(max),
    regio_subnat_dummy NVARCHAR(max),
    regio_subnat_labels NVARCHAR(max),
    language NVARCHAR(max),
    subtype NVARCHAR(max),
    license NVARCHAR(max),
    date NVARCHAR(max),
    interruptions NVARCHAR(max),
    platform NVARCHAR(max),
    doi NVARCHAR(max),
    linked_opted_material NVARCHAR(max),
    user_access NVARCHAR(max),
    general_concept NVARCHAR(max),
    programming_language NVARCHAR(max),
    createdBy NVARCHAR(max),
    createdDate NVARCHAR(max),
    updatedBy NVARCHAR(max),
    updatedDate NVARCHAR(max),
    isApproved BIT DEFAULT NULL,
    approvedBy NVARCHAR(max),
    approvedDate NVARCHAR(max),
    comment NVARCHAR(max),
    isActive BIT DEFAULT 1
);
GO

CREATE INDEX idx_ResearchDetails_isApproved
ON ResearchDetails(isApproved);
GO

CREATE proc [dbo].[SP_AddResearchDetails]
    @researchOld_uid NVARCHAR(max) = NULL,
    @country_name NVARCHAR(max) = NULL,
    @country_iso NVARCHAR(max) = NULL,
    @region NVARCHAR(max) = NULL,
    @parties NVARCHAR(max) = NULL,
    @eu_member NVARCHAR(max) = NULL,
    @text_category NVARCHAR(max) = NULL,
    @text_type NVARCHAR(max) = NULL,
    @source_name NVARCHAR(max) = NULL,
    @source_link NVARCHAR(max) = NULL,
    @start_year NVARCHAR(max) = NULL,
    @end_year NVARCHAR(max) = NULL,
    @start_date NVARCHAR(max) = NULL,
    @end_date NVARCHAR(max) = NULL,
    @complete NVARCHAR(max) = NULL,
    @retrieval_way NVARCHAR(max) = NULL,
    @file_type NVARCHAR(max) = NULL,
    @primary_secondary NVARCHAR(max) = NULL,
    @storage NVARCHAR(max) = NULL,
    @archive NVARCHAR(max) = NULL,
    @init_source NVARCHAR(max) = NULL,
    @scientific NVARCHAR(max) = NULL,
    @source_type NVARCHAR(max) = NULL,
    @meta_vars NVARCHAR(max) = NULL,
    @organization_name_av NVARCHAR(max) = NULL,
    @annot_av NVARCHAR(max) = NULL,
    @codebook_av NVARCHAR(max) = NULL,
    @vars NVARCHAR(max) = NULL,
    @analysis_type NVARCHAR(max) = NULL,
    @full_text_av NVARCHAR(max) = NULL,
    @text_ready NVARCHAR(max) = NULL,
    @corpus_type NVARCHAR(max) = NULL,
    @registration NVARCHAR(max) = NULL,
    @free_access NVARCHAR(max) = NULL,
    @copyright NVARCHAR(max) = NULL,
    @copyright_owner NVARCHAR(max) = NULL,
    @notes NVARCHAR(max) = NULL,
    @type NVARCHAR(max) = NULL,
    @description NVARCHAR(max) = NULL,
    @regio_supranat NVARCHAR(max) = NULL,
    @regio_subnat_dummy NVARCHAR(max) = NULL,
    @regio_subnat_labels NVARCHAR(max) = NULL,
    @language NVARCHAR(max) = NULL,
    @subtype NVARCHAR(max) = NULL,
    @license NVARCHAR(max) = NULL,
    @date NVARCHAR(max) = NULL,
    @interruptions NVARCHAR(max) = NULL,
    @platform NVARCHAR(max) = NULL,
    @doi NVARCHAR(max) = NULL,
    @linked_opted_material NVARCHAR(max) = NULL,
    @user_access NVARCHAR(max) = NULL,
    @general_concept NVARCHAR(max) = NULL,
    @programming_language NVARCHAR(max) = NULL,
    @createdBy NVARCHAR(max) = NULL,
    @createdDate NVARCHAR(max) = NULL,
    @updatedBy NVARCHAR(max) = NULL,
    @updatedDate NVARCHAR(max) = NULL,
    @isApproved BIT = NULL,
    @approvedBy NVARCHAR(max) = NULL,
    @approvedDate NVARCHAR(max) = NULL,
    @comment NVARCHAR(max) = NULL,
    @isActive BIT = NULL
as
begin	
    declare @id UNIQUEIDENTIFIER = NULL;
    declare @return int = -1;
    select @id = uid from ResearchDetails where ( @doi != 'NA' AND doi = @doi ) OR ( @source_link != 'NA' AND source_link = @source_link )
    IF @id IS NULL
    BEGIN
        INSERT INTO ResearchDetails
            (researchOld_uid, country_name, country_iso, region, parties, eu_member, text_category, text_type, source_name, source_link, start_year, end_year, start_date, end_date, complete, retrieval_way, file_type, primary_secondary, storage, archive, init_source, scientific, source_type, meta_vars, organization_name_av, annot_av, codebook_av, vars, analysis_type, full_text_av, text_ready, corpus_type, registration, free_access, copyright, copyright_owner, notes, type, description, regio_supranat, regio_subnat_dummy, regio_subnat_labels, language, subtype, license, date, interruptions, platform, doi, linked_opted_material, user_access, general_concept, programming_language, createdBy, createdDate, updatedBy, updatedDate, isApproved, approvedBy, approvedDate, comment, isActive)
        VALUES
            (@researchOld_uid, @country_name, @country_iso, @region, @parties, @eu_member, @text_category, @text_type, @source_name, @source_link, @start_year, @end_year, @start_date, @end_date, @complete, @retrieval_way, @file_type, @primary_secondary, @storage, @archive, @init_source, @scientific, @source_type, @meta_vars, @organization_name_av, @annot_av, @codebook_av, @vars, @analysis_type, @full_text_av, @text_ready, @corpus_type, @registration, @free_access, @copyright, @copyright_owner, @notes, @type, @description, @regio_supranat, @regio_subnat_dummy, @regio_subnat_labels, @language, @subtype, @license, @date, @interruptions, @platform, @doi, @linked_opted_material, @user_access, @general_concept, @programming_language, @createdBy, @createdDate, @updatedBy, @updatedDate, @isApproved, @approvedBy, @approvedDate, @comment, @isActive);
		set @return = 1;
	END
	return @return;
end

GO

CREATE proc [dbo].[SP_ActivateDeactiveResource]
    @uid UNIQUEIDENTIFIER,
    @isActive BIT
as
begin	
    UPDATE ResearchDetails
    SET isActive = @isActive
	WHERE	[uid] = @uid
end
GO

CREATE proc [dbo].[SP_ApproveRejectResource]
    @uid UNIQUEIDENTIFIER,
    @isApproved BIT,
    @comment NVARCHAR(max) = NULL
as
begin	
    if (@comment IS NULL)
        BEGIN
            UPDATE ResearchDetails
            SET isApproved = @isApproved
            WHERE	[uid] = @uid
        END
    ELSE
        BEGIN
            UPDATE ResearchDetails
            SET isApproved = @isApproved,
				comment = @comment
            WHERE	[uid] = @uid
        END
end
GO

CREATE proc [dbo].[SP_GetResearchDetails]
    @country_name NVARCHAR(max) = NULL,
    @region NVARCHAR(max) = NULL,
    @start_year NVARCHAR(max) = NULL,
    @end_year NVARCHAR(max) = NULL,
	@search_text NVARCHAR(max) = NULL,
    @isApproved BIT = NULL
as
begin	
    Select * FROM ResearchDetails
	WHERE	isApproved = 1 AND
            (@search_text IS NULL OR source_name LIKE '%'+@search_text+'%' OR  country_name LIKE '%'+@search_text+'%' OR region LIKE '%'+@search_text+'%' OR [description] LIKE '%'+@search_text+'%') AND
			(@country_name IS NULL OR country_name LIKE '%'+@country_name+'%') AND
			(@region IS NULL OR region LIKE '%'+@region+'%') AND
			(@start_year IS NULL OR start_year = @start_year) AND
			(@end_year IS NULL OR end_year = @end_year)
end
GO

CREATE proc [dbo].[SP_GetManageResearchDetails]
as
begin	
    Select * FROM ResearchDetails
	WHERE isApproved IS NULL OR isApproved = 0
end
GO

CREATE proc [dbo].[SP_GetCountryList]
as
begin	
    Select Id, CountryName, CountryIso FROM CountryList
end
GO

CREATE TABLE CountryList
(
    Id INT PRIMARY KEY IDENTITY,
    CountryName NVARCHAR(500) NOT NULL,
    CountryIso NVARCHAR(500) NOT NULL
)
Go

--#region [Insert CountryList]

INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Albania', 'AL');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Armenia', 'AM');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Austria', 'AT');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Azerbaijan', 'AZE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Belarus', 'BY');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Belgium', 'BE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Bosnia and Herzegovina', 'BA');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Bulgaria', 'BG');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Croatia', 'HR');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Cyprus', 'CY');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Czechia', 'CZE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Czech Republic','CZE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Denmark', 'DK');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Estonia', 'EE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Finland', 'FI');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('France', 'FR');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Georgia', 'GE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Germany', 'DE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Greece', 'GR');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Hungary', 'HU');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Iceland', 'IS');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Ireland', 'IE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Italy', 'IT');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Kazakhstan', 'KZ');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Kosovo', 'XK');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Latvia', 'LV');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Lithuania', 'LT');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Luxembourg', 'LU');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Malta', 'MT');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Moldova', 'MD');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Montenegro', 'ME');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Netherlands', 'NL');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('North Macedonia', 'MKD');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Norway', 'NO');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Poland', 'PL');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Portugal', 'PT');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Romania', 'RO');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Russia', 'RU');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('San Marino', 'SM');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Serbia', 'RS');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Slovakia', 'SK');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Slovenia', 'SI');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Spain', 'ES');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Sweden', 'SE');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Switzerland', 'CH');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Turkey', 'TR');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('Ukraine', 'UA');
INSERT INTO CountryList (CountryName, CountryIso) VALUES  ('United Kingdom', 'GB');

--#endregion

CREATE TABLE LanguageList
(
    Id INT PRIMARY KEY IDENTITY,
    LanguageName NVARCHAR(500) NOT NULL UNIQUE
)
Go

CREATE proc [dbo].[SP_GetLanguageList]
as
begin	
    Select LanguageName FROM LanguageList
end
GO

--#region [Insert LanguageList]

INSERT INTO LanguageList (LanguageName) VALUES  ('Afar');
INSERT INTO LanguageList (LanguageName) VALUES  ('Abkhazian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Achinese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Acoli');
INSERT INTO LanguageList (LanguageName) VALUES  ('Adangme');
INSERT INTO LanguageList (LanguageName) VALUES  ('Adyghe; Adygei');
INSERT INTO LanguageList (LanguageName) VALUES  ('Afro-Asiatic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Afrihili');
INSERT INTO LanguageList (LanguageName) VALUES  ('Afrikaans');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ainu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Akan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Akkadian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Albanian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Aleut');
INSERT INTO LanguageList (LanguageName) VALUES  ('Algonquian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Southern Altai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Amharic');
INSERT INTO LanguageList (LanguageName) VALUES  ('English, Old (ca.450-1100)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Angika');
INSERT INTO LanguageList (LanguageName) VALUES  ('Apache languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Arabic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Aragonese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Armenian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mapudungun; Mapuche');
INSERT INTO LanguageList (LanguageName) VALUES  ('Arapaho');
INSERT INTO LanguageList (LanguageName) VALUES  ('Artificial languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Arawak');
INSERT INTO LanguageList (LanguageName) VALUES  ('Assamese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Asturian; Bable; Leonese; Asturleonese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Athapascan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Australian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Avaric');
INSERT INTO LanguageList (LanguageName) VALUES  ('Avestan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Awadhi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Aymara');
INSERT INTO LanguageList (LanguageName) VALUES  ('Azerbaijani');
INSERT INTO LanguageList (LanguageName) VALUES  ('Banda languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bamileke languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bashkir');
INSERT INTO LanguageList (LanguageName) VALUES  ('Baluchi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bambara');
INSERT INTO LanguageList (LanguageName) VALUES  ('Balinese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Basque');
INSERT INTO LanguageList (LanguageName) VALUES  ('Basa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Baltic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Beja; Bedawiyet');
INSERT INTO LanguageList (LanguageName) VALUES  ('Belarusian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bemba');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bengali');
INSERT INTO LanguageList (LanguageName) VALUES  ('Berber languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bhojpuri');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bihari languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bikol');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bini; Edo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bislama');
INSERT INTO LanguageList (LanguageName) VALUES  ('Siksika');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bantu languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tibetan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bosnian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Braj');
INSERT INTO LanguageList (LanguageName) VALUES  ('Breton');
INSERT INTO LanguageList (LanguageName) VALUES  ('Batak languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Buriat');
INSERT INTO LanguageList (LanguageName) VALUES  ('Buginese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bulgarian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Burmese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Blin; Bilin');
INSERT INTO LanguageList (LanguageName) VALUES  ('Caddo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Central American Indian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Galibi Carib');
INSERT INTO LanguageList (LanguageName) VALUES  ('Catalan; Valencian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Caucasian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cebuano');
INSERT INTO LanguageList (LanguageName) VALUES  ('Celtic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Czech');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chamorro');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chibcha');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chechen');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chagatai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chinese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chuukese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mari');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chinook jargon');
INSERT INTO LanguageList (LanguageName) VALUES  ('Choctaw');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chipewyan; Dene Suline');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cherokee');
INSERT INTO LanguageList (LanguageName) VALUES  ('Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chuvash');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cheyenne');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chamic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Montenegrin');
INSERT INTO LanguageList (LanguageName) VALUES  ('Coptic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cornish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Corsican');
INSERT INTO LanguageList (LanguageName) VALUES  ('Creoles and pidgins, English based');
INSERT INTO LanguageList (LanguageName) VALUES  ('Creoles and pidgins, French-based');
INSERT INTO LanguageList (LanguageName) VALUES  ('Creoles and pidgins, Portuguese-based');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cree');
INSERT INTO LanguageList (LanguageName) VALUES  ('Crimean Tatar; Crimean Turkish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Creoles and pidgins');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kashubian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Cushitic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Welsh');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dakota');
INSERT INTO LanguageList (LanguageName) VALUES  ('Danish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dargwa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Land Dayak languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Delaware');
INSERT INTO LanguageList (LanguageName) VALUES  ('Slave (Athapascan)');
INSERT INTO LanguageList (LanguageName) VALUES  ('German');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dogrib');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dinka');
INSERT INTO LanguageList (LanguageName) VALUES  ('Divehi; Dhivehi; Maldivian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dogri');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dravidian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lower Sorbian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Duala');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dutch, Middle (ca.1050-1350)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dutch; Flemish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dyula');
INSERT INTO LanguageList (LanguageName) VALUES  ('Dzongkha');
INSERT INTO LanguageList (LanguageName) VALUES  ('Efik');
INSERT INTO LanguageList (LanguageName) VALUES  ('Egyptian (Ancient)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ekajuk');
INSERT INTO LanguageList (LanguageName) VALUES  ('Greek, Modern (1453-)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Elamite');
INSERT INTO LanguageList (LanguageName) VALUES  ('English');
INSERT INTO LanguageList (LanguageName) VALUES  ('English, Middle (1100-1500)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Esperanto');
INSERT INTO LanguageList (LanguageName) VALUES  ('Estonian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ewe');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ewondo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Fang');
INSERT INTO LanguageList (LanguageName) VALUES  ('Faroese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Persian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Fanti');
INSERT INTO LanguageList (LanguageName) VALUES  ('Fijian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Filipino; Pilipino');
INSERT INTO LanguageList (LanguageName) VALUES  ('Finnish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Finno-Ugrian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Fon');
INSERT INTO LanguageList (LanguageName) VALUES  ('French');
INSERT INTO LanguageList (LanguageName) VALUES  ('French, Middle (ca.1400-1600)');
INSERT INTO LanguageList (LanguageName) VALUES  ('French, Old (842-ca.1400)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Northern Frisian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Eastern Frisian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Western Frisian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Fulah');
INSERT INTO LanguageList (LanguageName) VALUES  ('Friulian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ga');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gayo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gbaya');
INSERT INTO LanguageList (LanguageName) VALUES  ('Germanic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Georgian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Geez');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gilbertese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gaelic; Scottish Gaelic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Irish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Galician');
INSERT INTO LanguageList (LanguageName) VALUES  ('Manx');
INSERT INTO LanguageList (LanguageName) VALUES  ('German, Middle High (ca.1050-1500)');
INSERT INTO LanguageList (LanguageName) VALUES  ('German, Old High (ca.750-1050)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gondi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gorontalo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gothic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Grebo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Greek, Ancient (to 1453)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Guarani');
INSERT INTO LanguageList (LanguageName) VALUES  ('Swiss German; Alemannic; Alsatian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gujarati');
INSERT INTO LanguageList (LanguageName) VALUES  ('Gwich''in');
INSERT INTO LanguageList (LanguageName) VALUES  ('Haida');
INSERT INTO LanguageList (LanguageName) VALUES  ('Haitian; Haitian Creole');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hausa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hawaiian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hebrew');
INSERT INTO LanguageList (LanguageName) VALUES  ('Herero');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hiligaynon');
INSERT INTO LanguageList (LanguageName) VALUES  ('Himachali languages; Western Pahari languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hindi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hittite');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hmong; Mong');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hiri Motu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Croatian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Upper Sorbian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hungarian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Hupa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Iban');
INSERT INTO LanguageList (LanguageName) VALUES  ('Igbo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Icelandic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ido');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sichuan Yi; Nuosu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ijo languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Inuktitut');
INSERT INTO LanguageList (LanguageName) VALUES  ('Interlingue; Occidental');
INSERT INTO LanguageList (LanguageName) VALUES  ('Iloko');
INSERT INTO LanguageList (LanguageName) VALUES  ('Interlingua (International Auxiliary Language Association)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Indic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Indonesian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Indo-European languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ingush');
INSERT INTO LanguageList (LanguageName) VALUES  ('Inupiaq');
INSERT INTO LanguageList (LanguageName) VALUES  ('Iranian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Iroquoian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Italian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Javanese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lojban');
INSERT INTO LanguageList (LanguageName) VALUES  ('Japanese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Judeo-Persian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Judeo-Arabic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kara-Kalpak');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kabyle');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kachin; Jingpho');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kalaallisut; Greenlandic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kamba');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kannada');
INSERT INTO LanguageList (LanguageName) VALUES  ('Karen languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kashmiri');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kanuri');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kawi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kazakh');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kabardian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Khasi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Khoisan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Central Khmer');
INSERT INTO LanguageList (LanguageName) VALUES  ('Khotanese; Sakan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kikuyu; Gikuyu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kinyarwanda');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kirghiz; Kyrgyz');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kimbundu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Konkani');
INSERT INTO LanguageList (LanguageName) VALUES  ('Komi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kongo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Korean');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kosraean');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kpelle');
INSERT INTO LanguageList (LanguageName) VALUES  ('Karachay-Balkar');
INSERT INTO LanguageList (LanguageName) VALUES  ('Karelian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kru languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kurukh');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kuanyama; Kwanyama');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kumyk');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kurdish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kutenai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ladino');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lahnda');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lamba');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lao');
INSERT INTO LanguageList (LanguageName) VALUES  ('Latin');
INSERT INTO LanguageList (LanguageName) VALUES  ('Latvian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lezghian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Limburgan; Limburger; Limburgish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lingala');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lithuanian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mongo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lozi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Luxembourgish; Letzeburgesch');
INSERT INTO LanguageList (LanguageName) VALUES  ('Luba-Lulua');
INSERT INTO LanguageList (LanguageName) VALUES  ('Luba-Katanga');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ganda');
INSERT INTO LanguageList (LanguageName) VALUES  ('Luiseno');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lunda');
INSERT INTO LanguageList (LanguageName) VALUES  ('Luo (Kenya and Tanzania)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lushai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Macedonian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Madurese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Magahi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Marshallese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Maithili');
INSERT INTO LanguageList (LanguageName) VALUES  ('Makasar');
INSERT INTO LanguageList (LanguageName) VALUES  ('Malayalam');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mandingo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Maori');
INSERT INTO LanguageList (LanguageName) VALUES  ('Austronesian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Marathi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Masai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Malay');
INSERT INTO LanguageList (LanguageName) VALUES  ('Moksha');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mandar');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mende');
INSERT INTO LanguageList (LanguageName) VALUES  ('Irish, Middle (900-1200)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mi''kmaq; Micmac');
INSERT INTO LanguageList (LanguageName) VALUES  ('Minangkabau');
INSERT INTO LanguageList (LanguageName) VALUES  ('Uncoded languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mon-Khmer languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Malagasy');
INSERT INTO LanguageList (LanguageName) VALUES  ('Maltese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Manchu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Manipuri');
INSERT INTO LanguageList (LanguageName) VALUES  ('Manobo languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mohawk');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mongolian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mossi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Multiple languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Munda languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Creek');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mirandese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Marwari');
INSERT INTO LanguageList (LanguageName) VALUES  ('Mayan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Erzya');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nahuatl languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('North American Indian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Neapolitan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nauru');
INSERT INTO LanguageList (LanguageName) VALUES  ('Navajo; Navaho');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ndebele, South; South Ndebele');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ndebele, North; North Ndebele');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ndonga');
INSERT INTO LanguageList (LanguageName) VALUES  ('Low German; Low Saxon; German, Low; Saxon, Low');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nepali');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nepal Bhasa; Newari');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nias');
INSERT INTO LanguageList (LanguageName) VALUES  ('Niger-Kordofanian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Niuean');
INSERT INTO LanguageList (LanguageName) VALUES  ('Norwegian Nynorsk; Nynorsk, Norwegian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Bokmål, Norwegian; Norwegian Bokmål');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nogai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Norse, Old');
INSERT INTO LanguageList (LanguageName) VALUES  ('Norwegian');
INSERT INTO LanguageList (LanguageName) VALUES  ('N''Ko');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pedi; Sepedi; Northern Sotho');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nubian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Classical Newari; Old Newari; Classical Nepal Bhasa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Chichewa; Chewa; Nyanja');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nyamwezi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nyankole');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nyoro');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nzima');
INSERT INTO LanguageList (LanguageName) VALUES  ('Occitan (post 1500)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ojibwa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Oriya');
INSERT INTO LanguageList (LanguageName) VALUES  ('Oromo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Osage');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ossetian; Ossetic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Turkish, Ottoman (1500-1928)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Otomian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Papuan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pangasinan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pahlavi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pampanga; Kapampangan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Panjabi; Punjabi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Papiamento');
INSERT INTO LanguageList (LanguageName) VALUES  ('Palauan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Persian, Old (ca.600-400 B.C.)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Philippine languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Phoenician');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pali');
INSERT INTO LanguageList (LanguageName) VALUES  ('Polish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pohnpeian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Portuguese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Prakrit languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Provençal, Old (to 1500);Occitan, Old (to 1500)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Pushto; Pashto');
INSERT INTO LanguageList (LanguageName) VALUES  ('Reserved for local use');
INSERT INTO LanguageList (LanguageName) VALUES  ('Quechua');
INSERT INTO LanguageList (LanguageName) VALUES  ('Rajasthani');
INSERT INTO LanguageList (LanguageName) VALUES  ('Rapanui');
INSERT INTO LanguageList (LanguageName) VALUES  ('Rarotongan; Cook Islands Maori');
INSERT INTO LanguageList (LanguageName) VALUES  ('Romance languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Romansh');
INSERT INTO LanguageList (LanguageName) VALUES  ('Romany');
INSERT INTO LanguageList (LanguageName) VALUES  ('Romanian; Moldavian; Moldovan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Rundi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Aromanian; Arumanian; Macedo-Romanian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Russian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sandawe');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sango');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yakut');
INSERT INTO LanguageList (LanguageName) VALUES  ('South American Indian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Salishan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Samaritan Aramaic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sanskrit');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sasak');
INSERT INTO LanguageList (LanguageName) VALUES  ('Santali');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sicilian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Scots');
INSERT INTO LanguageList (LanguageName) VALUES  ('Selkup');
INSERT INTO LanguageList (LanguageName) VALUES  ('Semitic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Irish, Old (to 900)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sign Languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Shan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sidamo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sinhala; Sinhalese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Siouan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sino-Tibetan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Slavic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Slovak');
INSERT INTO LanguageList (LanguageName) VALUES  ('Slovenian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Southern Sami');
INSERT INTO LanguageList (LanguageName) VALUES  ('Northern Sami');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sami languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Lule Sami');
INSERT INTO LanguageList (LanguageName) VALUES  ('Inari Sami');
INSERT INTO LanguageList (LanguageName) VALUES  ('Samoan');
INSERT INTO LanguageList (LanguageName) VALUES  ('Skolt Sami');
INSERT INTO LanguageList (LanguageName) VALUES  ('Shona');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sindhi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Soninke');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sogdian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Somali');
INSERT INTO LanguageList (LanguageName) VALUES  ('Songhai languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sotho, Southern');
INSERT INTO LanguageList (LanguageName) VALUES  ('Spanish; Castilian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sardinian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sranan Tongo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Serbian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Serer');
INSERT INTO LanguageList (LanguageName) VALUES  ('Nilo-Saharan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Swati');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sukuma');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sundanese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Susu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sumerian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Swahili');
INSERT INTO LanguageList (LanguageName) VALUES  ('Swedish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Classical Syriac');
INSERT INTO LanguageList (LanguageName) VALUES  ('Syriac');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tahitian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tai languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tamil');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tatar');
INSERT INTO LanguageList (LanguageName) VALUES  ('Telugu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Timne');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tereno');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tetum');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tajik');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tagalog');
INSERT INTO LanguageList (LanguageName) VALUES  ('Thai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tigre');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tigrinya');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tiv');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tokelau');
INSERT INTO LanguageList (LanguageName) VALUES  ('Klingon; tlhIngan-Hol');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tlingit');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tamashek');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tonga (Nyasa)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tonga (Tonga Islands)');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tok Pisin');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tsimshian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tswana');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tsonga');
INSERT INTO LanguageList (LanguageName) VALUES  ('Turkmen');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tumbuka');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tupi languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Turkish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Altaic languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tuvalu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Twi');
INSERT INTO LanguageList (LanguageName) VALUES  ('Tuvinian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Udmurt');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ugaritic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Uighur; Uyghur');
INSERT INTO LanguageList (LanguageName) VALUES  ('Ukrainian');
INSERT INTO LanguageList (LanguageName) VALUES  ('Umbundu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Undetermined');
INSERT INTO LanguageList (LanguageName) VALUES  ('Urdu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Uzbek');
INSERT INTO LanguageList (LanguageName) VALUES  ('Vai');
INSERT INTO LanguageList (LanguageName) VALUES  ('Venda');
INSERT INTO LanguageList (LanguageName) VALUES  ('Vietnamese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Volapük');
INSERT INTO LanguageList (LanguageName) VALUES  ('Votic');
INSERT INTO LanguageList (LanguageName) VALUES  ('Wakashan languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Wolaitta; Wolaytta');
INSERT INTO LanguageList (LanguageName) VALUES  ('Waray');
INSERT INTO LanguageList (LanguageName) VALUES  ('Washo');
INSERT INTO LanguageList (LanguageName) VALUES  ('Sorbian languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Walloon');
INSERT INTO LanguageList (LanguageName) VALUES  ('Wolof');
INSERT INTO LanguageList (LanguageName) VALUES  ('Kalmyk; Oirat');
INSERT INTO LanguageList (LanguageName) VALUES  ('Xhosa');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yao');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yapese');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yiddish');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yoruba');
INSERT INTO LanguageList (LanguageName) VALUES  ('Yupik languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zapotec');
INSERT INTO LanguageList (LanguageName) VALUES  ('Blissymbols; Blissymbolics; Bliss');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zenaga');
INSERT INTO LanguageList (LanguageName) VALUES  ('Standard Moroccan Tamazight');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zhuang; Chuang');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zande languages');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zulu');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zuni');
INSERT INTO LanguageList (LanguageName) VALUES  ('No linguistic content; Not applicable');
INSERT INTO LanguageList (LanguageName) VALUES  ('Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki');

--#endregion
