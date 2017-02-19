#!/bin/sh
rm -rf src pkg
pak="libreoffice-fresh"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

#sed -i "s/--prefix/--without-libssh2 --prefix/g" PKGBUILD
#sed -i "s/wayland//g" PKGBUILD
#sed -i 's|./configure|CFLAGS="-march=x86-64" ./configure|g' PKGBUILD

patch -p0 -i p1.patch
#sed -i "s/'beanshell'//g" PKGBUILD
makepkg --skipinteg

cp *pkg*xz ..
