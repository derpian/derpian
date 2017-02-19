#!/bin/sh
rm -rf src pkg gegl-git
wget -N https://aur.archlinux.org/cgit/aur.git/snapshot/gegl-git.tar.gz
tar -xvf geg*.tar*
cd gegl-git

#cp PKGBUILD PKGBUILD1
#sed -i "s|'ruby'||g" PKGBUILD
#sed -i 's|--disable-docs|--disable-docs \&\& ./configure --prefix=/usr --disable-docs --enable-debug=0 --without-jasper --without-exiv2 --without-sdl --without-libavformat --without-libv4l --without-libspiro --without-graphviz|g' PKGBUILD
patch -p0 -i ../p1.patch

makepkg

cp *.pkg.* ../..
cd ..

