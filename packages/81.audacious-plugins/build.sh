#!/bin/sh
rm -rf src pkg audacious-plugins-gtk3
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/audacious-plugins-gtk3.tar.gz
tar -xvf audacious*.tar*
cd audacious-plugins-gtk3

makepkg -d
cp *.pkg.* ../..
cd ..

