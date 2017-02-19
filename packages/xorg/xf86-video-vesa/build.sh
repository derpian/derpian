#!/bin/sh
rm -rf src pkg PKGBUILD
pak="xf86-video-vesa"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/xorg-server<1.19.0/xorg-server<1.18.0/g" PKGBUILD
sed -i "s/xorg-server<1.19/xorg-server<1.18.0/g" PKGBUILD
#sed -i "s/--enable-xwayland/--disable-xwayland/g" PKGBUILD

#sed -i "s/pkgver=1.19.1/pkgver=1.18.4/g" PKGBUILD

makepkg --skipinteg

cp *.pkg.*xz ..
cd ..

