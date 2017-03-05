#!/bin/sh
rm -rf src pkg chromium-dev
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/chromium-dev.tar.gz
tar -xvf chr*.tar*
cd chromium-dev
patch -p0 -i ../p.patch

#sed -i "s/gtk2/gtk3/g" PKGBUILD
#cp ../*.patch .
#cp ../*.diff .

#sed -i 's|patch -p1 -i "${srcdir}/chromium-system-jinja-r14.patch"||g' PKGBUILD

ARC=$(cat /etc/pacman.conf|grep Architecture)

if [[ $ARC == *"i686"* ]]; then
  echo "FIX 32 bit"
  patch -p0 -i ../f32.patch
fi

patch -p0 -i ../fw.patch

sed -i "s/enable_widevine=true/enable_widevine=false/g" PKGBUILD
sed -i "s/chromedriver widevinecdmadapter clearkeycdm/chromedriver clearkeycdm/g" PKGBUILD
cp ../*.patch .

makepkg --skipinteg
cp *.pkg.* ../..
cd ..
