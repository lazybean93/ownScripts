#if [ ! -z "$(identify -verbose "$1" | grep "$2")" ];
if [ ! -z "$(exiftool "$1" | grep "$2")" ];
then
	mv $1 $3
fi
