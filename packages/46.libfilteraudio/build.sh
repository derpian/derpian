#!/bin/sh
rm -rf src pkg libfilteraudio
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/libfilteraudio.tar.gz
tar -xvf libfilteraudio*.tar*
cd libfilteraudio

makepkg --skipinteg
cp *.pkg.* ../..
cd ..

