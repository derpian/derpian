#!/bin/sh
cat /etc/resolv.conf > li/etc/resolv.conf
mount --bind /dev li/dev
mount --bind /proc li/proc
mount --bind /sys li/sys
echo ok

