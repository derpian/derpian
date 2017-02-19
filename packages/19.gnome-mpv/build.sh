#!/bin/sh
rm -rf src pkg gnome-mpv
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-mpv.tar.gz
tar -xvf gnome*.tar*
cd gnome-mpv

makepkg
cp *.pkg.* ../..
cd ..

