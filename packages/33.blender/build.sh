#!/bin/sh

ln -s /usr/lib/libLLVM-3.9.so /usr/lib/liblibLLVM-3.9.so.so

#FIX headers
sed -i 's|#include_next <stdlib.h>|#include_next "/usr/include/stdlib.h"|g' /usr/include/c++/6.3.1/cstdlib
sed -i 's|#include_next <math.h>|#include_next "/usr/include/math.h"|g' /usr/include/c++/6.3.1/cmath

rm -rf src pkg
pak="blender"
grp="community"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/'jack'//g" PKGBUILD
#sed -i "s/'log4cplus'//g" PKGBUILD
sed -i "s/'llvm35'//g" PKGBUILD
sed -i "s/'cuda'//g" PKGBUILD
sed -i 's/BUILDCUDA="ON"/BUILDCUDA="OFF"/g' PKGBUILD


makepkg

sed -i 's|#include_next "/usr/include/stdlib.h"|#include_next <stdlib.h>|g' /usr/include/c++/6.3.1/cstdlib
sed -i 's|#include_next "/usr/include/math.h"|#include_next <math.h>|g' /usr/include/c++/6.3.1/cmath

cp *pkg*xz ..
