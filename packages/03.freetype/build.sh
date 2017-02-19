#!/bin/sh
rm -rf src pkg freetype2-infinality
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/freetype2-infinality.tar.gz
tar -xvf free*.tar*
cd freetype2-infinality
sed -i "s/--with-harfbuzz/--with-harfbuzz=no/g" PKGBUILD
sed -i "s/'harfbuzz'//g" PKGBUILD
cat ../pkg.txt > PKGBUILD
makepkg --skipinteg
cp *.pkg.* ../..
cd ..

