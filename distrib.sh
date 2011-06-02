#!/bin/sh

cd /sw/fink/dists/local/main/finkinfo

echo Validating files:
for file in *.info; do
	fink validate $file
done

echo Uploading to build machines:
for ip in `/sw/bin/nmap -PN -p 22 128.238.56.57,100-150 | grep -B2 open | /sw/bin/sed -n 's|Interesting ports on .*128\.238\.56\.\([0-9][0-9]*\).*:|\1|p'`; do
	echo
	echo Copying to 128.238.56.${ip}
	scp flite.info flite.patch artoolkit.info libquicktime1.info libquicktime1.patch gmerlin-avdecoder1.patch libgavl1.info gmerlin-avdecoder1.info root@128.238.56.${ip}:/sw/fink/10.4/local/main/finkinfo
done
