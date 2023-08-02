#samsung UE-40B6000
# Absolute path to this script. /home/user/bin/foo.sh
#SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
#SCRIPTPATH=`dirname $SCRIPT`

#getWidth.sh "$1"
#getHeight.sh "$1"
TARGET="$(echo $1 | sed 's/\.mp4/_enc\.mp4/g')"
ffmpeg -y -i "$1" -profile:v baseline "$TARGET";
