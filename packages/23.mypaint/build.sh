#!/bin/sh
rm -rf src pkg libmypaint-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/libmypaint-git.tar.gz
tar -xvf libmy*.tar*
cd libmypaint-git

makepkg
cp *.pkg.* ../..
cd ..

