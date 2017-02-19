#!/bin/sh
rm -rf src pkg wcmcommander
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/wcmcommander.tar.gz
tar -xvf wcmcommand*.tar*
cd wcmcommander

makepkg
cp *.pkg.* ../..
cd ..

