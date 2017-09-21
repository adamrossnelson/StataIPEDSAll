# StataIPEDSAll

These files will download, build, and save to the local computer data from the Directory Information survey at the US DOE's Integrated Postsecondary Education Data Stystem.

All files are intended to be reverse compatible to Version 13. Use of version control. Also uses `saveold`. Intended, but not tested.

Notes about assumptions or limitations maintained in the do files.

Requires user to establish a local direcotry called `c:\statadata`

## IPEDSDirInfo02to16.do

Produces a file `c:\statadata\Directory Info 02 to 16.dta` which is a panel data set that includes IPEDS directory information survey files.

May be run with the following at the stata command line.

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSDirInfo02to16.do
```

## IPEDSInstChar02to16.do

Produces a file `c:\statadata\InstChar 02 to 16.dta` which is a panel data set that includes IPEDS institutional chracteristics survey files.

Important note is that IPEDS introduced the "Admissions and Test Scores" in 2014. This series contains test score, admission, and other similar data points that were previously found in the institutional chracteristics survey files.

May be run with the following at the stata command line.

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSInstChar02to16.do
```