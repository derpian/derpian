#!/bin/sh

#FIX headers
sed -i 's|#include_next <stdlib.h>|#include_next "/usr/include/stdlib.h"|g' /usr/include/c++/6.3.1/cstdlib
sed -i 's|#include_next <math.h>|#include_next "/usr/include/math.h"|g' /usr/include/c++/6.3.1/cmath

rm -rf src pkg
pak="webkit2gtk"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

patch -p0 -i p1.patch

#sed -i "s/pkgver=2.14.2/pkgver=2.15.2/g" PKGBUILD
##sed -i "s/libsecret//g" PKGBUILD
##sed -i "s/pkgver=2.2.2/pkgver=2.3.2/g" PKGBUILD


makepkg --skipinteg

sed -i 's|#include_next "/usr/include/stdlib.h"|#include_next <stdlib.h>|g' /usr/include/c++/6.3.1/cstdlib
sed -i 's|#include_next "/usr/include/math.h"|#include_next <math.h>|g' /usr/include/c++/6.3.1/cmath

cp *.pkg.* ..

