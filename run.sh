#!/bin/sh
BASE_DIR="./"

mkdir -p ./packages
rm -fr ./packages/*

echo "====== Build 64bits rubies ======"
docker build -f Dockerfile -t bikerduweb/rbenv-package ${BASE_DIR}
docker run -it --rm -v $(pwd)/packages:/opt/packages bikerduweb/rbenv-package

echo "====== Publish packages to gemfury ======"
cd ./packages
fury push *.deb
