#!/bin/sh
docker build -t veilleperso/ruby-package .
docker run -it --rm -v `pwd`/packages:/opt/packages veilleperso/ruby-package
