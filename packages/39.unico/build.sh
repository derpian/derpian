#!/bin/sh
rm -rf src pkg gtk-engine-unico
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-engine-unico.tar.gz
tar -xvf gtk-engine*.tar*
cd gtk-engine-unico

makepkg
cp *.pkg.* ../..
cd ..

