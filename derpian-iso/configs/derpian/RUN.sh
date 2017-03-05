#!/bin/sh
rm -rf work

sed -i 's|arch="i686"|arch="x86_64"|g' /usr/bin/mkarchiso
sed -i 's|arch=$(uname -m)|arch="x86_64"|g' /usr/bin/mkarchiso

rm -f /out/derpian*x86_64*.iso
rm -f /out-tmp/*.*
cat pkg.txt > packages.both
LANG=EN_US ./build.sh build single -A x86_64 &> BUILD.log

