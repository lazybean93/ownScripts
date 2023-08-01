if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi
exiftool "$1"
