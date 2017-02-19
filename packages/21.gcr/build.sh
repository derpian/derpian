#!/bin/sh
rm -rf src pkg
pak="gcr"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/dconf//g" PKGBUILD

makepkg

cp *.pkg.* ..

