#!/bin/sh
rm -rf src pkg babl-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/babl-git.tar.gz
tar -xvf bab*.tar*
cd babl-git
makepkg
cp *.pkg.* ../..
cd ..
