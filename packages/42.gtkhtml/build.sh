#!/bin/sh
rm -rf src pkg gtkhtml4
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gtkhtml4.tar.gz
tar -xvf gtkhtml*.tar*
cd gtkhtml4

sed -i "s|'enchant'||g" PKGBUILD
sed -i "s|./configure|patch -p1 -i ../../../no-enchant.patch; ./configure|g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

