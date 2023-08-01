fdupes -r . > doubles.txt;
#cat doubles.txt | grep -C1 '\.\/A' | grep '\.\/B' | sed 's/^/rm "/g;s/$/"/g' > delete.sh;
#cat delete.sh;
#sh delete.sh
