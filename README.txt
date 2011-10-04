
These are fink packages that are in process.  Once they are included in Fink, I often delete them from there.

To use any of these, download the mypackage.info file and mypackage.patch file, if it exists, and put them into:

/sw/fink/dists/local/main/finkinfo

Then run "fink scanpackages; fink install mypackage"

.hc
