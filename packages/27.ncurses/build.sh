#!/bin/sh
rm -rf src pkg ncurses5-compat-libs
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/ncurses5-compat-libs.tar.gz
tar -xvf nc*.tar*
cd ncurses5-compat-libs
makepkg --skipinteg
cp *.pkg.* ../..
cd ..
