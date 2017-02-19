#!/bin/sh
rm -rf src pkg
pak="cups"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/enable-avahi/disable-avahi/g" PKGBUILD
sed -i "s/'avahi'//g" PKGBUILD
#sed -i "s/'colord'//g" PKGBUILD



sed -i "s/'libtiff>=4.0.0'//g;s/'libpng>=1.5.7'//g;s/'krb5'//g" PKGBUILD


rm libcups*.xz

rm cups-*-source.tar.bz2

makepkg -d --skipinteg

cp libcups*xz ..
