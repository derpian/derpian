#!/bin/sh
rm -rf src pkg pamac-aur
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/pamac-aur.tar.gz
tar -xvf pamac*.tar*
cd pamac-aur
patch -p0 -i ../p2.patch

makepkg
cp *.pkg.* ../..
cd ..

