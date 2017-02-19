#!/bin/sh
rm -rf src pkg fontconfig-infinality
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/fontconfig-infinality.tar.gz
tar -xvf font*.tar*
cd fontconfig-infinality
makepkg
cp font*.pkg.*xz ../..
cd ..
