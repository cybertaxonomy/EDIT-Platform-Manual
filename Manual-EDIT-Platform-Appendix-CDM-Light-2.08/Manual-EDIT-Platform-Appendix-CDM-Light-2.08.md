![C:\\Users\\a.mueller\\Desktop\\piB\\Screenshots\\EDIT.png](./media/image1.png){width="6.527777777777778in" height="2.4618055555555554in"}

TaxEditor

User manual, appendix:

Platform output model for botany ("CDM-light" 2.07)

Version: 20 June 2022

Katja Luther, Andreas Müller, Andreas Kohlbecker, Anton Güntsch & Walter G. Berendsohn

Botanischer Garten und Botanisches Museum Berlin, Freie Universität Berlin

![CC0](./media/image2.png){width="0.9201388888888888in" height="0.32013888888888886in"}\
To the extent possible under law, the authors has waived all copyright and related or neighboring rights to EDIT Platform for Cybertaxonomy output model for botany ("CDM-light" 2.07). This work is published from: Germany.

**Contents**

[1 Introduction [2](#introduction)](#introduction)

[Current limitations: [2](#current-limitations)](#current-limitations)

[Implementation [2](#implementation)](#implementation)

[Conventions [2](#conventions)](#conventions)

[2 Table definitions (export) [3](#table-definitions-export)](#table-definitions-export)

[CommonNameFact.csv [3](#commonnamefact.csv)](#commonnamefact.csv)

[CondensedDistributionFact.csv [3](#_Toc80612194)](#_Toc80612194)

[FactSources.csv [3](#factsources.csv)](#factsources.csv)

[GeographicAreaFact.csv [3](#geographicareafact.csv)](#geographicareafact.csv)

[HomotypicGroup.csv [3](#homotypicgroup.csv)](#homotypicgroup.csv)

[Identifier.csv [4](#identifier.csv)](#identifier.csv)

[MediaFact [4](#mediafact)](#mediafact)

[Metadata [5](#metadata)](#metadata)

[NameFact.csv [5](#namefact.csv)](#namefact.csv)

[NameRelationship [5](#namerelationship)](#namerelationship)

[PersonOrTeam.csv [5](#personorteam.csv)](#personorteam.csv)

[PersonTeamRelation.csv [6](#personteamrelation.csv)](#personteamrelation.csv)

[Reference.csv [6](#reference.csv)](#reference.csv)

[ScientificName.csv [7](#scientificname.csv)](#scientificname.csv)

[SimpleFact.csv [8](#simplefact.csv)](#simplefact.csv)

[Specimen.csv [8](#specimen.csv)](#specimen.csv)

[SpecimenFact [9](#specimenfact)](#specimenfact)

[Synonym [9](#synonym)](#synonym)

[Taxon [10](#taxon)](#taxon)

[TaxonInteractionFact [11](#taxoninteractionfact)](#taxoninteractionfact)

[TypeSpecimen [11](#typespecimen)](#typespecimen)

[Additional tables (for processing in MS Access and Word) [12](#additional-tables-for-processing-in-ms-access-and-word)](#additional-tables-for-processing-in-ms-access-and-word)

[Facts2Use (designates fact categories that should be processed and their sequence in the output) [12](#facts2use-designates-fact-categories-that-should-be-processed-and-their-sequence-in-the-output)](#facts2use-designates-fact-categories-that-should-be-processed-and-their-sequence-in-the-output)

[Settings (controls output) [12](#settings-controls-output)](#settings-controls-output)

[3 Schema.ini file [13](#schema.ini-file)](#schema.ini-file)

[4 Processing CDM-Light with Microsoft Office programs [16](#processing-cdm-light-with-microsoft-office-programs)](#processing-cdm-light-with-microsoft-office-programs)

[4.1. Role of schema.ini [16](#role-of-schema.ini)](#role-of-schema.ini)

[4.2. Producing Print-Output (Word, PDF, HTML) [16](#producing-print-output-word-pdf-html)](#producing-print-output-word-pdf-html)

[4.3. Producing data for World Flora Online [16](#producing-data-for-world-flora-online)](#producing-data-for-world-flora-online)

# Introduction

## Current limitations: 

-   Single classification

-   No concept relationships except partial and pro-parte synonyms and misapplied names (as flags in synonym.csv table)

-   Note: All taxon nodes must have a name Rank assigned, including "pseudotaxa" like clade names and subtitles (e.g. "excluded names") introduced into the hierarchy to structure the output

-   Hybrid formulas will be converted to empty name strings

## Implementation

-   Export to csv tables

-   Character encoding Unicode UTF-8 (Windows Characterset 65001)

-   Choice if csv tables are packed into .zip file

## Conventions

-   All attributes ending in \_ID or \_Fk are UUIDs as designated in the CDM

-   Sequence of attributes in tables must be maintained for usage in MS-Access etc.

# Table definitions (export)

(note that examples may come from different records)

### CommonNameFact.csv

  -----------------------------------------------------------------------------------------------------------
  1   Fact_ID     UUID of Fact                                  507fcd90-0bcb-436a-8548-8de58e1f5b70   Text
  --- ----------- --------------------------------------------- -------------------------------------- ------
  2   Taxon_Fk    Pointer to Taxon_ID in Taxon.csv              adcc91d1-35e0-4516-a8b0-9760da4aeeb8   Text

  3   FactText    The actual common name                        Guayabilla                             Memo

  4   Language    Language designation taken from a term list   Spanish                                Text

  5   AreaLabel   An area designation taken from a term list    Colombia, Republic of                  Text
  -----------------------------------------------------------------------------------------------------------

### FactSources.csv

  ------------------------------------------------------------------------------------------------------------------------------------------------------
  1   Fact_Fk           Pointer to Fact_Id \*Fact.csv                                                      13d596d7-ec0f-4d5c-a4d6-da6e4d718442   Text
  --- ----------------- ---------------------------------------------------------------------------------- -------------------------------------- ------
  2   Reference_Fk      Pointer to Reference_ID in Reference.csv                                           b7197851-6bcc-4861-9db6-0a502837d072   Text

  3   NameInSource_Fk   The scientific name used in the source fact                                        812097ff-6dfc-4061-9be6-7e384c31b0f4   Memo

  4   FactType          may be SimpleFact, GeographicAreaFact, SpecimenFact or CondensedDistributionFact   SimpleFact                             Text
  ------------------------------------------------------------------------------------------------------------------------------------------------------

### GeographicAreaFact.csv

  --------------------------------------------------------------------------------------------------------------
  1   Fact_ID       UUID of Fact                                   44d8e6e0-73f7-4b42-b722-7f2aeb45d44e   Text
  --- ------------- ---------------------------------------------- -------------------------------------- ------
  2   Taxon_Fk      Taxon Pointer                                  3b1e2257-da35-44ea-87d5-2e7e0e55a017   Text

  3   AreaLabel     The name of the geographic area                Ecuador                                Text

  4   StatusLabel   Occurrence status within the geographic area   native                                 Text
  --------------------------------------------------------------------------------------------------------------

### HomotypicGroup.csv

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1   HomotypicGroup_ID                            UUID of homotypic Group                                                                                                                                                                                                                                                                                                                                        15360909-e644-4990-8dd2-b03f1f3c79e8                                                                                                                                                                                                                                                                                                  Text
  --- -------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------
  2   HomotypicGroupString                         Concatenated output string for homotypic group (names and citations) + status + some name relations (e.g. "non")                                                                                                                                                                                                                                               \<i\>Pfeiffera\</i\> \<i\>miyagawae\</i\> Barthlott & Rauh in Cact. Succ. J. (Los Angeles) 59: 63-64. 1987 ≡ \<i\>Lepismium\</i\> \<i\>miyagawae\</i\> (Barthlott & Rauh) Barthlott in Bradleya 5: 99. 1987 ≡ \<i\>Rhipsalis\</i\> \<i\>miyagawae\</i\> (Barthlott & Rauh) Kimnach in Cact. Succ. J. (Los Angeles) 68(3): 156. 1996   Memo

  3   TypeSpecimenString                           Concatenated output of all TypeSpecimen citations in the ScientificName table for the names belonging to the homotypic group                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Memo

  4   TypeStatementsString                         Concatenated output of all (normally: one) TypeStatements in the ScientificName table for the names belonging to the homotypic group                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Memo

  5   HomotypicGroupStringWithSec                  String (2) with sec.-References inserted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Memo

  6   HomotypicGroupStringWithoutAccepted          String (2) without the homotypic group of the accepted name (allows separate formatting of the accepted name)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Memo

  7   HomotypicGroupStringWithoutAcceptedWithSec   String (6) with sec.-References inserted                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Memo

  8   SortOrder                                    Position of the homotypic group in the output of Synonyms; 0 designates group of the accepted name, \>0 the sequence the homotypic group of heterotypic synonyms. Sort order is chronological (year) using the oldest valid name in the group and ascending; groups only containing designations or invalid "names" come last, again in chronological order.   22                                                                                                                                                                                                                                                                                                                                    Short

  9   HomotypicGroupTypeStatementReference                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Text
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Identifier.csv 

  -------------------------------------------------------------------------------------------------------------------------------------
  1   ForeignKey           Pointer to UUID of identified object in the referenced table   b3dd1aed-92e0-4058-be8e-4a3956d9f621   Text
  --- -------------------- -------------------------------------------------------------- -------------------------------------- ------
  2   ReferencedTable      The table holding the record of the identified object          ScientificName                         Text

  3   ExternalIdentifier   The actual identifier in the external system                   wfo-2142232                            Text

  4   IdentifierType       The respective external identifier system                      WFO Name Identifier                    Text
  -------------------------------------------------------------------------------------------------------------------------------------

### MediaFact

This is a table for facts containing media and no text

  ----------------------------------------------------------------------------------------------
  1   Fact_ID      UUID of Fact              b3dd1aed-92e0-4058-be8e-4a3956d9f621         Text
  --- ------------ ------------------------- -------------------------------------------- ------
  2   Taxon_Fk     Taxon Pointer (UUID)      15360909-e644-4990-8dd2-b03f1f3c79e8         Text

  3   Name_Fk      Name Pointer (UUID)       3b1e2257-da35-44ea-87d5-2e7e0e55a017         Text

  4   MediaURI     URI of the media object   https://www.gbif.org/occurrence/1987019250   Text
  ----------------------------------------------------------------------------------------------

### Metadata

  ------------------------------------------------------------------------------------------------------------
  1    EditInstance_ID       Identifier for the CDM Instance (database)                                 Text
  ---- --------------------- -------------------------------------------- ----------------------------- ------
  2    EditInstanceName      Name of the CDM instance (database)                                        Text

  3    DatasetTitle                                                                                     

  4    DatasetContributor                                                                               

  5    DatasetCreator                                                                                   

  6    DatasetDescription                                                                               

  7    DatasetDownloadLink                                                                              

  8    DatasetBaseUrl                                                                                   

  9    DatasetKeywords                                                                                  

  10   DataSetLandingPage                                                                               

  11   Language                                                                                         

  12   Licence                                                                                          

  13   DatasetLocation                                                                                  

  14   RecommendedCitation                                                                              
  ------------------------------------------------------------------------------------------------------------

### NameFact.csv 

(NB: Protologue-links are covered in the ScientificName table)

  ------------------------------------------------------------------------------------------------------------------------
  1   Fact_ID        UUID of Fact                           b3dd1aed-92e0-4058-be8e-4a3956d9f621                    Text
  --- -------------- -------------------------------------- ------------------------------------------------------- ------
  2   Name_Fk        Name Pointer (UUID)                    15360909-e644-4990-8dd2-b03f1f3c79e8                    Text

  3   FactText       The actual fact                        Standl. in J. Washington Acad. Sci. 14(11): 244. 1924   Memo

  4   Language       The language of the FactText           English                                                 Text

  5   MediaURI       Link to Medium accompanying the fact   https://www.biodiversitylibrary.org/page/1988822        Text

  6   FactCategory   Category of the name fact              Additional publication                                  Text
  ------------------------------------------------------------------------------------------------------------------------

### NameRelationship

  ---------------------------------------------------------------------------------------------------------
  1   Name1_Fk               UUID of first scientific name    666013f3-dd63-45ae-a118-412b7c113816   Text
  --- ---------------------- -------------------------------- -------------------------------------- ------
  2   Name2_Fk               UUID of second scientific name   25440686-bb1a-44e8-a5b6-8c0a67d84c10   Text

  3   NameRelationshipType   description of relationship      is basionym of                         Text
  ---------------------------------------------------------------------------------------------------------

### PersonOrTeam.csv 

  ---------------------------------------------------------------------------------------------------------------------------------------
  1   PersonOrTeam_ID     The UUID of the Author or Team                   81058813-47f8-42ab-905f-de14b32291ce                    Text
  --- ------------------- ------------------------------------------------ ------------------------------------------------------- ------
  2   AbbrevNames         Nomenclatural abbreviation of author or team     T.Moore & Mast. \[empty for bibliography-only authors   Text

  3   FullNames           Bibliographic citation of author(s)              Moore, T. & Masters, M.T.                               Text

  4   PersonOtherNames    for single person only -- first or other names   Jean Paul                                               Text

  5   PersonFamilyNames   for single person only -- last or family names   Belmondo                                                Text

  6   PersonPrefix        for single person only -- title etc.             Dr.                                                     Text

  7   PersonSuffix        for single person only - suffix                  jr.                                                     Text
  ---------------------------------------------------------------------------------------------------------------------------------------

### PersonTeamRelation.csv

  --------------------------------------------------------------------------------------------------------------------------------
  1   AuthorTeam_Fk    Pointer (UUID) of a team in PersonOrTeam.csv                 ab34e611-6e60-4dbb-b6d9-a53ce06e8dde   Text
  --- ---------------- ------------------------------------------------------------ -------------------------------------- -------
  2   Author_Fk        Pointer (UUID) of an individual person in PersonOrTeam.csv   77181551-8f22-4a59-8bdb-5c721c55668e   Text

  3   SequenceNumber   Position in the team                                         1                                      Short
  --------------------------------------------------------------------------------------------------------------------------------

### Reference.csv

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1    Reference_ID                 The UUID for the nomenclatural or bibliographic reference                                             189bde42-f464-4a55-b773-365886751d77                    Text
  ---- ---------------------------- ----------------------------------------------------------------------------------------------------- ------------------------------------------------------- ------
  2    BibliographicShortCitation   Reference citation used in Text or e.g. as sec.-Reference                                             Allen (2014)\                                           Text
                                                                                                                                          Allen & Seymore (2014)\                                 
                                                                                                                                          Allen & al. (2014)                                      

  3    Title                        Full title                                                                                            Eriosyce (Cactaceae): The genus revised and amplified   Memo

  4    AbbrevTitle                  Nomenclatural abbreviation of title                                                                   Eriosyce (Cactac.) Gen. Revis. Ampl.                    Text

  5    DatePublished                Publication date (string)                                                                             1957 \[\"1956\"\]                                       Text

  6    Edition                      Edition                                                                                               3                                                       Text

  7    Editor                       Name of Editor                                                                                        Marc Dubois                                             Text

  8    ISBN                         ISBN Number                                                                                                                                                   Text

  9    ISSN                         ISSN Number                                                                                                                                                   Text

  10   Organisation                 Is used for Reference Type Proceedings                                                                                                                        Text

  11   Pages                        Page range of article or section                                                                      333-356                                                 Text

  12   PlacePublished               Town and country of publication                                                                       London                                                  Text

  13   Publisher                    Publishing house                                                                                      Oxford University Press                                 Text

  14   ReferenceAbstract            Abstract                                                                                                                                                      Memo

  15   SeriesPart                                                                                                                                                                                 Text

  16   Volume                       Volume and number                                                                                     3(15)                                                   Text

  17   Year                         Publication year                                                                                      1922                                                    Text

  18   FullAuthor                   = FullNames in table PersonOrTeam                                                                     Adrian Coulter                                          Text

  19   Author_Fk                    Pointer (UUID) of person or team in PersonOrTeam.csv                                                                                                          Text

  20   InReference                  Pointer (UUID) to reference to which current reference belongs (e.g. journal if this is an article)                                                           Text

  21   Institution                  Used for Reference Types Thesis and Report                                                                                                                    Text

  22   LSID                         Life Science Identifier                                                                                                                                       Text

  23   School                       Attribute in use for publications of type Thesis                                                      University of Oxford                                    Text

  24   ReferenceType                Type of publication                                                                                   Article                                                 Text

  25   URI                          URI for the full publication if available on-line                                                                                                             Text
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### ScientificName.csv

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1    Name_ID                           UUID for the Name in the CDM Instance                                                                                                                                                                                25440686-bb1a-44e8-a5b6-8c0a67d84c10                                               Text
  ---- --------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------- -------
  2    LSID                              IPNI Life Science Identifer                                                                                                                                                                                          urn:lsid:ipni.org:names:36673-1                                                    Text

  3    Rank                              VerbatimRank (Code -- Latin)                                                                                                                                                                                         Species                                                                            Text

  4    RankSequence                      Numeric Rank Identifier (ordered) using the cdm rank class see http://cybertaxonomy.eu/cdmlib/apidocs/eu/etaxonomy/cdm/model/name/RankClass.html                                                                     44                                                                                 Short

  5    FullNameWithAuthors               For Tropicos name checking -- Authors in Tropicos Standard (no blanks between initialss, but a blank between lastname and initials, and some other exceptions                                                        Coccoloba nicaraguensis Standl. & L.O. Williams                                    Text

  6    FullNameNoAuthors                 For name checking (= nameCache)                                                                                                                                                                                      Coccoloba nicaraguensis                                                            Text

  7    GenusOrUninomial                  Genus or mononomial Name                                                                                                                                                                                             Cactus                                                                             Text

  8    InfragenericRank                  Abbreviated rank term for subdivision of genus                                                                                                                                                                       subg.                                                                              Text

  9    InfraGenericEpithet               Epithet of a generic subdivision                                                                                                                                                                                     Isocactus                                                                          Text

  10   SpecificEpithet                   Epithet of species                                                                                                                                                                                                   alba                                                                               Text

  11   InfraspecificRank                 Abbreviated rank term for infraspecies                                                                                                                                                                               var.                                                                               Text

  12   InfraSpecificEpithet              Infraspecific epithet                                                                                                                                                                                                nigra                                                                              Text

  13   BasionymExAuthorTeam_Fk           Pointer (UUID) to basionym ex author(s)                                                                                                                                                                              25t40686-bb1a-44e8-a5b6-8c0a67d84c10                                               Text

  14   BasionymAuthorTeam_Fk             Pointer to basionym author(s)                                                                                                                                                                                        254406ss-bb1a-44e8-a5b6-8c0a67d84c10                                               Text

  15   PublishingExAuthorTeam_Fk         Pointer to publishing ex author(s)                                                                                                                                                                                   11440686-bb1a-44e8-a5b6-8c0a67d84c10                                               Text

  16   PublishingAuthorTeam_Fk           Pointer to combination author(s)                                                                                                                                                                                     55540686-bb1a-44e8-a5b6-8c0a67d84c10                                               Text

  17   AuthorTeamString                  Nomenclatural authorship string including basionym authors and ex authors                                                                                                                                            (L.) Willd. ex Rose                                                                Text

  18   Reference_Fk                      Pointer (UUID) to nomenclatural reference (reference_csv)                                                                                                                                                                                                                                               Text

  19   PublicationType                   Article / Book / Book-section etc.                                                                                                                                                                                   In CDM it is no problem to provide all reference types                             Text

  20   AbbreviatedTitle                  BPH- or TL2-Type abbreviation (A/B) or                                                                                                                                                                               abbrev title of the "higher" (see below) nomenclatural reference, NOT the cache!   Text

  21   FullTitle                         Bibliographic citation of Book (for B-s)                                                                                                                                                                             See above, not abbreviated                                                         Memo

  22   AbbreviatedInRefAuthor            Abbreviated author of the "higher" reference (Higher references are Books, Journals, etc., NOT (Book)Section, Article, but careful with PrintSeries which are usually not higher references in terms of citations)                                                                                      Text

  23   FullRefAuthor                     Same as AbbreviatedRefAuthor but not abbreviated                                                                                                                                                                                                                                                        Text

  24   Collation                         Volume (issue): Page - OtherPage, Figure (standard citation)                                                                                                                                                                                                                                            Text

  25   VolumeIssue                       In cdm volume and issue are in one field                                                                                                                                                                                                                                                                Text

  26   Detail                            Incl. page, other page, figure, ... (a.k.a. nomenclaturalMicroReference                                                                                                                                                                                                                                 Text

  27   DatePublished                                                                                                                                                                                                                                                                                                                             Text

  28   YearPublished                                                                                                                                                                                                                                                                                                                             Text

  29   VerbatimDate                                                                                                                                                                                                                                                                                                                              Text

  30   ProtologueURI                     Concatenated list of URLs given for the protologue or nomenclatural act.                                                                                                                                                                                                                                Text

  31   NomenclaturalStatus               Concatenated list of status' assigned to the name                                                                                                                                                                                                                                                       Text

  32   NomenclaturalStatusAbbreviation                                                                                                                                                                                                                                                                                                           Text

  33   HomotypicGroup_Fk                 Can be used as an arbitrary unique identifier for the homotypic group, or as a pointer to the concatenated homotypic group string                                                                                                                                                                       Text

  34   HomotypicGroupSequenceNumber                                                                                                                                                                                                                                                                                                              Short

  35   ProtologueTypeStatement           The original (verbatim) text establishing the type of this name in the protologue                                                                                                                                                                                                                       Text

  36   TypeSpecimens                     Text composed from individual type specimens assigned to this name                                                                                                                                                                                                                                      Text

  37   TypeStatements                    Free text. May include citation of the type(s) of this name, and may describe actions taken in the typification process                                                                                                                                                                                 Text

  38   FullNameWithRef                                                                                                                                                                                                                                                                                                                           Text

  39   AppendedPhrase                    A free-text annex to the scientific name                                                                                                                                                                                                                                                                Text
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### SimpleFact.csv

  ------------------------------------------------------------------------------------------------------------------------
  1   Fact_ID                                                                                                       Text
  --- --------------- -------------------------------------------------------------------- ------------------------ ------
  2   Taxon_Fk        Taxon Pointer                                                                                 Text

  3   FactText                                                                                                      Memo

  4   Language        For every representation of a Multilanguage text create a new fact                            Text

  5   MediaURI        URI; URI; ...                                                                                 Text

  6   FactsCategory                                                                                                 Text
  ------------------------------------------------------------------------------------------------------------------------

### Specimen.csv

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1    Specimen_ID                                                                                                                                                                             Text
  ---- ------------------- ------------------------------------------------------------------------------------- ----------------------------------------------------------------------------- ------
  2    SpecimenCitation    Locality, Collector, Number, Date, Herbarium code and herbarium number, if present.   titleCache                                                                    Memo

  3    FieldUnitCitation   Specimen citation without herbarium code and number                                                                                                                 

  4    Locality                                                                                                                                                                                Memo

  5    Country                                                                                                                                                                                 Text

  6    AreaCategory1       Usually abbreviated                                                                                                                                                 Text

  7    AreaName1                                                                                                                                                                               Text

  8    AreaCategory2       Usually abbreviated                                                                                                                                                 Text

  9    AreaName2                                                                                                                                                                               Text

  10   AreaCategory3       Usually abbreviated                                                                                                                                                 Text

  11   AreaName3                                                                                                                                                                               Text

  12   FurtherAreas                                                                                                                                                                            Text

  13   CollectorString                                                                                           Should be the collectorString if it is implemented (?) otherwise titleCache   Text

  14   CollectorNumber                                                                                                                                                                         Text

  15   CollectionDate                                                                                                                                                                          Text

  16   SpecimenImageURIs   URI; URI; \...                                                                                                                                                      Memo

  17   HerbariumAbbrev                                                                                                                                                                         Text

  18   MediaSpecimenURL    Specimen only available as media?                                                                                                                                   Text

  19   PreferredStableID   CETAF GUID                                                                                                                                                          Memo

  20   Barcode                                                                                                                                                                                 Text

  21   CatalogueNumber                                                                                                                                                                         Text

  22   AccessionNumber                                                                                                                                                                         Text
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### SpecimenFact

  ---------------------------------------------------------------------------------
  1   Fact_ID                                                                Text
  --- --------------------- ----------------------- ------------------------ ------
  2   Taxon_Fk              Taxon Pointer                                    Text

  3   Specimen_Fk                                                            Text

  4   SpecimenDescription                                                    Memo

  5   SpecimenNotes                                                          Memo
  ---------------------------------------------------------------------------------

### Synonym

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1    Synonym_ID                                                                                                                                                                                          Text
  ---- -------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------ -------
  2    Taxon_Fk             Taxon Pointer                                                                                                                                                                  Text

  3    Name_Fk                                                                                                                                                                                             Text

  4    SynSecReference_Fk                                                                                                                                                                                  Text

  5    SynSecReference      Bibliographic short citation of syn-sec.-reference                                                                                                                             Memo

  6    SecReference_Fk                                                                                                                                                                                     Text

  7    SecReference                                                                                                                                                                                        Memo

  8    IsProParteSynonym                                                                                                                                                                                   Bit

  9    IsPartial                                                                                                                                                                                           Bit

  10   isMisapplied                                                                                                                                                                                        Bit

  11   Published            Marker for published names                                                                                                                                                     Bit

  12   SortIndex            Sequence of synonyms, sorted chronologically by homotypic group and by valid taxa within homotypic group. Designations and invalid names come last.   2                        Short

  13   AppendedPhrase       A free-text annex to the name of the synonym                                                                                                                                   Text
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Taxon

  ---------------------------------------------------------------------------------------------------------------------------------------
  1    Taxon_ID                  Taxon Identifier                                                                                 Text
  ---- ------------------------- ----------------------------------------------------------------------- ------------------------ -------
  2    Classification_ID         Uuid of the classification to which the taxon pertains in this output                            Text

  3    ClassificationName        Name of the classification to which the taxon pertains in this output                            Text

  4    Name_Fk                   Uuid of the name of the taxon                                                                    Text

  5    Parent_Fk                 Uuid of the parent taxon                                                                         Text

  6    SecReference_Fk           Uuid of the secundum reference                                                                   Text

  7    SecReference              Bibliographic short citation of sec.-reference                                                   Text

  8    SecSubName_Fk             Uuid of the accepted name in the sec. reference                                                  Text

  9    SecSubName                Accepted name in the sec. reference w/o authors                                                  Text

  10   SecSubNameAuthors         Author string of the accepted name in the sec. ref.                                              Text

  11   AppendedPhrase            A free-text annex to the name of the taxon                                                       Text

  12   SortIndex                 Sortorder determined at time of export                                                           Short

  13   Excluded                  Marker for excluded taxon                                                                        Bit

  14   Unplaced                  Marker for unplaced taxon                                                                        Bit

  15   PlacementDoubtful         Marker for doubtful placement of taxon                                                           bit

  16   PlacementNotes            Reason for the placement of the taxon                                                            Memo

  17   PlacementNotesRef_Fk      Uuid of the placement reference                                                                  Text

  18   PlacementNotesReference   Reference for the placement                                                                      Text

  19   Published                 Marker for published taxa                                                                        Bit
  ---------------------------------------------------------------------------------------------------------------------------------------

### TaxonInteractionFact

  --------------------------------------------------------------------------
  1   Fact_ID                                                         Text
  --- --------------- ---------------------- ------------------------ ------
  2   Taxon_Fk        Taxon Pointer                                   Text

  3   Taxon2_Fk       Taxon Pointer                                   Text

  4   Description                                                     Memo
  --------------------------------------------------------------------------

### TypeSpecimen

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1   TypeSpecimen_ID                                                                                                                                           Text
  --- ------------------------- ------------------------------------------------------------------------------------------- ----------------------------------- ------
  2   ScientificName_Fk         Pointer to typified name                                                                                                        Text

  3   Specimen_Fk               Pointer to specimen data                                                                                                        Text

  4   TypeStatus                Kind of type                                                                                Holotype, Lectotype, Isotype etc.   Memo

  5   TypeDesignatedBy_Fk       Pointer to the bibliographic source reference of the nomenclaturally relevant designation                                       Text

  6   TypeInformationSource     List of source references for the type information                                          Bauer (1992), Manning (1995)        Text

  7   TypeInfoSourcePreferred   Pointer to the preferred bibliograhic source reference for the type information                                                 Text
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 

## Additional tables (for processing in MS Access and Word)

### Facts2Use (designates fact categories that should be processed and their sequence in the output)

  ----------------------------------------------------------------------------------------------------------------------
  1   FactCategory    Name of the fact category                                                                  Text
  --- --------------- ----------------------------------------------------------------- ------------------------ -------
  2   FactSequence    Position of the facts belonging to this categorie in the output                            Short

  3   FactPrompt      Category name in output                                                                    Text
  ----------------------------------------------------------------------------------------------------------------------

### Settings (controls output)

  --------------------------------------------------------------------------
  1   SettingText     Parameter name         DoIndComNm               Text
  --- --------------- ---------------------- ------------------------ ------
  2   SetValue        Setting                0, -1                    Bit

  --------------------------------------------------------------------------

[Current parameters (SettingText):]{.underline}

DoIndComNm

DoIndSciNm

DoClean

Debug

InclSupraspTypes

InclSpeciesTypes

InclFactRef

InclSecRef

InclSynSecRef

DoEnglish

GenericTypeNewLine

# Schema.ini file

\[CommonNameFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_FK Text

Col3=FactText Memo

Col4=Language Text

Col5=AreaLabel Text

\[Facts2use.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=FactCategory Text

Col2=FactSequence Short

Col3=FactPrompt Text

\[FactSources.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_Fk Text

Col2=Reference_Fk Text

Col3=NameInSource_Fk Text

Col4=FactType Text

\[GeographicAreaFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_FK Text

Col3=AreaLabel Text

Col4=StatusLabel Text

\[HomotypicGroup.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=HomotypicGroup_ID Text

Col2=HomotypicGroupString Memo

Col3=TypeSpecimenString Memo

Col4=TypeStatementsString Memo

Col5=HomotypicGroupStringWithSec Memo

Col6=HomotypicGroupStringWithoutAccepted Memo

Col7=HomotypicGroupStringWithoutAcceptedWithSec Memo

Col8=SortOrder Short

Col9=HomotypicGroupTypeStatementReference Text

\[Identifier.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=ForeignKey Text

Col2=ReferencedTable Text

Col3=ExternalIdentifier Text

Col4=IdentifierType Text

\[MediaFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_FK Text

Col3=Name_Fk Text

Col4=MediaURI Text

\[Metadata.csv\]

Col1=EditInstance_ID

Col2=EditInstanceName

Col3=DatasetTitle

Col4=DatasetContributor

Col5=DatasetCreator

Col6=DatasetDescription

Col7=DatasetDownloadLink

Col8=DatasetBaseUrl

Col9=DatasetKeywords

Col10=DataSetLandingPage

Col11=Language

Col12=Licence

Col13=DatasetLocation

Col14=RecommendedCitation

\[NameFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Name_FK Text

Col3=FactText Memo

Col4=Language Text

Col5=MediaURI Text

Col6=FactCategory Text

\[Identifier.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=ForeignKey Text

Col2=ReferencedTable Text

Col3=ExternalIdentifier Text

Col4=IdentifierType Text

\[NameRelationship.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Name1_Fk Text

Col2=Name2_Fk Text

Col3=NameRelationshipType Text

\[PersonOrTeam.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=PersonOrTeam_ID Text

Col2=AbbrevNames Text

Col3=FullNames Text

Col4=PersonOtherNames Text

Col5=PersonFamilyName Text

Col6=PersonPrefix Text

Col7=PersonSuffix Text

\[PersonTeamRelation.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=AuthorTeam_Fk Text

Col2=Author_Fk Text

Col3=SequenceNumber Short

\[Reference.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Reference_ID Text

Col2=BibliographicShortCitation Text

Col3=Title Memo

Col4=AbbrevTitle Text

Col5=DatePublished Text

Col6=Edition Text

Col7=Editor Text

Col8=ISBN Text

Col9=ISSN Text

Col10=Organisation Text

Col11=Pages Text

Col12=PlacePublished Text

Col13=Publisher Text

Col14=ReferenceAbstract Memo

Col15=SeriesPart Text

Col16=Volume Text

Col17=Year Text

Col18=FullAuthor Text

Col19=Author_Fk Text

Col20=InReference Text

Col21=Institution Text

Col22=LSID Text

Col23=School Text

Col24=ReferenceType Text

Col25=URI Text

\[ScientificName.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Name_ID Text

Col2=LSID Text

Col3=Rank Text

Col4=RankSequence Short

Col5=FullNameWithAuthors Text

Col6=FullNameNoAuthors Text

Col7=GenusOrUninomial Text

Col8=InfragenericRank Text

Col9=InfraGenericEpithet Text

Col10=SpecificEpithet Text

Col11=InfraspecificRank Text

Col12=InfraSpecificEpithet Text

Col13=BasionymExAuthorTeam_Fk Text

Col14=BasionymAuthorTeam_Fk Text

Col15=PublishingExAuthorTeam_Fk Text

Col16=PublishingAuthorTeam_Fk Text

Col17=AuthorTeamString Text

Col18=Reference_Fk Text

Col19=PublicationType Text

Col20=AbbreviatedTitle Text

Col21=FullTitle Memo

Col22=AbbreviatedInRefAuthor Text

Col23=FullInRefAuthor Text

Col24=Collation Text

Col25=VolumeIssue Text

Col26=Detail Text

Col27=DatePublished Text

Col28=YearPublished Text

Col29=VerbatimDate Text

Col30=ProtologueURI Text

Col31=NomenclaturalStatus Text

Col32=NomenclaturalStatusAbbreviation Text

Col33=HomotypicGroup_Fk Text

Col34=HomotypicGroupSequenceNumber Short

Col35=ProtologueTypeStatement Text

Col36=TypeSpecimens Memo

Col37=TypeStatements Memo

Col38=FullNameWithRef Text

Col39=AppendedPhrase Text

\[Settings.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Setting Text

Col2=SetValue bit

\[SimpleFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_Fk Text

Col3=FactText Memo

Col4=Language Text

Col5=MediaURI Text

Col6=FactCategory Text

\[Specimen.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Specimen_ID Text

Col2=SpecimenCitation Memo

Col3=FieldUnitCitation Memo

Col4=Locality Memo

Col5=Country Text

Col6=AreaCategory1 Text

Col7=AreaName1 Text

Col8=AreaCategory2 Text

Col9=AreaName2 Text

Col10=AreaCategory3 Text

Col11=AreaName3 Text

Col12=FurtherAreas Text

Col13=CollectorString Text

Col14=CollectorNumber Text

Col15=CollectionDate Text

Col16=SpecimenImageURIs Memo

Col17=HerbariumAbbrev Text

Col18=MediaSpecimenURI Text

Col19=PreferredStableID Text

Col20=Barcode Text

Col21=CatalogueNumber Text

Col22=AccessionNumber Text

\[SpecimenFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_Fk Text

Col3=Specimen_Fk Text

Col4=SpecimenDescription Memo

Col5=SpecimenNotes Memo

\[Synonym.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Synonym_ID Text

Col2=Taxon_Fk Text

Col3=Name_Fk Text

Col4=SynSecReference_Fk Text

Col5=SynSecReference Memo

Col6=SecReference_Fk Text

Col7=SecReference Memo

Col8=IsProParteSynonym Bit

Col9=IsPartial Bit

Col10=IsMisapplied Bit

Col11=Published Bit

Col12=SortOrder Short

Col13=AppendedPhrase Text

\[Taxon.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Taxon_ID Text

Col2=Classification_ID Text

Col3=ClassificationName Text

Col4=Name_Fk Text

Col5=Parent_Fk Text

Col6=SecReference_Fk Text

Col7=SecReference Text

Col8=SecSubName_Fk

Col9=SecSubName Text

Col10=SecSubNameAuthors Text

Col11=AppendedPhrase Text

Col12=SortIndex Short

Col13=Excluded bit

Col14=Unplaced bit

Col15=PlacementDoubtful

Col16=PlacementNotes Memo

Col17=PlacementNotesRef_Fk

Col18=PlacementNotesReference

Col19=Published bit

\[TaxonInteractionFact.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=Fact_ID Text

Col2=Taxon_Fk Text

Col3=Taxon2_Fk Text

Col4=Description Memo

\[TypeSpecimen.csv\]

Format=CSVDelimited

CharacterSet=65001

Col1=TypeSpecimen_ID Text

Col2=ScientificName_Fk Text

Col3=Specimen_Fk Text

Col4=TypeStatus Text

Col5=TypeDesignatedBy_Fk Text

Col6=TypeInformationSource Memo

Col7=PreferredTypeInfoSource_Fk Text

# Processing CDM-Light with Microsoft Office programs

## 4.1. Role of schema.ini

For import in MS-Access (and Excel ?) place schema.ini as a text-only file in the same directory with your access database and the CDM-light .cvs tables. This ensures that the character encoding and the data type of the fields in the tables are recognised (otherwise these programs try to detect the data type from the first few records).

Schema.ini defines attribute data types for import into MS-Access according to the Microsoft Jet data types: Bit, Byte, Short \[= Integer\], Long, Currency, Single, Double, DateTime, Text \[\<= 255 characters\], Memo \[\<= 2 GB text BLOB\] (see <https://en.wikibooks.org/wiki/JET_Database/Data_types>). Default type is Text.

## 4.2. Producing Print-Output (Word, PDF, HTML)

To produce a textual checklist of the content: Manual-EDIT-Platform-Appendix-Checklist-Document-Procedure.docx (in preparation)

## 4.3. Producing data for World Flora Online

To produce a Darwin Core Archive format file to replace a family treatment in the World Flora Online taxonomic backbone: Manual-EDIT-Platform-Appendix-WFO-Backbone-Procedure.pdf

To produce a Darwin Core Archive format file for Content to be added to the World Flora Online database: Manual-EDIT-Platform-Appendix-WFO-Content-Procedure.pdf (in preparation)
