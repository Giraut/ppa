#!/bin/bash
### This script should be run in the PPA directory to update

### Parameters
# Address of the repository
PPA_ADDR=https://raw.githubusercontent.com/Giraut/ppa/master/

# Name of the repository
PPA_NAME=giraut

# Email address for the GPG key
EMAIL=$(C=base64\ -d;$C<<<Y205emEybHpRSEoxYm1KdmVDNWpiMjBLCg==|$C)



### Main script
# Check that we have at least one .deb file in the current directory, to make
if ! ls *.deb > /dev/null 2> /dev/null; then
  echo "No .deb files in the current directory"
  exit
fi

# sure we're not being called from some other directory
# Create the KEY.gpg file
gpg --armor --export "${EMAIL}" > KEY.gpg

# Create the Packages and Packages.gz files
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Create the Release, Release.gpg InRelease file
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease

# Create the list file
echo "deb ${PPA_ADDR} ./" > ${PPA_NAME}.list
