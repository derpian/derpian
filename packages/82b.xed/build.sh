#!/bin/sh
rm -rf src pkg xed-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/xed-git.tar.gz
tar -xvf xed*.tar*
cd xed-git
patch -p0 -i ../p.patch
makepkg --skipinteg
cp *.pkg.* ../..
cd ..
