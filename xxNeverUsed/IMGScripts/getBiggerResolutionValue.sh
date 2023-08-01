x=$(exiftool -ImageWidth "$1" | sed 's/ : /\n/g' | tail -n1)
y=$(exiftool -ImageHeight "$1" | sed 's/ : /\n/g' | tail -n1)

if [ $x -gt $y ]
then
	echo $x
else
	echo $y
fi
