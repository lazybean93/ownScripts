if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

RES="$(exiftool -ImageSize $1 | sed 's/ : /\n/g' | tail -n1 | sed 's/x/*/' | bc -l )"
if [ "100000000" -gt "$RES" ]; then
	mkdir $RES > /dev/null
	cp $1 $RES/
fi;
