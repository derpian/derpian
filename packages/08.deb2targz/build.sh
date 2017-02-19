#!/bin/sh
rm -rf src pkg deb2targz
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/deb2targz.tar.gz
tar -xvf de*.tar*
cd deb2targz
makepkg
cp *.pkg.* ../..
cd ..
