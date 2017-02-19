#!/bin/sh
sh ../repo-clean.sh
sh ../repo-init.sh && echo okay
sh ../repo-list.sh > ../pkg.txt
sh ../repo-xml.sh > ../pkg.xml
echo done



