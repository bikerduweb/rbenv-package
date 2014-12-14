#!/bin/sh
mkdir -p ./packages
rm -fr ./packages/*

echo "====== Build 32bits rubies ======"
./32bits.sh

echo "====== Build 64bits rubies ======"
./64bits.sh
