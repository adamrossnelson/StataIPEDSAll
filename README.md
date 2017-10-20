# 1. Project StataIPEDSAll Introduction

These files will download, build, and save to the local computer data from the Directory Information survey at the US DOE's Integrated Postsecondary Education Data Stystem. All files are intended to be reverse compatible to Version 13. Use of version control. Also uses `saveold`. Intended as reverse compatible, but not tested. **Notes about assumptions or limitations maintained in the do files.**

## 1.1. IPEDS Update Cylces (Revised releases)

Occassionaly IPEDS provides preliminary release datat which is later replaced with revised data. IPEDS conventions place "rv" in csv filenames to denote revised data. As I am able I update these do files to reference revised data. If I'm behind on that send me a note. Or branch the project, revise on your own, and submit a pull request. For beginners, contact me and I'll help you learn how.

## 1.2. Table of Contents
<!-- TOC -->

- [1. Project StataIPEDSAll Introduction](#1-project-stataipedsall-introduction)
    - [1.1. IPEDS Update Cylces (Revised releases)](#11-ipeds-update-cylces-revised-releases)
    - [1.2. Table of Contents](#12-table-of-contents)
- [2. Usage](#2-usage)
    - [2.1. IPEDSDirInfo02to16.do](#21-ipedsdirinfo02to16do)
        - [2.1.1. Run from online](#211-run-from-online)
        - [2.1.2. Suggested naming convention](#212-suggested-naming-convention)
    - [2.2. IPEDSInstChar02to16.do](#22-ipedsinstchar02to16do)
        - [2.2.1. Run from online](#221-run-from-online)
        - [2.2.2. Suggested naming convention](#222-suggested-naming-convention)
    - [2.3. IPEDS12MoEnrl02to16.do](#23-ipeds12moenrl02to16do)
        - [2.3.1. Run from online](#231-run-from-online)
        - [2.3.2. Suggesting naming convention](#232-suggesting-naming-convention)
    - [2.4. IPEDSGradRt02to16.do](#24-ipedsgradrt02to16do)
    - [2.5. IPEDSInstrInfo02to16.do](#25-ipedsinstrinfo02to16do)

<!-- /TOC -->

# 2. Usage

## 2.1. IPEDSDirInfo02to16.do

Produces a panel data set that includes IPEDS directory information survey files.

### 2.1.1. Run from online

May be run with the following at the Stata command line (referencing stable 1.0 branch).[^1]

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSDirInfo02to16.do
```
### 2.1.2. Suggested naming convention

When prompted for a log file name suggested name is `IPEDSDirInfo02to16.log` which will produce `IPEDSDirInfo02to16.dta` at the location you specify. (Update year reference as needed).

## 2.2. IPEDSInstChar02to16.do

Produces a panel data set that includes IPEDS institutional characteristics survey files. This series contains test score, admission, and other similar data points that were previously found in the institutional chracteristics survey files. Important note is that IPEDS introduced the "Admissions and Test Scores" in 2014.

### 2.2.1. Run from online

May be run with the following at the Stata command line (referencing stable 1.0 branch).

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSInstChar02to16.do
```

### 2.2.2. Suggested naming convention

When prompted for a log file name suggested name is `IPEDSInstChar02to16.log` which will produce `IPEDSInstChar02to16.dta` at the location you specify. (Update year reference as needed).

## 2.3. IPEDS12MoEnrl02to16.do

Produces a panel data set that includes IPEDS 12 month enrollment survey files. This series of surveys contains 12-month unduplicated headcount. Important note is that IPEDS modified variable naming conventions. Details of the variable naming conventions identified in do file.

### 2.3.1. Run from online

May be run with the following at the Stata command line (referencing stable 1.0 branch).

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDS12MoEnrl02to16.do
```

### 2.3.2. Suggesting naming convention

When prompted for a log file name suggested name is `IPEDS12MoEnrl02to16.log` which will produce `IPEDS12MoEnrl02to16.dta` at the location you specify. (Update year reference as needed).

## 2.4. IPEDSGradRt02to16.do

To be implemented. Graduation rate survey files.

## 2.5. IPEDSInstrInfo02to16.do

To be implemented. 12 month instructional activity survey files.