#!/bin/sh
rm -rf src pkg audacious-gtk3
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/audacious-gtk3.tar.gz
tar -xvf audacious*.tar*
cd audacious-gtk3

makepkg
cp *.pkg.* ../..
cd ..

