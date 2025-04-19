#fdupes -r . > doubles.txt;
cat doubles.txt | grep -C1 'export' | sed 's/^/rm "/g;s/$/"/g' | grep -v 'rm "k"'> delete.sh;
cat delete.sh;
#sh delete.sh
