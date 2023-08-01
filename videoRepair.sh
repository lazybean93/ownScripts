#This script cannot handle files in different folders than the execution path

filename=$(basename -- "$1")
filenameWithoutExtension="${filename%%.*}"
filenameExtension="${filename##*.}"
echo $filenameWithoutExtension
echo $filenameExtension
/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 ffmpeg -i "$filename" -c copy "$filenameWithoutExtension""_rep.""$filenameExtension"
