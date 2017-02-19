#!/bin/sh
rm -rf src pkg gimp-gtk3-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-gtk3-git.tar.gz
tar -xvf gimp*.tar*
cd gimp-gtk3-git

sed -i "s|'libmng'||g" PKGBUILD
sed -i "s|'libexif'||g" PKGBUILD
sed -i "s|'ghostscript'||g" PKGBUILD
sed -i "s|--disable-gtk-doc|--without-webkit --disable-gtk-doc|g" PKGBUILD

makepkg
cp *.pkg.* ../..
cd ..

