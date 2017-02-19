#!/bin/sh
rm -rf src pkg libarcus
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/libarcus.tar.gz
tar -xvf libarc*.tar*
cd libarcus

sed -i "s/'protobuf3'//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

