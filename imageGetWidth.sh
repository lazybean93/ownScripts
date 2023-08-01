if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

exiftool -ImageWidth "$1" | sed 's/ : /\n/g' | tail -n1
