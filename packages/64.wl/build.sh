#!/bin/sh
rm -rf src pkg broadcom-wl-dkms
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/broadcom-wl-dkms.tar.gz
tar -xvf broadcom-wl-dkms*.tar*
cd broadcom-wl-dkms

makepkg --skipinteg
cp *.pkg.* ../..
cd ..

