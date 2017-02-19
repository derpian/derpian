#!/bin/sh
rm -rf src pkg goffice-light
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/goffice-light.tar.gz
tar -xvf goff*.tar*
cd goffice-light

sed -i "s|'libspectre'||g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

