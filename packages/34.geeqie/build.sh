#!/bin/sh
rm -rf src pkg geeqie-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/geeqie-git.tar.gz
tar -xvf geeqie*.tar*
cd geeqie-git
#sed -i "s/'exiv2'//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

