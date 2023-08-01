x=$(sh "$HOME"/Syncthing/Bilder/getResolution.sh $1 | awk '{split($0,a,"x"); print a[1]}')
y=$(sh "$HOME"/Syncthing/Bilder/getResolution.sh $1 | awk '{split($0,a,"x"); print a[2]}')
if [ $x -gt $y ]
then
	echo $y
else
	echo $x
fi
