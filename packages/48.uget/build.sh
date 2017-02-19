#!/bin/sh
rm -rf src pkg
pak="uget"
grp="community"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/'libnotify'//g" PKGBUILD
sed -i "s/'gstreamer'//g" PKGBUILD
sed -i "s|--prefix=|--disable-gstreamer --disable-notify --prefix=|g" PKGBUILD

makepkg

cp *pkg*xz ..
