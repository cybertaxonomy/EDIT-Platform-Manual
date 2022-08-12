![C:\\Users\\a.mueller\\Desktop\\piB\\Screenshots\\EDIT.png](./media/image1.png){width="6.527777777777778in" height="2.4618055555555554in"}

User manual, appendix:

Processing CDM-light output with MS-Access and MS-Word

W. Berendsohn

Version: 4 June 2019

**Contents**

[1 WFO Data Definition [1](#_Toc495671704)](#_Toc495671704)

[2 Procedure for Backbone contributions [1](#_Toc495671705)](#_Toc495671705)

[3 Example for a DwC-A meta.xml file [2](#_Toc495671706)](#_Toc495671706)

[4 Taking over the editing of the WFO taxonomic backbone [3](#_Toc495671707)](#_Toc495671707)

[4.1 Getting the WFO-ID into your CDM database [3](#_Toc495671708)](#_Toc495671708)

# Preparing the environment

You need to have MS-Office installed (procedures tested for Office 2013 and 2016).

Create a local folder for processing your taxonomic treatment (if you are working with different EDIT Platform databases, you should create at least one folder each). If you have it already, delete all content in the folder with the exeption of the file *facts2use.csv*.

Open the TaxEditor and, in the TaxonNavigator, right click on the taxonomic group you want to export. Choose *Export* and *CDM-light (csv)* [^1]. Use your local folder as the target for the output.

Click *Next* and make sure, that the checkbox *Create Zip File* is not checked.

Click *Finish* and wait for the export to conclude (progress shown in lower right corner of the TaxEditor).

From Y:\\BDI\\EDIT-Plattform\\\_Latest Versions\\CDM-light-processing, copy the following files into the local folder where the exported \*.csv files are located:

-   CDM2Word.accdb (the MS-Access database used for further processing)

-   schema.ini (a configuration file ensuring that the data can be correctly imported -- truncated text and erroneous diacritic characters result when this file is not present)

> and, in case you plan to further process the data with Word

-   CDM2Word-Format-yyyy-mm-dd[^2].dot (the MS-Word template used for further processing)

-   CDM2Word-Style.dotx (the MS-Word template defining the paragraph styles used)

-   A facts2use.csv file, if not present (see below for further information)

Double-click on the CDM2Word.accdb in your local folder

If you get a security warning, click "Enable Content"

Choose if you want to create the processed output tables in the database that are needed for further processing in word. Note that depending on the size of your data, this may not be possible (e.g., processing the entire Euro+Med Plantbase with \>100.000 names and \>30.000 taxa).

Click on *Import CDM-light \...*

Wait until the program finished (a message will pop up).

If you want to continue to process the output in Word, close the database and proceed to chapter 2. If you want to manipulate data in Access, proceed to chapter 3.

# Generating a document using MS-Word

## How to

## Background

### The CDM2Word-Format\*.dot template

The CDM2Word-Style.dotx template

Data cleaning

# Processing CDM-light data in Access

The CDM-light text tables are present in the CDM2Word database under the same names as in the CDM-light export (without the .csv file extension). Whenever you start the import procedure, these tables are replaced with the up-to-date versions. This database contains a large number of additional tables, modules, queries etc. that are used for the document generation process with MS-Word. The functionality is constantly improved and (hopefully not that constantly) debugged. This means that you will replace the entire database from time to time.

For quick lookups and ad-hoc queries, you can use the CDM2Word database directly. However, if you want to introduce your own objects, e.g. queries for statistics etc. that are specific to your data and that you want to use frequently, you better use the CDMFrontend database. This database uses the CDM2Word database as a backend, the export tables are present as linked tables and can be used for queries etc. just like tables in the database. Updating the tables in CDM2Word automatically updates these tables in CDMFrontend, and replacing CDM2Word with a new version will not break the links. So you are free to define your own queries etc. in CDMFrontend.

[^1]: See *Manual-EDIT-Platform-Appendix-CDM-Light-2\*.pdf* for a detailed description of the CDM-light format.

[^2]: The template version is indicated by the date in the filename
