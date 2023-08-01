# Absolute path to this script. /home/user/bin/foo.sh
#SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
#SCRIPTPATH=`dirname $SCRIPT`

#getWidth.sh "$1"
#getHeight.sh "$1"
TARGET="$(echo $1 | sed 's/\.mp4/_enc\.mp4/g' | sed 's/\.MP4/_enc\.mp4/g' )"
#if [ "$(getWidth.sh "$1")" -le "1920" ] && [ "$(getHeight.sh "$1")" -le "1920" ]; then
#	echo "ffmpeg -y -i \"""$1""\" \"""$TARGET""\""
#	ffmpeg -y -i "$1" -preset veryslow "$TARGET";
#	exit
#fi
#
#if [ "$(getWidth.sh "$1")" -le "1920" ]; then
#	echo "ffmpeg -y -i \"""$1""\" -vf scale=1080:1920 \"""$TARGET""\"";
#	ffmpeg -y -i "$1" -vf scale=1080:1920 -preset veryslow "$TARGET";
#	exit
#fi
#
#echo "ffmpeg -y -i \"""$1""\" -vf scale=1920:1080 \"""$TARGET""\"";
#ffmpeg -y -i "$1" -vf scale=1920:1080 -preset veryslow "$TARGET";
/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7 ffmpeg -y -i "$1" -c:v libx265 -preset veryslow "$TARGET";
#ffmpeg -vaapi_device /dev/dri/renderD128 -i "$1" -vf 'format=nv12,hwupload' -map 0:0 -c:v hevc_vaapi -map 0:a -c:a copy -rc_mode CQP "$TARGET"
