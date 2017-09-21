# StataIPEDSAll

These files will download, build, and save to the local computer data from the Directory Information survey at the US DOE's Integrated Postsecondary Education Data Stystem.

## IPEDSDirInfo02to16.do

Produces a file `c:\statadata\Directory Info 02 to 16.dta` which is a panel data that includes IPEDS directory information files.

Notes about assumptions or limitations maintained in the do file.

Requires user to establish a local direcotry called `c:\statadata`

May be run with the following at the stata command line.

```
do https://raw.githubusercontent.com/adamrossnelson/StataIPEDSAll/master/IPEDSDirInfo02to16.do
```