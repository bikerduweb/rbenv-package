#!/bin/sh
RBENV_ROOT='/usr/local/rbenv'
for i in `ls ${RBENV_ROOT}/versions`
do
  echo "Build ruby package $i"
  cd ${RBENV_ROOT}/versions
  rbenv exec fpm -s dir -t deb -n rbenv-ruby --provides ruby --prefix ${RBENV_ROOT}/versions --version $i $i
done
mv *.deb /opt/packages
