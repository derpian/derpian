#!/bin/sh
rm -rf src pkg yad
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/yad.tar.gz
tar -xvf yad*.tar*
cd yad

sed -i "s/'webkitgtk'//g" PKGBUILD
sed -i "s|--enable-icon-browser --enable-html|--enable-html=no|g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

