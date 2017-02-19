#!/bin/sh
rm -rf src pkg gplugin
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gplugin.tar.gz
tar -xvf gplugin*.tar*
cd gplugin

makepkg
cp *.pkg.* ../..
cd ..

