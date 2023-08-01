echo $1

Folder=$1
Prefix="$(echo $1 | sed 's/ /\n/g' | head -n1)"
if [ $(echo $Prefix | wc -c) -ne 11 ]; then
	echo "Input not correct"
	exit
fi

SplitPrefix="$(echo "$Prefix" | sed 's/\./\n/g')"
if [ $(echo "$SplitPrefix" | wc -l) -ne 3 ]; then
	echo "Input not correct"
	exit
fi
if [ $(echo "$SplitPrefix" | grep -v [a-zA-Z] | wc -l) -ne 3 ]; then
	echo "Input not correct"
	exit
fi

Suffix="$(echo $Folder | cut -c 14-)"
echo $Suffix
mv "$Folder" "$(date +%Y.%m.%d)"" - ""$Suffix"
