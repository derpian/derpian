#!/bin/sh
rm -rf src pkg no-colord
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/no-colord.tar.gz
tar -xvf no*.tar*
cd no-colord
makepkg
cp -v no*.xz ../..
cd ..

