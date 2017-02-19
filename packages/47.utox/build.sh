#!/bin/sh
rm -rf src pkg utox
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/utox.tar.gz
tar -xvf utox*.tar*
cd utox

makepkg
cp *.pkg.* ../..
cd ..

