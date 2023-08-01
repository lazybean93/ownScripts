Keyword=$1
LongLine="--------------------------------------------------------------"
Files=""
for i in $(ls | grep -v $0); do
	if [ ! -z "$(cat $i | grep "$1")" ]; then
		Files="$Files"" ""$i"
		echo $i;
		echo $LongLine
		cat $i | grep "$1";
		echo $LongLine
#		cat $i
#		echo $LongLine
	fi
done
echo "rm""$Files"
