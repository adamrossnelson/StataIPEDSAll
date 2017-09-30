# 1. Project StataIPEDSAll Introduction

These files will download, build, and save to the local computer data from the Directory Information survey at the US DOE's Integrated Postsecondary Education Data Stystem. All files are intended to be reverse compatible to Version 13. Use of version control. Also uses `saveold`. Intended, but not tested. Notes about assumptions or limitations maintained in the do files.

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
        - [2.1.2. Suggested Naming Convention](#212-suggested-naming-convention)
    - [2.2. IPEDSInstChar02to16.do](#22-ipedsinstchar02to16do)
        - [2.2.1. Run from online](#221-run-from-online)
        - [2.2.2. Suggested Naming Convention](#222-suggested-naming-convention)

<!-- /TOC -->

# 2. Usage

## 2.1. IPEDSDirInfo02to16.do

Produces a panel data set that includes IPEDS directory information survey files.

### 2.1.1. Run from online

May be run with the following at the stata command line (referencing stable 1.0 branch).[^1]

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSDirInfo02to16.do
```
### 2.1.2. Suggested Naming Convention

When prompted for a log file name suggested name is `IPEDS DirInfo 02 to 16.log` which will produce `IPEDS DirInfo 02 to 16.dta` at the location you specify. (Update year reference as needed).

## 2.2. IPEDSInstChar02to16.do

Produces a panel data set that includes IPEDS institutional characteristics survey files. This series contains test score, admission, and other similar data points that were previously found in the institutional chracteristics survey files. Important note is that IPEDS introduced the "Admissions and Test Scores" in 2014.

### 2.2.1. Run from online

May be run with the following at the stata command line (referencing stable 1.0 branch).

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSInstChar02to16.do
```

### 2.2.2. Suggested Naming Convention

When prompted for a log file name suggested name is `IPEDS InstChar 02 to 16.log` which will produce `IPEDS InstChar 02 to 16.dta` at the location you specify. (Update year reference as needed).
