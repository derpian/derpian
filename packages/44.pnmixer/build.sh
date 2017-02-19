#!/bin/sh
rm -rf src pkg pnmixer-gtk3
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/pnmixer-gtk3.tar.gz
tar -xvf pnmixer*.tar*
cd pnmixer-gtk3

sed -i "s/'libnotify'//g" PKGBUILD
sed -i "s|./configure|./configure --with-libnotify=no|g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

