# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`


OLIVER="$HOME"/Syncthing/PixelSync/Music
WIFE="$HOME""/Syncthing/Sync*Handy/NeUeMuSiK"

FolderPath="$($SCRIPTPATH/getNewestFolder.sh $PWD)"
FolderName="$(echo $FolderPath | sed 's/\//\n/g' | tail -n2)"

sh "$SCRIPTPATH"/downloadYoutubePlaylist.sh "$1"
rm -r "$OLIVER"/"$FolderName"
cp -r "$FolderPath" "$OLIVER"
if [ -n "$(cat "$HOME"/Downloads/OwnScripts/downloadYoutubePlaylistsToPhone.sh | grep 'RELEASED\|Aktuelle Clubsounds' | sed 's/ /\n/g' | grep "$1" )" ]; then
	rm -r "$WIFE"/"$FolderName"
	cp -r "$FolderPath" "$WIFE"
fi
rm -r "$($SCRIPTPATH/getNewestFolder.sh $PWD)"
