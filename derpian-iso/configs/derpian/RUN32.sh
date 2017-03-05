#!/bin/sh
rm -rf work

sed -i 's|arch="x86_64"|arch="i686"|g' /usr/bin/mkarchiso
sed -i 's|arch=$(uname -m)|arch="i686"|g' /usr/bin/mkarchiso

rm -f /out/derpian*i686*.iso
rm -f /out-tmp/*.*
cat pkg32.txt > packages.both
LANG=EN_US ./build32.sh build single -A i686 &> BUILD.log

