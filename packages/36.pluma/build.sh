#!/bin/sh
rm -rf src pkg
pak="pluma-gtk3"
grp="community"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/'zenity'//g" PKGBUILD
sed -i "s|./configure|./configure --disable-spell|g" PKGBUILD

makepkg

cp *pkg*xz ..
