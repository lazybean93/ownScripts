if [ $# -lt 2 ]; then
    echo "Folder and Date must be passed"
    exit
fi

SECS=0
for i in $(ls "$1"); do
    echo ------------------------------------------------------------------------
    echo $i
    #echo $(date --date=@$SECS +%H:%M:%S)
    exiftool "$1"/"$i" -time:all="$2 $(date --date=@$SECS +%H:%M:%S)"
    exiftool "$1"/"$i" -time:all
    #exiftool "$1"/"$i" -X
    SECS=$(($SECS+1))
done