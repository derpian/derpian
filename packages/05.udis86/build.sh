#!/bin/sh
rm -rf src pkg udis86
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/udis86.tar.gz
tar -xvf ud*.tar*
cd udis86
sed -i "s|/pkg/|/pkg/udis86/|g" PKGBUILD
makepkg
cp *.pkg.* ../..
cd ..
