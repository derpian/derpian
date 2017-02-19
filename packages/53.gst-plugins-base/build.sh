#!/bin/sh
rm -rf src pkg
pak="gst-plugins-base"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/cdparanoia//g" PKGBUILD
sed -i "s/libvisual//g" PKGBUILD

patch -p0 -i p2.patch
makepkg

cp *pkg*xz ..
