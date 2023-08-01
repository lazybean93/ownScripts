if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

RES="$(exiftool -ImageSize $1 | sed 's/ : /\n/g' | tail -n1 | sed 's/x/*/' | bc -l )"
if [ -z $RES ]; then
	echo "Error no Resolution, file will not moved"
	exit
else
	echo $RES
	if [ "100000000" -gt "$RES" ]; then
		mkdir $RES > /dev/null
		mv $1 $RES/
	fi;

fi
