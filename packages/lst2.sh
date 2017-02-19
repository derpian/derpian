#!/bin/sh
#pacman -Q |cut -f 1 -d " " > list.txt
while read p; do 
    echo "				<pkgname>$p</pkgname>"
done < list.txt
