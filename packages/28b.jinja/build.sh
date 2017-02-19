#!/bin/sh
rm -rf src pkg
pak="python-jinja"
grp="community"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i 's|pkgver=2.9.5|pkgver=2.9|g' PKGBUILD
sed -i 's|pkgver=2.9.4|pkgver=2.9|g' PKGBUILD
sed -i 's|pkgver=2.9|pkgver=2.8|g' PKGBUILD
#sed -i 's|.tar.xz|.tar.gz|g' PKGBUILD

makepkg --skipinteg

cp *.pkg.* ..

