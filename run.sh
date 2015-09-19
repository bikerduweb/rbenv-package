#!/bin/sh
BASE_DIR="./"

mkdir -p ./packages
rm -fr ./packages/*

echo "====== Build 32bits rubies ======"
docker build -f Dockerfile-32bits -t veilleperso/ruby-package-32b ${BASE_DIR}
docker run -it --rm -v $(pwd)/packages:/opt/packages veilleperso/ruby-package-32b

echo "====== Build 64bits rubies ======"
docker build -f Dockerfile-64bits -t veilleperso/ruby-package-64b ${BASE_DIR}
docker run -it --rm -v $(pwd)/packages:/opt/packages veilleperso/ruby-package-64b

echo "====== Publish packages to gemfury ======"
cd ./packages
fury push *.deb