#!/bin/sh
rm -rf src pkg
pak="sed"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i 's|4.4|4.3|g' PKGBUILD
sed -i 's|4.3|4.2.2|g' PKGBUILD
sed -i 's|.tar.xz|.tar.gz|g' PKGBUILD

makepkg --skipinteg

cp *.pkg.* ..

