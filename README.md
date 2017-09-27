# Project StataIPEDSAll Introduction

These files will download, build, and save to the local computer data from the Directory Information survey at the US DOE's Integrated Postsecondary Education Data Stystem. All files are intended to be reverse compatible to Version 13. Use of version control. Also uses `saveold`. Intended, but not tested. Notes about assumptions or limitations maintained in the do files.

## IPEDS Update Cylces (Revised releases)

Occassionaly IPEDS provides preliminary release datat which is later replaced with revised data. IPEDS conventions place "rv" in csv filenames to denote revised data. As I am able I update these do files to reference revised data. If I'm behind on that send me a note. Or branch the project, revise on your own, and submit a pull request. For beginners, contact me and I'll help you learn how.

## Usage

### IPEDSDirInfo02to16.do

Produces a panel data set that includes IPEDS directory information survey files.

#### Run from online

May be run with the following at the stata command line (referencing stable 1.0 branch).

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSDirInfo02to16.do
```
#### Suggested Naming Convention

When prompted for a log file name suggested name is `IPEDS DirInfo 02 to 16.log` which will produce `IPEDS DirInfo 02 to 16.dta` at the location you specify. (Update year reference as needed).

### IPEDSInstChar02to16.do

Produces a panel data set that includes IPEDS institutional characteristics survey files. This series contains test score, admission, and other similar data points that were previously found in the institutional chracteristics survey files. Important note is that IPEDS introduced the "Admissions and Test Scores" in 2014.

#### Run from online

May be run with the following at the stata command line (referencing stable 1.0 branch).

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/1.0/IPEDSInstChar02to16.do
```

#### Suggested Naming Convention

When prompted for a log file name suggested name is `IPEDS InstChar 02 to 16.log` which will produce `IPEDS InstChar 02 to 16.dta` at the location you specify. (Update year reference as needed).
