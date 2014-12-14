#!/bin/sh
mkdir -p ./packages
rm -fr ./packages/*
./32bits.sh
./64bits.sh
