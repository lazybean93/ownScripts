#Days ahead to Create a folder

TIME=$(($(($(date --utc +%s)/86400))*86400))
TIME=$(($TIME-$(($1*86400))))

DIRNAME="$(date --utc --date='@'"$TIME" +'%Y.%m.%d - XXX')"
mkdir "$DIRNAME"
mv "$(date --utc --date='@'"$TIME" +'PXL_%Y%m%d')"* "$DIRNAME"
rmdir "$DIRNAME"
