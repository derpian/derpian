#!/bin/sh
rm -rf src pkg repetier-host
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/repetier-host.tar.gz
tar -xvf repe*.tar*
cd repetier-host

#sed -i "s/'protobuf3'//g" PKGBUILD
#sed -i "s/protobuf3//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

