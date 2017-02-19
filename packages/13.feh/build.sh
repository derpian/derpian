#!/bin/sh
rm -rf src pkg
pak="feh"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/exif=1//g" PKGBUILD
sed -i "s/help=1//g" PKGBUILD
sed -i "s/stat64=1//g" PKGBUILD
#sed -i "s/'libxinerama'//g" PKGBUILD
sed -i "s/'libexif'//g" PKGBUILD

makepkg --skipinteg

cp *pkg*xz ..