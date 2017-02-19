#!/bin/sh
rm -rf src pkg mate-calc
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/mate-calc.tar.gz
tar -xvf mate*.tar*
cd mate-calc

makepkg
cp *.pkg.* ../..
cd ..

