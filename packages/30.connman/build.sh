#!/bin/sh
rm -rf src pkg connman-gtk
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/connman-gtk.tar.gz
tar -xvf connman*.tar*
cd connman-gtk

patch -p0 -i ../p.patch

sed -i "s/--with-openconnect=dynamic/--with-openconnect=no/g" PKGBUILD
sed -i "s/'openconnect'//g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

