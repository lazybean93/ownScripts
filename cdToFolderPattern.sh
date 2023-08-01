#Usage: ". cdToFolderPattern XXX"
#Result: Enters Folder that contains XXX

Folder="$(ls | grep "$1" | head -n1)"
echo '"'"$Folder"'"'
cd "$Folder"
