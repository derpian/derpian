#!/bin/sh
rm -rf src pkg cura-engine
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/cura-engine.tar.gz
tar -xvf cura*.tar*
cd cura-engine

sed -i "s/'protobuf3'//g" PKGBUILD
sed -i "s/protobuf3//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

