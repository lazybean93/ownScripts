if [ -z "$(command -v exiftool)" ]; then
	echo "This script needs exiftool"
	exit
fi

#exiftool $1 | grep 'Create Date' | sed 's/ : /\n/' | tail -n1 | sed 's/ /_/' | head -n1 | sed 's/://g'
exiftool -CreateDate $1 | sed 's/ : /\n/' | tail -n1 | sed 's/ /_/' | head -n1 | sed 's/://g'
