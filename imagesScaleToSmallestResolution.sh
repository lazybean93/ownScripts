Value=$(. "$HOME"/Downloads/OwnScripts/getBiggerResolutionOfSmallestImage.sh)
echo $Value
IFS=$(echo -en "\n\r");
for i in $(find . -type f | grep -v '\.zip'); do
	convert "$i" -resize "$Value"x"$Value" -quality 70 "$i""_small_""$(date +%N)"".jpg";
done;

