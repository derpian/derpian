#!/bin/sh
rm -rf src pkg PKGBUILD
pak="lib32-mesa"
grp="community"
rm PKGBUILD
arr=`links -dump https://projects.archlinux.org/svntogit/$grp.git/tree/trunk?h=packages/$pak|sed -e 's/^[ \t]*//'|grep ^-|awk '{print $2}'`
for x in $arr
do
    echo "> https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak"
    wget -N https://projects.archlinux.org/svntogit/$grp.git/plain/trunk/$x?h=packages/$pak -O $x
done

sed -i "s/x11,drm,wayland/x11,drm/g" PKGBUILD
sed -i "s|'lib32-wayland'||g" PKGBUILD
sed -i "s|'lib32-libva'||g" PKGBUILD
sed -i "s|'libva'||g" PKGBUILD
sed -i "s|'lib32-mesa-libgl'||g" PKGBUILD
#sed -i "s/'wayland'//g" PKGBUILD

#sed -i "s/r300,r600,radeonsi//g" PKGBUILD
#sed -i "s/{r300}/r300/g" PKGBUILD
#sed -i "s/{r200,r300,r600,radeon,radeonsi}/{r200,radeon}/g" PKGBUILD
#sed -i '/libvdpau_{}/d' PKGBUILD
#sed -i '/libvdpau_r300/d' PKGBUILD
#sed -i '/pipe_{}/d' PKGBUILD
# sed -i '/vdpau\/libvdpau/d' PKGBUILD
#patch -p0 -i ff.patch

#patch -p0 -i ff2.patch
#patch -p0 -i f.patch
makepkg --skipinteg
# --nodeps --skipinteg

cp *.pkg.*xz ..
cd ..

