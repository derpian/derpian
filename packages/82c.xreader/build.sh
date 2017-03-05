#!/bin/sh
rm -rf src pkg xreader-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/xreader-git.tar.gz
tar -xvf xreader*.tar*
cd xreader-git
patch -p0 -i ../p.patch
makepkg --skipinteg
cp *.pkg.* ../..
cd ..
