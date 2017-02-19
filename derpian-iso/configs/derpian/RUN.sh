#!/bin/sh
rm -rf work

mkdir /out /out-temp
rm -f /out/derpian*.iso
rm -f /out-tmp/*.*
LANG=EN_US ./build.sh build single &> BUILD.log

