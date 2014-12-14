#!/bin/sh
BASE_DIR="./32bits"
mkdir -p ./packages
rm -fr ./packages/*_i386.deb
cp gems.txt versions.txt build_packages.sh ${BASE_DIR}
docker build -t veilleperso/ruby-package-32b ${BASE_DIR}
docker run -it --rm -v $(pwd)/packages:/opt/packages veilleperso/ruby-package-32b
rm -f ${BASE_DIR}/versions.txt
rm -f ${BASE_DIR}/gems.txt
rm -f ${BASE_DIR}/gems.txt
