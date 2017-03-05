#!/bin/sh
rm -rf src pkg
pak="gst-plugins-bad"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

patch -p0 -i p.patch
patch -p0 -i p2.patch

ARC=$(cat /etc/pacman.conf|grep Architecture)

if [[ $ARC == *"i686"* ]]; then
  echo "FIX 32 bit"
  sed -i "s|./configure|./configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu|g" PKGBUILD
fi

makepkg

cp *pkg*xz ..
