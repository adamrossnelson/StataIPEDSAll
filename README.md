# 1. Project StataIPEDSAll Introduction

These files will download, build, and save to the local computer data from the US DOE's Integrated Postsecondary Education Data Stystem. All files are intended to be reverse compatible to Version 13. Use of version control. Also uses `saveold`. Intended as reverse compatible, but not tested. **Notes about assumptions or limitations maintained in the do files.**

For a related/similar repo built for R see [btskinner/downloadipeds](https://github.com/btskinner/downloadipeds).

## 1.1. Table of Contents
<!-- TOC -->

- [1. Project StataIPEDSAll Introduction](#1-project-stataipedsall-introduction)
    - [1.1. Table of Contents](#11-table-of-contents)
    - [1.2. IPEDS Update Cylces (Revised releases)](#12-ipeds-update-cylces-revised-releases)
    - [1.3. Additional Background](#13-additional-background)
- [2. Usage](#2-usage)
- [3. Run From Online](#3-run-from-online)
- [4. Contextual Note](#4-contextual-note)
- [5. Testing And Development Log](#5-testing-and-development-log)

<!-- /TOC -->

## 1.2. IPEDS Update Cylces (Revised releases)

Occassionaly IPEDS provides preliminary release data which is later replaced with revised data. [They publish information about their schedule](https://surveys.nces.ed.gov/ipeds/ViewContent.aspx?contentId=15). IPEDS conventions place "rv" in csv filenames to denote revised data. As I am able I update these do files to reference revised data. 

If I'm behind on an update send me a note. Or branch the project, revise on your own, and submit a pull request. For beginners, contact me and I'll help you learn how. Updates logged in do file headers. An aggregated [Testing & Development Log](#4-testing-and-development-log) is available [below](#4-testing-and-development-log).

## 1.3. Additional Background

IPEDS provides an [origins report](https://nces.ed.gov/pubsearch/pubsinfo.asp?pubid=NPEC2012833) which documents the history of survey survey items.

# 2. Usage

Do File Name & Description | Suggested Nameing Convention
---------------------------|-----------------------------
`IPEDSDirInfo02to16.do` <br> Produces a panel data set that includes IPEDS directory information survey files. | `IPEDSDirInfo02to16.log` <br> `IPEDSDirInfo02to16.dta`
`IPEDSInstChar02to16.do` <br> Produces a panel data set that includes IPEDS institutional characteristics survey files. This series contains test score, admission, and other similar data points that were previously found in the institutional chracteristics survey files. IPEDS introduced seperate survey file for "Admissions and Test Scores" in 2014. | `IPEDSInstChar02to16.log` <br> `IPEDSInstChar02to16.dta`
`IPEDS12MoEnrl02to16.do` <br> Produces a panel data set that includes IPEDS 12 month enrollment survey files. This series contains 12-month unduplicated headcount. IPEDS frequently modified variable naming conventions in this series. Details related variable naming conventions identified in do file. | `IPEDS12MoEnrl02to16.log` <br> `IPEDS12MoEnrl02to16.dta`
`IPEDS12MoInstrAct02to16.do` <br> Produces a panel data set that includes IPEDS 12 month instructional activity survey files. This series contains data on instructional activity measured in total credit and/or contact hours delivered by institutions during a 12-month period. The credit hour and contact hour activity data are used to derive 12-month full-time equivalent enrollments for both undergraduate and graduate levels. | `IPEDS12MoInstrAct02to16.log` <br> `IPEDS12MoInstrAct02to16.dta`
`IPEDSGradRt02to16.do` <br> Produces a panel data set that includes IPEDS graduation rates. This series contains the graduation rate status for the cohort of full-time, first-time degree/certificate-seeking undergraduates in both four year and two year institutions. **This routine builds data for four-year institutions only, however.** | `IPEDSGradRt02to16.log` <br> `IPEDSGradRt02to16.dta`
`IPEDSFallEnrl02to16SrsA.do` <br> Produces a panel data set that includes IPEDS fall enrollment rates. This series contains the fall enrollment rates status including race/ethnicity, gender, attendance status, and level of student. | `IPEDSFallEnrl02to16SrsA.log` <br> `IPEDSFallEnrl02to16SrsA.dta`
`IPEDSFallEnrl02to16SrsB.do` <br> Produces a panel data set that includes IPEDS fall enrollment rates. This series contains the fall enrollment rates status including age, gender, attendance status, and level of student. **This routine builds data undergraduate level of study only, however.** | `IPEDSFallEnrl02to16SrsB.log` <br> `IPEDSFallEnrl02to16SrsB.dta`

# 3. Run From Online

These do files can be run from Stata's command line. Code provided below.

Recommend using the naming convetions from the above table when prompted for a log file name and location.

``` Stata
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSDirInfo02to16.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSInstChar02to16.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDS12MoEnrl02to16.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDS12MoInstrAct02to16.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSGradRt02to16.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSFallEnrl02to16SrsA.do
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSFallEnrl02to16SrsB.do
```

# 4. Contextual Note

Contextual note: The universe of higher education data is vast and complicated. This illustration from http://www.studentclearninghouse.org is a helpful illustration of the range and compexity.

![Higher Education Data Illustration](images/HEDataChart.jpg)

# 5. Testing And Development Log

Date      | Developer             | Description
----------|-----------------------|----------------------
03Jan2018 | Adam Ross Nelson      | Added test & dev log.
11Jan2018 | Naiya Patel           | Tested "Run from Online" command lines.
09Feb2018 | Adam Ross Nelson      | Added `IPEDSGradRt02to16.do`
25Feb2018 | Adam Ross Nelson      | Closed [issue](https://github.com/adamrossnelson/StataIPEDSAll/issues/1).
20Mar2018 | Adam Ross Nelson      | Splified ReadMe.md usage section.
20Mar2018 | Niya Patel            | Added `FallEnrl02to16SrsA.do` & `FallEnrl02to16SrsA.do`
