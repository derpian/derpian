#!/bin/sh
rm -rf src pkg abiword-minimal
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/abiword-minimal.tar.gz
tar -xvf abi*.tar*
cd abiword-minimal

sed -i "s|'enchant'||g" PKGBUILD
wget --no-check-certificate http://www.abisource.com/downloads/abiword/3.0.1/source/abiword-3.0.1.tar.gz
makepkg
cp *.pkg.* ../..
cd ..

