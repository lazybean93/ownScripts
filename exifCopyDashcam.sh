if [ $# -lt 1 ]; then
    echo "Folder and Date must be passed"
    exit
fi

for i in $(ls "$1" | grep '_enc.mp4'); do
    echo ------------------------------------------------------------------------
    echo $i
    
    #echo "$1"/"$i" | sed 's/_enc.mp4/\.MP4/g'
    exiftool -tagsFromFile $(echo "$1"/"$i" | sed 's/_enc.mp4/\.MP4/g') "$1"/"$i"
    exiftool "$1"/"$i" -time:all
done