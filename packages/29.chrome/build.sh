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
makepkg --skipinteg
cp *.pkg.* ../..
cd ..
