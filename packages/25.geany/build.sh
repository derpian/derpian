#!/bin/sh
rm -rf src pkg geany-gtk3
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/geany-gtk3.tar.gz
tar -xvf geany*.tar*
cd geany-gtk3

makepkg
cp *.pkg.* ../..
cd ..

