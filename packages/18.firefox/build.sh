#!/bin/sh
rm -rf src pkg
pak="firefox"
grp="packages"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

patch -p0 -i pp.patch
patch -p0 -i px.patch
#patch -p0 -i pk.patch

sed -i 's| gtk2 | |g' PKGBUILD

ARC=$(cat /etc/pacman.conf|grep Architecture)

if [[ $ARC == *"i686"* ]]; then
  echo "FIX 32 bit"
  patch -p0 -i f32.patch
fi

makepkg --skipinteg

cp *.pkg.* ..

