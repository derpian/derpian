#!/bin/sh
rm -rf src pkg broadcom-wl
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/broadcom-wl.tar.gz
tar -xvf broadcom*.tar*
cd broadcom-wl

patch -p0 -i ../p.patch
makepkg
cp *.pkg.* ../..
cd ..

