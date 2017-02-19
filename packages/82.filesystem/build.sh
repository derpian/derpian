#!/bin/sh
rm -rf src pkg
pak="filesystem"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/ID=arch/ID=derp/g" os-release
sed -i "s/Arch Linux/Derpian/g" os-release
sed -i "s/archlinux/derpian/g" os-release
sed -i "s/https/http/g" os-release

sed -i "s/Arch Linux/Derpian/g" issue

makepkg --skipinteg

cp *.pkg.* ..

