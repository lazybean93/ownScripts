PASS="MBCbflENloAU7ItzJHsC"
FILE="Abwesenheitszeiten_$(date +%Y%m%d)"
mv "$1" "$FILE".pdf
rar a -p"$PASS" "$FILE"-tmp.rar "$FILE".pdf
rar a -p"$PASS" "$FILE".rar "$FILE"-tmp.rar
rm "$FILE"-tmp.rar
zip "$FILE".zip "$FILE".rar
rm "$FILE".rar
