if [ $# -lt 1 ]; then
	echo Argument 1, the filepath is missing!
	return
fi

if [ ! -f "$FILE" ]; then
	echo File \""$FILE"\" does not Exist!
	return
fi

FILE="$1"
echo "$FILE"
